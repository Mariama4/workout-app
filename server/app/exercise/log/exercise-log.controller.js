import expressAsyncHandler from 'express-async-handler';
import { Prisma } from '../../prisma.js';
import { addPrevValues } from '../../utils/add-prev-values.util.js';

export const createNewExerciseLog = expressAsyncHandler(async (req, res) => {
	const exerciseId = +req.params.id;

	const exercise = await Prisma.exercise.findUnique({
		where: {
			id: exerciseId,
		},
	});

	if (!exercise) {
		res.status(404);
		throw new Error('Exercise not found!');
	}

	let timesDefault = [];

	for (let i = 0; i < exercise.times; i++) {
		timesDefault.push({
			weight: 0,
			repeat: 0,
		});
	}

	try {
		const exerciseLog = await Prisma.exerciseLog.create({
			data: {
				user: {
					connect: {
						id: req.user.id,
					},
				},
				exercise: {
					connect: {
						id: exerciseId,
					},
				},
				times: {
					createMany: {
						data: timesDefault,
					},
				},
			},
			include: {
				times: true,
			},
		});

		res.json(exerciseLog);
	} catch (error) {
		res.status(404);
		throw new Error('Something wrong!');
	}
});

export const getExerciseLog = expressAsyncHandler(async (req, res) => {
	const exerciseLog = await Prisma.exerciseLog.findUnique({
		where: { id: +req.params.id },
		include: {
			exercise: true,
			times: {
				orderBy: {
					id: 'asc',
				},
			},
		},
	});

	if (!exerciseLog) {
		res.status(404);
		throw new Error('Exercise log not found!');
	}

	const prevExerciseLog = await Prisma.exerciseLog.findFirst({
		where: {
			exerciseId: exerciseLog.exerciseId,
			userId: req.user.id,
			isCompleted: true,
		},
		orderBy: {
			createdAt: 'desc',
		},
	});

	const newTimes = addPrevValues(exerciseLog, prevExerciseLog);

	res.json({ ...exerciseLog, times: newTimes });
});

export const updateExerciseLogTime = expressAsyncHandler(async (req, res) => {
	const { weight, repeat, isCompleted } = req.body;
	try {
		const exerciseLogTime = await Prisma.exerciseTime.update({
			where: {
				id: +req.params.id,
			},
			data: {
				weight,
				repeat,
				isCompleted,
			},
		});

		res.json(exerciseLogTime);
	} catch (error) {
		res.status(404);
		throw new Error('Exercise log time not found!');
	}
});

export const patchCompleteExerciseLog = expressAsyncHandler(
	async (req, res) => {
		const { isCompleted } = req.body;

		try {
			const exerciseLog = await Prisma.exerciseLog.update({
				where: {
					id: +req.params.id,
				},
				data: {
					isCompleted,
				},
				include: {
					exercise: true,
					workoutLog: true,
				},
			});

			res.json(exerciseLog);
		} catch (error) {
			res.status(404);
			throw new Error('Exercise log not found');
		}
	},
);

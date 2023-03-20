import expressAsyncHandler from 'express-async-handler';
import { Prisma } from '../../prisma.js';
import { calculateMinute } from '../../utils/calculate-minute.util.js';

export const createNewWorkoutLog = expressAsyncHandler(async (req, res) => {
	const workoutId = +req.params.id;

	const workout = await Prisma.workout.findUnique({
		where: {
			id: workoutId,
		},

		include: {
			exercises: true,
		},
	});

	if (!workout) {
		res.status(404);
		throw new Error('Workout not found!');
	}

	const workoutLog = await Prisma.workoutLog.create({
		data: {
			user: {
				connect: {
					id: req.user.id,
				},
			},
			workout: {
				connect: {
					id: workoutId,
				},
			},
			exerciseLogs: {
				create: workout.exercises.map((exercise) => ({
					user: {
						connect: {
							id: req.user.id,
						},
					},
					exercise: {
						connect: {
							id: exercise.id,
						},
					},
					times: {
						create: Array.from({ length: exercise.times }, () => ({
							weight: 0,
							repeat: 0,
						})),
					},
				})),
			},
		},
		include: {
			exerciseLogs: {
				include: {
					times: true,
				},
			},
		},
	});

	res.json(workoutLog);
});

export const getWorkoutLog = expressAsyncHandler(async (req, res) => {
	const workoutLog = await Prisma.workoutLog.findUnique({
		where: {
			id: +req.params.id,
		},
		include: {
			workout: {
				include: {
					exercises: true,
				},
			},
			exerciseLogs: {
				orderBy: {
					id: 'asc',
				},
				include: {
					exercise: true,
				},
			},
		},
	});

	if (!workoutLog) {
		res.status(404);
		throw new Error('Workout Log not found!');
	}

	res.json({
		...workoutLog,
		minute: calculateMinute(workoutLog.workout.exercises.length),
	});
});

export const updateCompleteWorkoutLog = expressAsyncHandler(
	async (req, res) => {
		const logId = +req.params.id;

		try {
			const workoutLog = await Prisma.workoutLog.update({
				where: {
					id: logId,
				},
				data: {
					isCompleted: true,
				},
			});

			res.json(workoutLog);
		} catch (error) {
			res.status(404);
			throw new Error('Workout log not found!');
		}
	},
);

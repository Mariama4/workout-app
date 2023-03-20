import expressAsyncHandler from 'express-async-handler';
import { Prisma } from '../prisma.js';
import { calculateMinute } from '../utils/calculate-minute.util.js';

export const createNewWorkout = expressAsyncHandler(async (req, res) => {
	const { title, exerciseIds } = req.body;

	try {
		const workout = await Prisma.workout.create({
			data: {
				title,
				exercises: {
					connect: exerciseIds.map((id) => ({ id: +id })),
				},
			},
		});

		res.json(workout);
	} catch (error) {
		res.status(404);
		throw new Error('Something wrong!');
	}
});

export const updateWorkout = expressAsyncHandler(async (req, res) => {
	const { title, exerciseIds } = req.body;

	try {
		const workout = await Prisma.workout.update({
			where: { id: +req.params.id },
			data: {
				title,
				exercises: {
					set: exerciseIds.map((id) => ({ id: +id })),
				},
			},
		});
		res.json(workout);
	} catch (error) {
		res.status(404);
		throw new Error('Workout not found');
	}
});

export const deleteWorkout = expressAsyncHandler(async (req, res) => {
	try {
		const workout = await Prisma.workout.delete({
			where: { id: +req.params.id },
		});
		res.json({ message: 'Workout deleted' });
	} catch (error) {
		res.status(404);
		throw new Error('Workout not found');
	}
});

export const getWorkout = expressAsyncHandler(async (req, res) => {
	try {
		const workout = await Prisma.workout.findUnique({
			where: {
				id: +req.params.id,
			},
			include: {
				exercises: true,
			},
		});

		const minutes = calculateMinute(workout.exercises.length);

		res.json({ ...workout, minutes });
	} catch (error) {
		res.status(404);
		throw new Error('Workout not found');
	}
});

export const getWorkouts = expressAsyncHandler(async (req, res) => {
	try {
		const workouts = await Prisma.workout.findMany({
			orderBy: {
				createdAt: 'desc',
			},
			include: {
				exercises: true,
			},
		});
		res.json(workouts);
	} catch (error) {
		res.status(404);
		throw new Error('Workout not found');
	}
});

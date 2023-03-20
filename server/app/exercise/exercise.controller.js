import expressAsyncHandler from 'express-async-handler';
import { Prisma } from '../prisma.js';

export const createNewExercise = expressAsyncHandler(async (req, res) => {
	const { title, times, iconPath } = req.body;

	const exercise = await Prisma.exercise.create({
		data: {
			title,
			times,
			iconPath,
		},
	});

	res.json(exercise);
});

export const updateExercise = expressAsyncHandler(async (req, res) => {
	const { title, times, iconPath } = req.body;

	try {
		const exercise = await Prisma.exercise.update({
			where: { id: +req.params.id },
			data: {
				title,
				times,
				iconPath,
			},
		});
		res.json(exercise);
	} catch (error) {
		res.status(404);
		throw new Error('Exercise not found');
	}
});

export const deleteExercise = expressAsyncHandler(async (req, res) => {
	try {
		const exercise = await Prisma.exercise.delete({
			where: { id: +req.params.id },
		});
		res.json({ message: 'Exercise deleted' });
	} catch (error) {
		res.status(404);
		throw new Error('Exercise not found');
	}
});

export const getExercises = expressAsyncHandler(async (req, res) => {
	const exercises = await Prisma.exercise.findMany({
		orderBy: {
			createdAt: 'desc',
		},
	});

	res.json(exercises);
});

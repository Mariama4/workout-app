import expressAsyncHandler from 'express-async-handler';
import { Prisma } from '../prisma.js';
import { calculateMinute } from '../utils/calculate-minute.util.js';
import { UserFields } from '../utils/user.utils.js';

export const getUserProfile = expressAsyncHandler(async (req, res) => {
	const user = await Prisma.user.findUnique({
		where: {
			id: req.user.id,
		},
		select: UserFields,
	});

	const countExerciseTimesCompleted = await Prisma.exerciseLog.count({
		where: {
			userId: req.user.id,
			isCompleted: true,
		},
	});

	const kgs = await Prisma.exerciseTime.aggregate({
		where: {
			exerciseLog: {
				userId: req.user.id,
			},
			isCompleted: true,
		},

		_sum: {
			weight: true,
		},
	});

	const workouts = await Prisma.workoutLog.count({
		where: {
			userId: user.id,
			isCompleted: true,
		},
	});

	res.json({
		...user,
		statistics: [
			{
				label: 'Minutes',
				value: calculateMinute(countExerciseTimesCompleted) || 0,
			},
			{
				label: 'Workouts',
				value: workouts,
			},
			{
				label: 'Kgs',
				value: kgs._sum.weight || 0,
			},
		],
	});
});

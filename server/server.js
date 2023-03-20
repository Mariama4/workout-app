import express from 'express';
import authRouter from './app/auth/auth.routes.js';
import userRouter from './app/user/user.routes.js';
import exerciseRouter from './app/exercise/exercise.routes.js';
import workoutsRouter from './app/workout/workout.routes.js';
import * as dotenv from 'dotenv';
import morgan from 'morgan';
import { Prisma } from './app/prisma.js';
import { errorHandler, notFound } from './app/middleware/error.middleware.js';
import path from 'path';
import cors from 'cors';
dotenv.config();

const app = express();

async function main() {
	if (process.env.NODE_ENV == 'development') app.use(morgan('dev'));

	app.use(cors());
	app.use(express.json());

	const __dirname = path.resolve();

	app.use('/uploads', express.static(path.join(__dirname, '/uploads/')));

	app.use('/api/auth', authRouter);
	app.use('/api/users', userRouter);
	app.use('/api/exercises', exerciseRouter);
	app.use('/api/workouts', workoutsRouter);

	app.use(notFound);
	app.use(errorHandler);

	const PORT = process.env.PORT || 5050;

	app.listen(
		PORT,
		console.log(
			`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`,
		),
	);
}

main()
	.then(async () => {
		await Prisma.$disconnect();
	})
	.catch(async (error) => {
		console.error(error);
		await Prisma.$disconnect();
		process.exit(1);
	});

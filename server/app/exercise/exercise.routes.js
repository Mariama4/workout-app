import express from 'express';
import { protect } from '../middleware/auth.middleware.js';
import {
	createNewExercise,
	deleteExercise,
	getExercises,
	updateExercise,
} from './exercise.controller.js';
import {
	createNewExerciseLog,
	getExerciseLog,
	patchCompleteExerciseLog,
	updateExerciseLogTime,
} from './log/exercise-log.controller.js';

const router = express.Router();

router.route('/').post(protect, createNewExercise).get(protect, getExercises);

router
	.route('/:id')
	.put(protect, updateExercise)
	.delete(protect, deleteExercise);

router
	.route('/log/:id')
	.get(protect, getExerciseLog)
	.post(protect, createNewExerciseLog);

router.route('/log/complete/:id').patch(protect, patchCompleteExerciseLog);

router.route('/log/time/:id').put(protect, updateExerciseLogTime);

export default router;

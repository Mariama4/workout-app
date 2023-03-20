import express from 'express';
import { protect } from '../middleware/auth.middleware.js';
import { getUserProfile } from './user.controller.js';

const router = express.Router();

router.get('/profile', protect, getUserProfile);

export default router;

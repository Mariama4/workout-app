import expressAsyncHandler from 'express-async-handler';
import { Prisma } from '../prisma.js';
import { UserFields } from '../utils/user.utils.js';
import jwt from 'jsonwebtoken';

export const protect = expressAsyncHandler(async (req, res, next) => {
	let token;
	if (req.headers.authorization?.startsWith('Bearer')) {
		token = req.headers.authorization.split(' ')[1];

		if (!token) {
			res.status(401);
			throw new Error('Not authorized, I do not have a token');
		}

		const decoded = jwt.verify(token, process.env.JWT_SECRET);

		const userFound = await Prisma.user.findUnique({
			where: {
				id: decoded.userId,
			},
			select: UserFields,
		});

		if (userFound) {
			req.user = userFound;
			next();
		} else {
			res.status(401);
			throw new Error('Not authorized, token failed');
		}
	} else {
		res.status(401);
		throw new Error('Not authorized, token failed');
	}
});

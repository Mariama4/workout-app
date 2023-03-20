import { faker } from '@faker-js/faker';
import { hash, verify } from 'argon2';
import expressAsyncHandler from 'express-async-handler';
import { Prisma } from '../prisma.js';
import { UserFields } from '../utils/user.utils.js';
import { generateToken } from './generate-token.js';

export const authUser = expressAsyncHandler(async (req, res) => {
	const { email, password } = req.body;
	const user = await Prisma.user.findUnique({
		where: {
			email,
		},
	});
	const isValidPassword = await verify(user.password, password);

	if (user && isValidPassword) {
		const token = generateToken(user.id);
		res.json({ user, token });
	} else {
		res.status(401);
		throw new Error('Email or password are not correct');
	}
});

export const registerUser = expressAsyncHandler(async (req, res) => {
	const { email, password } = req.body;

	const isHaveUser = await Prisma.user.findUnique({
		where: {
			email,
		},
	});

	if (isHaveUser) {
		res.status(400);
		throw new Error('User already exists');
	}

	const user = await Prisma.user.create({
		data: {
			email,
			password: await hash(password),
			name: faker.name.fullName(),
		},
		select: UserFields,
	});

	const token = generateToken(user.id);

	res.json({ user, token });
});

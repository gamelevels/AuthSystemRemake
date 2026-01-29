const express = require('express');
const User = require('../../models/User');

const userRouter = express.Router();

userRouter.post('/register', (req, res, next) => {
    console.log(req.body);
    console.log(req.headers);
    next();
});

userRouter.post('/login', (req, res, next) => {
    next();
});

userRouter.get('/profile', (req, res, next) => {
    next();
});

module.exports = userRouter;
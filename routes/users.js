const express = require('express');
const User = require('../controller/user');

const router = express.Router();

// user register
router.post('/register', User.createUser);

// login user
router.post('/login', User.userLogin);

router.get('/test', (req, res) => {
  res.status(200).json({ message: 'reached resource successfully' });
});

// user login

module.exports = router;

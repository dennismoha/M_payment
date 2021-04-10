/* eslint-disable no-unused-vars */
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../config/database');
// register user
exports.createUser = (req, res, next) => {
  const { email } = req.body;
  const { password } = req.body;

  db.execute('select * from users WHERE email = ?', [email])
    // eslint-disable-next-line no-unused-vars
    .then(([results, fields]) => {
      if (results.length === 0) {
        bcrypt.hash(password, 10).then((hashedPassword) => {
          db.execute('INSERT INTO users ( email, password) values(?, ?)', [
            email,
            hashedPassword,
          ]).then(() => res.status(201).json({ message: 'Registered Successfully' }));
        });
      } else {
        return res.status(404).json({ message: 'That email exists' });
      }
      return null;
    })
    .catch((err) => {
      next(err);
    });
};

// login section
exports.userLogin = (req, res, next) => {
  const { email } = req.body;
  const { password } = req.body;

  db.execute('SELECT * from users WHERE email = ?', [email])
    .then(([user, rowdata]) => {
      if (user.length !== 0) {
        bcrypt.compare(password, user[0].password)
          .then((isEqual) => {
            if (!isEqual) {
              return res.status(401).json({ message: 'email or password is incorrect' });
            }
            const userId = user[0].email;
            const token = jwt.sign({ userId }, `${process.env.SECRET}`, { expiresIn: '1h' });
            return res.status(200).json({ token, userId });
          });
      } else {
        return res.status(404).json({ message: 'email does not exist' });
      }
      return null;
    })
    .catch((error) => {
      next(error);
    });
};

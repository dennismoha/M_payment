/* eslint-disable no-unused-vars */
const createError = require('http-errors');
const express = require('express');
const dotenv = require('dotenv').config();
const path = require('path');
const logger = require('morgan');
const helmet = require('helmet');

const virtualCardRouter = require('./routes/card');
const usersRouter = require('./routes/users');

const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(helmet());
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader(
    'Access-Control-Allow-Methods',
    'OPTIONS, GET, POST, PUT, PATCH, DELETE'
  );
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, 'public')));

app.use('/virtualcard', virtualCardRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError(404));
});

// error handler
app.use((err, req, res, next) => {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  // res.render('error');

  res.status(err.status).json({ message: err });
});

// module.exports = app;
app.listen(process.env.PORT || 3000, (err) => {
  if (err) {
    // eslint-disable-next-line no-console
    console.log('error in the server ', err);
  }
  // eslint-disable-next-line no-console
  console.log('server UP and successful');
});

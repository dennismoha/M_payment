const express = require('express');
const { body } = require('express-validator');
const isAuth = require('../config/auth');
const cardController = require('../controller/index');

const router = express.Router();

router.get('/test', isAuth, (req, res) => {
  const { userId } = req;
  res.status(200).json({ message: 'reached resource successfully', userId });
});

router.post('/createcard', isAuth, [
  body('amount').trim().isCurrency().not()
    .isEmpty()
    .withMessage('Amount cannot be empty'),
  body('billing_name').trim().isCurrency().not()
    .isEmpty()
    .withMessage('Billing name cannot be empty'),
  body('billing_address').trim().isCurrency().not()
    .isEmpty()
    .withMessage('Billing address cannot be empty'),
  body('city').trim().isCurrency().not()
    .isEmpty()
    .withMessage('city cannot be empty'),
  body('billing_state').trim().isCurrency().not()
    .isEmpty()
    .withMessage('Billing state cannot be empty'),
  body('billing_postal_code').trim().isCurrency().not()
    .isEmpty()
    .withMessage('Billing postal code cannot be empty'),
  body('billing_country').trim().isCurrency().not()
    .isEmpty()
    .withMessage('Billing country cannot be empty')
], cardController.createCard);

// /* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });
// //card
// router.get('/card', function(req, res, next) {
//   res.render('card');
// });
// //form
// router.get('/form', function(req, res, next) {
//   res.render('form');
// });

module.exports = router;

const express = require('express');
const { body } = require('express-validator');
const isAuth = require('../config/auth');
const cardController = require('../controller/index');

const router = express.Router();

router.get('/virtual-card/:id/', isAuth, cardController.singleVirtualCard); // get a single virtual card using the virtual card id
router.get('/virtual-card/:id', isAuth, cardController.callBack); // url callback
router.get('/virtual-cards', isAuth, cardController.allVirtualCards); //  Get all Virtual cards
router.put('/virtual-cards/:id/fund', isAuth, cardController.fundVirtualCard); // updated a card

router.post(
  '/createcard',
  isAuth,
  [
    body('amount')
      .trim()
      .isCurrency()
      .not()
      .isEmpty()
      .withMessage('Amount cannot be empty'),
    body('billing_name')
      .trim()
      .not()
      .isEmpty()
      .withMessage('Billing name cannot be empty'),
    body('billing_address')
      .trim()
      .not()
      .isEmpty()
      .withMessage('Billing address cannot be empty'),
    body('billing_city')
      .trim()
      .not()
      .isEmpty()
      .withMessage('city cannot be empty'),
    body('billing_estate')
      .trim()
      .not()
      .isEmpty()
      .withMessage('Billing state cannot be empty'),
    body('billing_postal_code')
      .trim()
      .not()
      .isEmpty()
      .withMessage('Billing postal code cannot be empty'),
    body('billing_country')
      .trim()
      .not()
      .isEmpty()
      .withMessage('Billing country cannot be empty'),
  ],
  cardController.createCard
);

module.exports = router;

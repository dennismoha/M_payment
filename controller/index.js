/* eslint-disable camelcase */
const { validationResult } = require('express-validator');
const db = require('../config/database');

exports.createCard = (req, res) => {
  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    const error = new Error('Validation failed.');
    error.statusCode = 422;
    error.data = errors.array();
    throw error;
  }

  const { amount } = req.body;
  const { billing_name } = req.body;
  const { billing_address } = req.body;
  const { city } = req.body;
  const { billing_state } = req.body;
  const { billing_postal_code } = req.body;
  const { billing_country } = req.body;
  const callback_url = req.query.callbackUrl;

  db.execute('INSERT INTO card (amount, billing_name , billing_address , city , billing_state, billing_postal_code , billing_country) VALUES(?,?,?,?,?,?,?)',
    // eslint-disable-next-line max-len
    [amount, billing_name, billing_address, city, billing_state, billing_postal_code, billing_country])
    .then(([results, fieldData])=>{
      //
    })
    .catch();

  console.log(req.body);
  const callbackUrl = '/users/test';
  return res.redirect(callbackUrl);
};

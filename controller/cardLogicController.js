/* eslint-disable camelcase */
const { validationResult } = require('express-validator');
const db = require('../config/database');
// eslint-disable-next-line no-unused-vars
exports.createCard = (req, res, next) => {
  const errors = validationResult(req);
  // const callbBackUrl = req.body.callBackUrl

  if (!errors.isEmpty()) {
    return res.status(401).json({ errors, message: 'validation failed' });
  }
  const { currency } = req.body;
  const { amount } = req.body;
  const { billing_name } = req.body;
  const { billing_address } = req.body;
  const { billing_city } = req.body;
  const { billing_estate } = req.body;
  const { billing_postal_code } = req.body;
  const { billing_country } = req.body;
  const { userId } = req;

  db.execute(
    'INSERT INTO card (currency, amount, billing_name, billing_address, billing_city, billing_estate, billing_postal_code, billing_country, userId) values (?, ?, ?,?,?,?,?,?,?)',
    [
      currency,
      amount,
      billing_name,
      billing_address,
      billing_city,
      billing_estate,
      billing_postal_code,
      billing_country,
      userId,
    ]
  )
    // eslint-disable-next-line no-unused-vars
    .then(([results]) => {
      const callback_url = `/virtualcard/virtual-card/${results.insertId}`;
      return res.redirect(callback_url);
    })
    .catch((err) => res.status(401).json({ message: ' error', err }));
  return null;
};

// callback logic

// eslint-disable-next-line no-unused-vars
exports.callBack = (req, res, next) => {
  const { userId } = req;
  const { id } = req.params;

  db.execute('SELECT * FROM card WHERE userId = ? AND id = ?', [userId, id])
    .then((card) => {
      if (!card) {
        return res.status(401).json({ message: 'UnAuthorized / no user' });
      }
      return res.status(200).json({
        status: 'Success',
        message: 'Card created successfully',
        data: card[0],
      });
    })
    .catch((error) => res.status(404).json({ message: error }));
};

// get all virtual cards
exports.allVirtualCards = (req, res) => {
  const { userId } = req;
  db.execute('SELECT * FROM card WHERE userId = ? And delete_card = ?  ', [userId, 'False'])
    .then((card) => {
      if (!card) {
        return res.status(404).json({ message: ' not found' });
      }
      return res.status(200).json({ card });
    })
    .catch((error) => res.status(400).json(error));
};

// Get a Single Virtual card
exports.singleVirtualCard = (req, res) => {
  const { userId } = req;
  const { id } = req.params;

  db.execute('SELECT * FROM card WHERE userId = ? AND id = ? AND delete_card = ? and status_action = ? ', [userId, id, 'False', 'notBlocked'])
    .then((card) => {
      if (!card) {
        return res.status(401).json({ });
      }
      return res.status(200).json({
        status: 'Success',
        message: 'Card fetched successfully',
        data: card[0],
      });
    })
    .catch((error) => res.status(404).json({ message: error }));
};

// fund a card
exports.fundVirtualCard = (req, res) => {
  const { userId } = req;
  const { id } = req.params;
  const { Amount } = req.body;

  db.execute('UPDATE card SET amount = amount + ?  WHERE id = ? AND userId = ?', [Amount, id, userId])
    .then((results) => {
      console.log(results);
      return res.status(201).json(results); // check the status for this
    })
    .catch(((error) => {
      res.json(error);
    }));
};

/* check on this issue before the next route
   debit_currency
   string
   Use this if you want to debit a different balance
   on Flutterwave to fund your card e.g. you are funding a USD card but
   you want to debit your NGN balance to fund the card

*/

// terminate a virtual card
exports.terminateVirtualCard = (req, res) => {
  const { userId } = req;
  const { id } = req.params;

  db.execute('UPDATE card SET delete_card = ? WHERE id= ? AND userId= ? ', ['True', id, userId])
    .then(() => {
      const data = null;
      return res.status(200).json({ status: 'Success', message: 'card Terminated successfully', data });
    })
    .catch((error) => res.status(404).json(error));
};

// Get all virtual card transactions
exports.getVirtualCardTransactions = (req, res) => {
  const { userId } = req;
  const { id } = req.params;
  const {
    date_from, date_to, index, size
  } = req.query;

  db.execute('SELECT * FROM card_transactions WHERE userID = ? AND id = ? AND date_column BETWEEN date_from AND date_to LIMIT = ?,index =?',
    [userId, id, date_from, date_to, size, index])
    .then(([results]) => res.status(200).json({ status: 'Success', message: 'Card transactions fetched successfu', data: results }))
    .catch((error) => res.status(400).json({ error }));
};

// withdraw

exports.withDrawFromVirtualCard = (req, res) => {
  const { userId } = req;
  const { id } = req.params;
  const { Amount } = req.body;

  db.execute('UPDATE  card SET amount = if(amount >=  ? , amount - ? ,amount) where id = ? and userId = ?',
    [Amount, Amount, id, userId])
    .then(([resultData]) => {
      if (resultData.changedRows === 1) {
        return res.status(200).json({ message: 'Withdrawn successfully' });
      }
      return res.json({ message: 'check your balance account' });
    })
    .catch((error) => res.status(400).json(error));
};

// Block or ublock card
exports.blockVirtualCards = (req, res) => {
  const { ownerCardNameId } = req.body;
  const { id } = req.params;
  const { status_action } = req.query;
  status_action.trim();

  db.execute('UPDATE card SET status_action = ? WHERE id = ? AND userId = ? ', [status_action, id, ownerCardNameId])
    .then(() => {
      if (status_action === 'unblocked') {
        return res.status(200).json({ status: 'Success', message: 'Card unblocked succesfully successful' }); // card is unblocked
      }
      return res.status(200).json({ status: 'Success', message: 'Card freeze successful' }); // card is blocked
    })
    .catch((error) => res.status(400).json({ message: 'bad request', error }));
};

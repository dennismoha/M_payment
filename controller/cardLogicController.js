/* eslint-disable no-underscore-dangle */
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
  let callback_url = '/virtualcard/virtual-card/';

  db.execute('call moyalo.insertcard(?,?,?,?,?,?,?,?,?,?)', [
    currency,
    amount,
    billing_name,
    billing_address,
    billing_city,
    billing_estate,
    billing_postal_code,
    billing_country,
    userId,
    callback_url,
  ])
    // eslint-disable-next-line no-unused-vars
    .then(([results]) => {
      const { id } = results[0];
      callback_url = `/virtualcard/virtual-card/cb/${id}`; // Ask about the correct redirect url
      return res.status(201).json(results);
    })
    .catch((err) => res.status(401).json({ message: err }));
  return null;
};

// callback logic
// eslint-disable-next-line no-unused-vars
exports.callBack = (req, res, next) => {
  const { userId } = req;
  const { id } = req.params;
  const results = 0;
  db.execute(' call moyalo.getASingleCard(?, ?, ?)', [userId, id, results])
    // eslint-disable-next-line no-unused-vars
    .then(([card, field]) => {
      if (!card) {
        return res.status(401).json({ });
      }
      return res.status(200).json({
        status: 'Success',
        message: 'Card created successfully',
        data: card[0],
      });
    })
    .catch((error) => res.status(404).json({ message: error, messages: 'callbac' }));
};

// get all virtual cards for a user NB: freezed / terminated virtual cards are not returned
exports.allVirtualCards = (req, res) => {
  const { userId } = req;
  db.execute('call getAllVirtualCards(?)', [userId])
    .then((card) => {
      if (!card) {
        return res.status(404).json({ message: ' not found' });
      }
      return res.status(200).json(card[0][0]);
    })
    .catch((error) => res.status(400).json(error));
};

// Get a Single Virtual card
exports.singleVirtualCard = (req, res) => {
  const { userId } = req;
  const { id } = req.params;
  const results = 0;

  db.execute(' call getASingleCard(? , ?, ? )', [userId, id, results])
    // eslint-disable-next-line no-unused-vars
    .then(([field, card]) => {
      if (field[0].length === 0) {
        return res.status(401).json({ message: 'no card' });
      }
      return res.status(200).json({
        status: 'Success',
        message: 'Card fetched successfully',
        data: field[0],
      });
    })
    .catch((error) => res.status(404).json({ message: error }));
};

// fund a virtual card controller
exports.fundVirtualCard = async (req, res) => {
  const { userId } = req;
  const { id } = req.params;
  const { Amount } = req.body;
  let conn = null;

  // remember to return the default currency

  try {
    conn = await db.getConnection();
    await conn.beginTransaction('start transaction');
    const [response] = await conn.execute('call fundVirtualCard(?, ?, ?,@results1,@results2)', [id, userId, Amount]);
    const data = response[0];
    const updatedAmount = data[0].balanceAmount;
    const currency = 'usd';
    const actionTaken = `amount updated to ,${updatedAmount}`;
    const whoMadeChanges = `username: ${userId}  ' role: ' ${req.role}`;
    await db.execute('call cardsLogAfterUpdate(?, ?, ?, ?, ?, ?,?, ?,@success)', [id, userId, updatedAmount, currency, 'NO', 'NO', actionTaken, whoMadeChanges]);
    res.status(201).json({ data });
    await conn.commit();
  } catch (error) {
    if (conn) await conn.rollback;
    res.status(400).json(error);
  } finally {
    if (conn) await conn.release();
  }
};

/* check on this issue before the next route
   debit_currency
   string
   Use this if you want to debit a different balance
   on Flutterwave to fund your card e.g. you are funding a USD card but
   you want to debit your NGN balance to fund the card

*/

// terminate a virtual card
exports.terminateVirtualCard = async (req, res) => {
  const { userId } = req;
  const { id } = req.params;
  let conn = '';

  try {
    conn = await db.getConnection();
    await conn.beginTransaction('start transaction');
    const [response] = await conn.execute('call terminateVirtualCard(?, ?, @terminateStatus,@currency,@freezes,@amounts) ', [userId, id]);
    const amount = response[0][0].amounts;
    const freeze = response[0][0].freezes;
    const currency = response[0][0].currencys;
    const { terminateStatus } = response[0][0];

    const actionTaken = `terminated ? ,${terminateStatus}`;
    const whoMadeChanges = `username: ${userId}  ' role: ' ${req.role}`;
    await db.execute('call cardsLogAfterUpdate(?, ?, ?, ?, ?, ?,?, ?,@success)', [id, userId, amount, currency, freeze, terminateStatus, actionTaken, whoMadeChanges]);
    res.status(201).json({ status: 'success', message: 'card terminated successfully', terminateStatus });
    await conn.commit();
  } catch (error) {
    if (conn) await conn.rollback;
    res.status(400).json(error);
  } finally {
    if (conn) await conn.release();
  }
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

exports.withDrawFromVirtualCard = async (req, res) => {
  const { userId } = req;
  const { id } = req.params;
  const { Amount } = req.body;

  // CHECK IF AMOUNT TO BE WITHDRAWN IS <= 0 AND THROW AN ERROR

  let conn = null;

  // remember to return the default currency

  try {
    conn = await db.getConnection();
    await conn.beginTransaction('start transaction');
    const [response] = await conn.execute('call withDrawFromCard(?, ?, ?, @currentAccountBalance,@currency )', [Amount, id, userId]);
    const data = response[0][0].currentAccountBalance;

    const updatedAmount = response[0][0].currentAccountBalance;
    const currency = response[0][0].currencys;
    const actionTaken = `Amount withdrawn:balance ,${data}`;
    const whoMadeChanges = `username: ${userId}  ' role: ' ${req.role}`;
    await db.execute('call cardsLogAfterUpdate(?, ?, ?, ?, ?, ?,?, ?,@success)', [id, userId, updatedAmount, currency, 'NO', 'NO', actionTaken, whoMadeChanges]);
    res.status(201).json({ data });
    await conn.commit();
  } catch (error) {
    if (conn) await conn.rollback;
    res.status(400).json(error);
  } finally {
    if (conn) await conn.release();
  }
};

// FREEZE or ublock card :  NB: never implemented the req.query
exports.blockVirtualCards = async (req, res) => {
  // const { status_action } = req.query;
  const { userId } = req.body; // user email id
  const cardId = req.params.id; // card id
  let conn = '';

  try {
    conn = await db.getConnection();
    await conn.beginTransaction('start transaction');
    const [response] = await conn.execute('call freezeVirtualCard(?, ?,@freezeStatus,@amount,@currency)', [userId, cardId]);

    const status1_action = response[0];
    const results = status1_action.filter((statusAction) => statusAction);
    const data = results[0].freezeStatus_;
    const updatedAmount = results[0].amounts;
    const currency = results[0].currencys;
    const actionTaken = `freezed ? ,${data}`;
    const whoMadeChanges = `username: ${userId}  ' role: ' ${req.role}`;

    await db.execute('call cardsLogAfterUpdate(?, ?, ?, ?, ?, ?,?, ?,@success)', [cardId, userId, updatedAmount, currency, data, 'NO', actionTaken, whoMadeChanges]);

    const message = data === 'NO' ? 'successfully unfreezed' : 'freezed succesfully';

    res.status(201).json({ message, data });
    await conn.commit();
  } catch (error) {
    if (conn) await conn.rollback;
    res.status(400).json(error);
  } finally {
    if (conn) await conn.release();
  }
};

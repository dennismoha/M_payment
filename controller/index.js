/* eslint-disable quotes */
/* eslint-disable camelcase */
const { validationResult } = require("express-validator");
const db = require("../config/database");

// eslint-disable-next-line no-unused-vars
exports.createCard = (req, res, next) => {
  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    return res.status(401).json({ errors, message: "validation failed" });
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
    "INSERT INTO card (currency, amount, billing_name, billing_address, billing_city, billing_estate, billing_postal_code, billing_country, userId) values (?, ?, ?,?,?,?,?,?,?)",
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
    .catch((err) => res.status(401).json({ message: " error", err }));
  return null;
};

// callback logic

// eslint-disable-next-line no-unused-vars
exports.callBack = (req, res, next) => {
  const { userId } = req;
  const { id } = req.params;

  db.execute("SELECT * FROM card WHERE userId = ? AND id = ?", [userId, id])
    .then((card) => {
      if (!card) {
        return res.status(401).json({ message: "UnAuthorized / no user" });
      }
      return res.status(200).json({
        status: "Success",
        message: "Card created successfully",
        data: card[0],
      });
    })
    .catch((error) => res.status(404).json({ message: error }));
};

// get all virtual cards
exports.allVirtualCards = (req, res) => {
  const { userId } = req;
  db.execute("SELECT * FROM card WHERE userId = ? ", [userId])
    .then((card) => {
      if (!card) {
        return res.status(404).json({ message: " not found" });
      }
      return res.status(200).json({ card });
    })
    .catch((error) => res.status(400).json(error));
};

// Get a Single Virtual card
// eslint-disable-next-line no-unused-vars
exports.singleVirtualCard = (req, res, next) => {
  const { userId } = req;
  const { id } = req.params;

  db.execute("SELECT * FROM card WHERE userId = ? AND id = ?", [userId, id])
    .then((card) => {
      if (!card) {
        return res.status(401).json({ message: "UnAuthorized / no user" });
      }
      return res.status(200).json({
        status: "Success",
        message: "Card fetched successfully",
        data: card[0],
      });
    })
    .catch((error) => res.status(404).json({ message: error }));
};

// update a card - Assuming card is updated upon selecting a single card
// eslint-disable-next-line no-unused-vars
exports.fundVirtualCard = (req, res, next) => {
  const { userId } = req;
  const { id } = req.params;
  const { amount } = req.body;
  db.execute('UPDATE card SET amount = ? WHERE userId  = ? And id = ?', [amount, userId, id])
    .then(() => res.status(201).json({ status: "success", message: 'card updated successfully', data: null }))
    .catch((error) => res.status(400).json({ message: 'error updating card', error }));
};

// setting up mysql
const mysql = require('mysql2');

// setting up mysql pool
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.USER,
  database: process.env.DATABASE,
  password: process.env.PASSWORD
});

module.exports = pool.promise();

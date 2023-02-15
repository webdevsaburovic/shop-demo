const mysql = require("mysql");

const connection = mysql.createConnection({
  host: '',
  user: 'shop',
  password: 'shop123!',
  database: 'shop',
});

connection.connect((err) => {
  if (err) console.log(err);
  else console.log("MySQL is connected...");
});

module.exports = connection;



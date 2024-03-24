const mysql = require('mysql2');
const connection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'hh',
    database: 'test_db'
});
module.exports = connection;
const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'db_natgas_phantom',
    password: ''
});

module.exports = pool.promise();
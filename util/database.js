const mysql = require('mysql2');

const pool = mysql.createPool({
    user: 'root',
    password: '',
    database: 'db_natgas_phantom',
    host: 'localhost'
    
});

module.exports = pool.promise();
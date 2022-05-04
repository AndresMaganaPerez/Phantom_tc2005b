const mysql = require('mysql2');

    const pool = mysql.createPool({
        socketPath: `/cloudsql/${process.env.INSTANCE_CONNECTION_NAME}`,
        user: process.env.DB_USER,
        database: process.env.DB_NAME,
        password: process.env.DB_PASS
    });
  
/*
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'db_natgas_phantom',
    password: ''
});
*/

module.exports = pool.promise();
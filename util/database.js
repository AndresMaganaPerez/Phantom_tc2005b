const mysql = require('mysql2');

    const pool = mysql.createPool({
        socketPath: `/cloudsql/${process.env.INSTANCE_CONNECTION_NAME}`,
        user: process.env.DB_USER,
        database: process.env.DB_NAME,
        password: process.env.DB_PASS
    });
  





module.exports = pool.promise();
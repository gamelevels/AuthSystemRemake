const Config = require('./config');
const mysql = require('mysql2');

const pool = mysql.createPool({
    host: Config.dbHost,
    port: Config.dbPort,
    user: Config.dbUser,
    password: Config.dbPassword,
    database: Config.dbName
});

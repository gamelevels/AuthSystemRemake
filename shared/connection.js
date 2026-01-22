const Config = require('./config');
const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: Config.dbHost,
    port: Config.dbPort,
    user: Config.dbUser,
    password: Config.dbPassword,
}).connect(err => {
    if (err) throw err;
    console.log("Database connected successfully.");
});
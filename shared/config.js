require('dotenv').config();

module.exports = {
    apiPort: process.env.APIPort || 1337,
    dbHost: process.env.DBHost || 'localhost',
    dbPort: process.env.DBPort || 3307,
    dbUser: process.env.DBUser || 'root',
    dbPassword: process.env.DBPassword || 'password',
    dbName: process.env.DBName || 'database',
    masterKey: process.env.MasterKey || `apiKey`
}
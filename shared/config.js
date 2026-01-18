require('dotenv').config();

class Config {
    constructor() {
        if (Config.instance) {
            return Config.instance;
        }

        this.apiPort = process.env.APIPort || 1337;
        this.dbHost = process.env.DBHost || 'localhost';
        this.dbPort = process.env.DBPort || 3307;
        this.dbUser = process.env.DBUser || 'root';
        this.dbPassword = process.env.DBPassword || 'password';
        this.dbName = process.env.DBName || 'database';
        this.masterKey = process.env.MasterKey || `apiKey`;

        Config.instance = this;
    }
}

module.exports = Config;
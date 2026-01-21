require('dotenv').config();

class Config {
    constructor() {
        if (!Config._instance){
            Config.instance = this;
            this._LoadConfig();
        }
        return Config.instance;

    };

    _LoadConfig() {
        this.apiPort = process.env.APIPort || 1337;
        this.dbHost = process.env.DBHost || 'localhost';
        this.dbPort = process.env.DBPort || 3307;
        this.dbUser = process.env.DBUser || 'root';
        this.dbPassword = process.env.DBPassword || 'password';
        this.dbName = process.env.DBName || 'database';
        this.masterKey = process.env.MasterKey || `apiKey`;
    };
}

module.exports = Config;
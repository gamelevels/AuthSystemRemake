const config = require('./config');

const LogRequest = (req, res, next) => {
    const requestTime = new Date();
    const apiKey = req.headers['authorization'] ? req.headers['authorization'] : null;
    console.log(`[${req.method}] | ${requestTime.toLocaleString()} | API Key: ${apiKey}`);
    next();
};

const GetAPIKey = (req, res, next) => {
    const apiKey = req.headers['authorization'];
    if (apiKey != config.masterKey) {
        return res.sendStatus(401);
    }
    next();
};

module.exports = {
    LogRequest,
    GetAPIKey
}
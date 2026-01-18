const LogRequest = (req, res, next) => {
    const requestTime = new Date();
    console.log(`[${req.method}] | ${requestTime.toLocaleString()}`);
    next();
};

const GetAPIKey = (req, res, next) => {
    const apiKey = req.headers['authorization'];
    
    
    next();
};

module.exports = {
    LogRequest,
    GetAPIKey
}
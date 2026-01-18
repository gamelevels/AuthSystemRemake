const express = require('express');
const Config = require('./shared/config');
const config = new Config();

const { LogRequest, GetAPIKey } = require('./shared/middleware');

console.log(config.APIPort);

const app = express();
const apiPort = process.env.APIPort

app.use(GetAPIKey);
app.use(LogRequest);

app.get('/', (req, res) => {
    res.send('testing');
});

app.listen(apiPort, () => {
    console.log(`Server is running on port ${apiPort}`);
});
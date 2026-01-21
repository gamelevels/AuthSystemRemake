const express = require('express');
const { LogRequest, GetAPIKey } = require('./shared/middleware');
const Config = new (require('./shared/config'))();
console.log(Config)

const app = express();

app.use(GetAPIKey);
app.use(LogRequest);

app.get('/', (req, res) => {
    res.send('testing');
});

app.listen(Config.apiPort, () => {
    console.log(`Server is running on port ${Config.apiPort}`);
});
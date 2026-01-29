const express = require('express');
const { LogRequest, GetAPIKey } = require('./shared/middleware.js');
const UserRouter  = require('./apis/user/user.js')
const Config = require('./shared/config');
console.log(Config)

const app = express();

app.use(express.json());
app.use(GetAPIKey);
app.use(LogRequest);
app.use("/user", UserRouter);

app.get('/', (req, res) => {
    res.send('testing');
});

app.listen(Config.apiPort, () => {
    console.log(`Server is running on port ${Config.apiPort}`);
});
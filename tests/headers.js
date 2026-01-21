const axios = require('axios');
const Config = new (require('../shared/config.js'))();

function testHeaders() {
    return axios.post(`http://localhost:${Config.apiPort}/`, {}, {
        headers: {
            'authorization': Config.masterKey
        }
    })
};

testHeaders().then(response => {console.log(response.data)});
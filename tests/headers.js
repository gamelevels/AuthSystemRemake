const axios = require('axios');
const Config = require('../shared/config.js')

function testHeaders() {
    return axios.post(`http://localhost:${Config.apiPort}/user/register`, {
        username: "testuser",
        password: "testpassword"
    }, {
        headers: {
            'authorization': Config.masterKey
        }
    })
};

testHeaders().then(response => {console.log(response.data)});
import { config } from '../shared/config.js';

const res = await fetch('http://localhost:1337', {
    method: 'POST',
    headers: {
        'authorization': config.masterKey
    }
});
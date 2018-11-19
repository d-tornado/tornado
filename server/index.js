const express = require('express');
const app = express();

const fetch = require('node-fetch');
const Bluebird = require('bluebird');

const bodyParser = require('body-parser');

const config = require('../config.js');

const port = 3000;

fetch.Promise = Bluebird;
app.use(bodyParser);

// Endpoint for receiving and sending the JSON object further along the chain.
app.post('/', (req, res) => {
    console.log(req.body);

    fetch('http://' + config.nextIp + ':3000', {
        method: 'post',
        body: req.body,
        headers: { 'Content-Type': 'application/json' },
    });
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
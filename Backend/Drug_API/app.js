const http = require('http');
const express = require('express');
const cors = require('cors');
const morgan = require('morgan')
//const bodyParser = require('body-parser');
/*
const passport = require('passport');
const passportUser = require('./passport').passportUser;
*/
require('dotenv').config();
require('./config/db');

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());
app.use(morgan('dev'));

// Initialize routes
app.use('/users', require('./routes/users.js'));
app.use('/drugs', require('./routes/drugs.js'));
app.use('/orders', require('./routes/orders.js'));

//app.use('/me', require('./routes/meetups'));

// Error handling middleware
app.use((err, req, res, next) => {
    console.log('Encountered an error:\n', err);
    res.status(400).send({error: err.message});
});

app.get('/', (req, res) => {
    res.send({"msg": "hello"});
});

app.listen(process.env.APP_PORT, () => {
    console.log('Listening on port',process.env.APP_PORT);
});
//process.env.APP_PORT
module.exports = app;
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const db = require('./database');
const bcrypt = require('bcryptjs');

var historyRouter = require('./routes/history');
var cardRouter = require('./routes/card');

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/history', historyRouter);
app.use('/card', cardRouter);

function authenticateClient(req, res, next) {

  const { idCard, Pin } = req.body;

  db.query('select * from card where idCard = ?', [idCard], function(err, card) {
    if (err) {
      res.status(500).json({ error: 'Internal server error' });
    } else if (!card) {
      res.status(401).json({ error: 'unauthorized' });
    } else {

      bcrypt.compare(Pin, card.PinHash, function(err, result) {
        if (err) {
          res.status(500).json({ error: 'Internal server error' });
        } else if (result) {
          next();
        } else {
          res.status(401).json({ error: 'Unauthorized' });
        }
      });
    }
  });
}

app.use('/history', authenticateClient);
app.use('/card', authenticateClient);


module.exports = app;

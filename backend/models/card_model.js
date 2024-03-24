const db = require('../database');
const bcrypt = require('bcryptjs');

const saltRounds = 10;

const card={
    getAll: function(callback) {
        return db.query('select * from card', callback);
    },
    getById: function(id, callback) {
        return db.query('select * from card where idcard=?', [id], callback);
    },
    add: function(cardData, callback) {
        bcrypt.hash(cardData.PinSave, saltRounds, function(err, hash) {
            if(err) {
                return callback(err);
            }
            return db.query('insert into card (idCard, Pin, PinSave, ClientID) values(NULL,?,?,?)',
            [cardData.Pin, cardData.PinSave, cardData.ClientID], callback);
        });
    },
    delete: function(id, callback) {
        return db.query('delete from card where idCard=?', [id], callback);
    },
    update: function(id, cardData, callback) {
        bcrypt.hash(cardData.PinSave, saltRounds, function(err, hash) {
            if(err) {
                return callback(err);
            }
            return db.query('update card set Pin=?, PinSave=?, ClientID=? where idCard=?',
            [cardData.Pin, cardData.PinSave, cardData.ClientID, id], callback);
        });
    }
}

module.exports = card;
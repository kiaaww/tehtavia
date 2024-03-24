const db = require('../database');

const history = {
  getAll: function(callback) {
    return db.query('select * from Account_History ORDER BY Date DESC', callback);
  },
  getById: function(id, callback) {
    return db.query('select * from Account_History where AccountID=? ORDER BY Date DESC LIMIT 10', [id], callback);
  },
  add: function(Account_History, callback) {
    return db.query(
      'insert into Account_History (Date,Transfer,AccountID) values(NOW() + INTERVAL 2 HOUR,?,?)',
      [Account_History.Transfer, Account_History.AccountID],
      callback
    );
  },
  delete: function(id, callback) {
    return db.query('delete from Account_History where idAccount_History=?', [id], callback);
  },
  update: function(id, Account_History, callback) {
    return db.query(
      'update Account_History set Transfer=?, AccountID=? where idAccount_History=?',
      [Account_History.Transfer, Account_History.AccountID, id],
      callback
    );
  }
};
module.exports = history;
const express = require('express');
const router = express.Router();
const card = require('../models/card_model');
const basicAuth = require('express-basic-auth');

const auth = basicAuth({
    users: { 'admin': 'pass' },
    unauthorizedResponse: 'unauthorized', 
});

router.use(auth);

router.get('/:id',
 function(request, response) {
    if(request.params.id) {
        card.getById(request.params.id, function(err, dbResult) {
            if(err) {
                response.status(500).json({ error: 'Internal server error' });
            } else {
                response.json(dbResult);
            }
        });
    } else {
        card.getAll(function(err, dbResult) {
            if (err) {
                response.status(500).json({ error: 'internal server error' });
            } else {
                response.json(dbResult);
            }
        });
    }
});

router.post('/',
function(request, response) {
    card.add(request.body, function(err, dbResult) {
        if(err) {
            response.json(err);
        } else {
            response.json(dbResult);
        }
    });
});

router.delete('/:id',
function(request, response) {
    card.delete(request.params.id, function(err, dbResult) {
        if(err) {
            response.json(err);
        } else {
            response.json(dbResult);
        }
    });
});

router.put('/:id',
function(request, response) {
    card.update(request.params.id, request.body, function(err, dbResult) {
        if(err) {
            response.json(err);
        } else {
            response.json(dbResult);
        }
    });
});

module.exports = router;
const express = require('express');
const router = express.Router();
require('express-ws')(router);

const homeController = require('../controllers/homeController');

// Normale Route
router.get('/', homeController.index);

// WebSocket-Route
router.ws('/ws', (ws, req) => {
    console.log("WS connected!");

    ws.on('message', (msg) => {
        console.log("WS message:", msg);
        ws.send("Echo: " + msg);
    });

    ws.on('close', () => {
        console.log("WS closed");
    });
});

module.exports = router;

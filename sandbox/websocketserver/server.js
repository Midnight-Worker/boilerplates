// server.js
import { WebSocketServer } from "ws";
const wss = new WebSocketServer({ port: 9002 });

wss.on("connection", (ws) => {
  ws.on("message", (msg) => ws.send(String(msg))); // Echo
});

console.log("WebSocket läuft auf ws://localhost:9002");


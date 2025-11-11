import WebSocket from "ws";

const ws = new WebSocket("wss://midnight-worker");

ws.on("open", () => {
  ws.send("Hallo Welt");
});

ws.on("message", (msg) => {
  console.log("Empfangen:", msg.toString());
});


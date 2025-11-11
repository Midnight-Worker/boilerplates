import express from "express";
import expressWs from "express-ws";

const app = express();
expressWs(app);

app.ws("/ws", (ws) => {
  console.log("Client verbunden");

  ws.on("message", (msg) => {
    console.log("Empfangen:", msg);
    ws.send("Hallo zur√ºck Ì±ã");
  });
});

app.listen(3000, () => console.log("WebSocket l√§uft auf ws://localhost:3000/ws"));


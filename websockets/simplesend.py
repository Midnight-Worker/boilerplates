from websocket import WebSocket

ws = WebSocket()
ws.connect("wss://midnight-worker")
ws.send("bla")
print(ws.recv())
ws.close()


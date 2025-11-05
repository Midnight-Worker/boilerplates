import threading
from websocket import WebSocket

def worker():
    ws = WebSocket()
    ws.connect("wss://midnight-worker")
    ws.send("bla")
    print(ws.recv())
    ws.close()

threading.Thread(target=worker).start()


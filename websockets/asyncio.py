import asyncio, websockets

async def main():
    async with websockets.connect("wss://midnight-worker") as ws:
        await ws.send("bla")
        print(await ws.recv())

asyncio.run(main())

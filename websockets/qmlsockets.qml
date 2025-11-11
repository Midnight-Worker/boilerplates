import QtQuick 2.15
import QtQuick.Controls 2.15
import QtWebSockets 1.1

ApplicationWindow {
    visible: true
    width: 300; height: 150; title: "QML + WebSocket (mini)"

    Column {
        anchors.centerIn: parent; spacing: 10
        Text { id: label; text: "(noch nichts)" }

        Button { text: "Hallo Welt senden"
            onClicked: ws.sendTextMessage("Hallo Welt")
        }
    }

    WebSocket {
        id: ws
        url: "wss://midnight-worker"   // ggf. anpassen (Echo-Server o. eigener)
        active: true
        onTextMessageReceived: label.text = message
    }
}


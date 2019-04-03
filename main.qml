import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0
import "qml"

Item {
    id: mainview
    width: 1280
    height: 768
    visible: true

    Scene3D {
        anchors.fill: parent
        aspects: ["render", "logic", "input"]

        AirportScene {
            mapWidth: 100
            mapHeight: 100
        }
    }
}

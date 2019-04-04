import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0
import "qml"

Item {
    id: mainview
    width: 1280
    height: 768
    visible: true

    property int scenario_period: 20000

    Scene3D {
        anchors.fill: parent
        aspects: ["render", "logic", "input"]

        AirportScene {
            scenario_period: scenario_period
        }
    }

    Control {
        objectName: "control"
        height: 100
        width: parent.width
        anchors.bottom: parent.bottom
        scenario_period: scenario_period
    }
}

import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: root

    width: 200
    height: 50

    property int scenario_period
    signal playPauseClicked()
    function scenarioTimeUpdated(time) { slider.value = time }

    Image {
        id: play_pause_button
        y: 0
        width: height
        height: parent.height * ( 2 / 3)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        source: "assets/img/play_pause.png"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onPressed: play_pause_button.opacity = 0.5
            onReleased: play_pause_button.opacity = 1
            onClicked: root.playPauseClicked()
        }
    }

    Slider {
        id: slider
        maximumValue: 20000
        stepSize: 1.0
        height: parent.height / 3
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: play_pause_button.right
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        enabled: false

        style: SliderStyle {
                groove: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 10
                    color: "#0E175A"
                    radius: 8
                }
                handle: Rectangle {
                    anchors.centerIn: parent
                    color: "white"
                    border.color: "white"
                    border.width: 4
                    implicitWidth: 10
                    implicitHeight: 10
                    radius: 8
                }
            }
    }
}

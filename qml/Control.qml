import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: root

    width: 200
    height: 50

    signal playPauseClicked()
    signal sliderValueChanged(int value)

    Image {
        id: play_pause_button
        y: 0
        width: height
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        source: "assets/img/play_pause.png"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: root.playPauseClicked()
        }
    }

    Slider {
        id: slider
        height: parent.height / 3
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: play_pause_button.right
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter

        onValueChanged: root.sliderValueChanged(value)
    }
}

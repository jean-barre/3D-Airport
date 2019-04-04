import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

Camera {
    id: camera

    property int period
    property int t: 0
    property double x_max: 30.0
    property double z_max: 60.0
    property double x: x_max * Math.sin(2 * Math.PI * t / period )
    property double y: 0.0
    property double z: z_max * Math.cos(2 * Math.PI * t / period )

    property double next_x: x_max * Math.sin(2 * Math.PI * t / period + Math.PI / 8)
    property double next_z: z_max * Math.cos(2 * Math.PI * t / period + Math.PI / 8)

    objectName: "camera"
    projectionType: CameraLens.PerspectiveProjection
    fieldOfView: 45
    aspectRatio: _window.width / _window.height
    nearPlane: 0.1
    farPlane: 1000.0
    position: Qt.vector3d(x, y, z)
    viewCenter: Qt.vector3d(next_x, 0.0, next_z)
    upVector: Qt.vector3d(0.0, 1.0, 0.0)

    function resumeAnimation() {
        if (tAnimation.running && !tAnimation.paused) {
            tAnimation.pause()
        } else if (tAnimation.paused) {
            tAnimation.resume()
        } else {
            tAnimation.start()
        }
    }

    QQ2.NumberAnimation {
        id: tAnimation
        target: camera
        property: "t"
        loops: QQ2.Animation.Infinite
        duration: period
        from: 0
        to: period
    }
}

import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0

Entity {
    id: root
    property Material material

    Mesh {
        id: bridgeMesh
        source: "qrc:/qml/assets/obj/pont_du_gard.obj"
    }

    Transform {
        id: bridgeMeshTransform
        property real xAngle: 0.0
        property real yAngle: 0.0
        property real zAngle: 0.0
        scale: 0.04
        translation: Qt.vector3d(8, -6, 0)
        rotation: fromAxesAndAngles( Qt.vector3d(1, 0, 0), xAngle,
                                    Qt.vector3d(0, 1, 0), yAngle,
                                    Qt.vector3d(0,0,1), zAngle)
    }

    components: [
        bridgeMesh,
        bridgeMeshTransform,
        material
    ]
}

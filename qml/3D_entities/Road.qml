import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id: root
    property Material material

    Mesh {
        id: roadMesh
        source: "qrc:/qml/assets/obj/ellipse.obj"
    }

    Transform {
        id: roadMeshTransform
        property real xAngle: 90.0
        property real yAngle: 0.0
        property real zAngle: 0.0
        scale3D: Qt.vector3d(0.327, 0.43, 0.3)
        translation: Qt.vector3d(-32.3, -4, -64)
        rotation: fromAxesAndAngles( Qt.vector3d(1, 0, 0), xAngle,
                                    Qt.vector3d(0, 1, 0), yAngle,
                                    Qt.vector3d(0,0,1), zAngle)
    }

    components: [
        roadMesh,
        roadMeshTransform,
        material
    ]
}

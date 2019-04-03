import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import "3D_entities"
import "3D_ads"

Entity {
    id: sceneRoot

    property int mapWidth
    property int mapHeight

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: _window.width / _window.height
        nearPlane: 0.1
        farPlane: 1000.0
        position: Qt.vector3d(0.0, 0.0, 50.0)
        viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
    }

    FirstPersonCameraController { camera: camera }

    ShadowMapLight {
        id: light
    }

    components: [
        ShadowMapFrameGraph {
            id: framegraph
            viewCamera: camera
            lightCamera: light.lightCamera
        },
        // Event Source will be set by the Qt3DQuickWindow
        InputSettings { }
    ]

    AdsEffect {
        id: shadowMapEffect
        shadowTexture: framegraph.shadowTexture
        light: light
    }

    GroundPlane {
        width: mapWidth
        height: mapHeight
        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.2, 0.5, 0.3, 1.0)
            specularColor: Qt.rgba(0, 0, 0, 1.0)
        }
    }

    Road {
        height: mapHeight
        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.8, 0.8, 0.8, 1.0)
            specularColor: Qt.rgba(0, 0, 0, 1.0)
        }
    }
}

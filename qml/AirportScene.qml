import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import "3D_entities"
import "3D_ads"

Entity {
    id: sceneRoot

    property int scenario_period: 20000
    property int global_time

    QQ2.NumberAnimation {
        id: tAnimation
        target: sceneRoot
        property: "global_time"
        loops: QQ2.Animation.Infinite
        duration: scenario_period
        from: 0
        to: scenario_period
    }

    ScenarioCamera {
        id: camera
        t: global_time
        period: scenario_period
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
        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.2, 0.5, 0.3, 1.0)
            specularColor: Qt.rgba(0, 0, 0, 1.0)
        }
    }

    Road {
        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.3, 0.3, 0.3, 1.0)
            specularColor: Qt.rgba(0, 0, 0, 1.0)
        }
    }

    Bridge {
        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.6, 0.4, 0.3, 0.6)
            specularColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
            shininess: 100
        }
    }

    Toyplane {
        material: AdsMaterial {
            effect: shadowMapEffect
            diffuseColor: Qt.rgba(0.9, 0.5, 0.3, 1.0)
            shininess: 75
        }
        t: global_time
        period: scenario_period
    }
}

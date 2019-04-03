#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include <QOpenGLContext>
#include <iostream>

#include "scenario.h"

void setSurfaceFormat()
{
    QSurfaceFormat format;
#ifdef QT_OPENGL_ES_2
    format.setRenderableType(QSurfaceFormat::OpenGLES);
#else
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
        format.setVersion(4, 3);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
#endif
    format.setDepthBufferSize(24);
    format.setSamples(4);
    format.setStencilBufferSize(8);
    QSurfaceFormat::setDefaultFormat(format);
}

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);
    Scenario* scenario;
    setSurfaceFormat();

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.rootContext()->setContextProperty("_window", &view);
    view.setSource(QUrl("qrc:/main.qml"));
    view.setColor("#000000");
    view.show();

    try {
        scenario = new Scenario(&view);
    } catch (std::exception &e) {
        std::cerr << e.what() << std::endl;
        std::cerr << "An error occurred during Scenario instatiation" << std::endl;
        return -1;
    }

    return app.exec();
}

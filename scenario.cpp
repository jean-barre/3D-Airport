#include "scenario.h"
#include <iostream>

Scenario::Scenario(QObject *parent) : QObject(parent)
{
    control = parent->findChild<QObject*>("control");
    if (!control) {
        throw std::domain_error("Could not find any object named 'control'");
    }
    camera = parent->findChild<QObject*>("camera");
    if (!camera) {
        throw std::domain_error("Could not find any object named 'camera'");
    }
    connect(control, SIGNAL(playPauseClicked()), this, SLOT(playPauseClicked()));
}

void Scenario::playPauseClicked()
{
    QMetaObject::invokeMethod(camera, "resumeAnimation");
}

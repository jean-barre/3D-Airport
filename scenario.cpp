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
    connect(camera, SIGNAL(updateTime(int)), this, SLOT(updateTime(int)));
}

void Scenario::playPauseClicked()
{
    QMetaObject::invokeMethod(camera, "resumeAnimation");
}

void Scenario::updateTime(int time)
{
    QMetaObject::invokeMethod(control, "scenarioTimeUpdated", Q_ARG(QVariant, time));
}

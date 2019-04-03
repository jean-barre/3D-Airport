#ifndef SCENARIO_H
#define SCENARIO_H

#include <QObject>
#include <QVariant>
#include <QVector3D>

class Scenario : public QObject
{
    Q_OBJECT
    QObject *control;
    QObject *camera;
public:
    explicit Scenario(QObject *parent = nullptr);

signals:

public slots:
    void playPauseClicked();
};

#endif // SCENARIO_H

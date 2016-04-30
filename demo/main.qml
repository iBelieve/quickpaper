import QtQuick 2.6
import QtQuick.Controls 2.0
import Paper 0.1

ApplicationWindow {
    Rectangle {
        anchors.centerIn: parent

        width: 120
        height: 80

        Ripple {
            anchors.fill: parent
        }

        layer.enabled: true
        layer.effect: ElevationEffect {
            elevation: 2
        }
    }
}

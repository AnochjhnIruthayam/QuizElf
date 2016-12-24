import QtQuick 2.6
import QtGraphicalEffects 1.0

Item {
    id: root

    property string score: "undefined"
    property int pointSize: 40

    signal clicked()

    signal cardChoosen();

    Rectangle {
        id: gameCard
        anchors.fill: parent
        color: "#9bf442"
        radius: 20
        opacity: 0.8

        Text {
            anchors.centerIn: parent
            text: root.score
            font.pointSize: root.pointSize
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.clicked();
            }
        }
    }
}

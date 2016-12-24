import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: root
    property int scorePoint: 0
    property string dataPath: "undefined"
    property string correctAnswer: "undefined"
    property string category: "undefined"


    property bool isRevealed: false

    signal popView()
    signal addPoint(var points)
    signal removePoint(var points)

    Rectangle {
        anchors.fill: parent
        color: "purple"
    }

    ColumnLayout {
        anchors.fill: parent
        Text {
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: root.category + " for " + root.scorePoint
            font.pointSize: 40
        }

        Text {
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: root.dataPath
            font.pointSize: 40
        }


        Text {
            visible: root.isRevealed

            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: root.correctAnswer
            font.pointSize: 40
        }

    }
}

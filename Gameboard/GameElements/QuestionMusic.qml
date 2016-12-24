import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtMultimedia 5.7


Item {
    id: root

    property int scorePoint: 0
    property string dataPath: "undefined"
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
            text: "Musik for " + root.scorePoint
            font.pointSize: 40
        }

        Text {
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: "Hvilken sang er det og hvem er artisten?"
            font.pointSize: 40
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true


        }

        MusicPlayer {
            id: revertedMusic
            Layout.preferredHeight: parent.height * 0.1
            Layout.fillWidth: true
            dataPath: "REVERTED_"+root.dataPath
        }

        MusicPlayer {
            id: normalMusic
            visible: root.isRevealed
            Layout.preferredHeight: parent.height * 0.1
            Layout.fillWidth: true
            dataPath: root.dataPath
        }

    }

}

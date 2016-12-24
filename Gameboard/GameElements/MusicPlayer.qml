import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtMultimedia 5.7

Item {
    id: root

    property string dataPath: "undefined"

    Audio {
        id: music

        property bool isPlaying: false

        source: "../Audio/" + root.dataPath
        onPlaying: {
            isPlaying = true
        }
        onStopped: {
            isPlaying = false
        }
        onPaused: {
            isPlaying = false
        }
    }

    RowLayout {
        anchors.fill: parent

        Rectangle {
            id: playPauseArea
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 10
            Text {
                id: playPauseText
                anchors.centerIn: parent

                font.pointSize: 30
                text: "Play"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(music.isPlaying) {
                        music.pause()
                        playPauseText.text = "Play"
                    } else {
                        music.play()
                        playPauseText.text = "Pause"
                    }
                }
            }
        }
        Rectangle {
            id: stopArea
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 10
            Text {
                id: stopText
                anchors.centerIn: parent

                font.pointSize: 30
                text: "Stop"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    music.stop()
                    playPauseText.text = "Play"
                }
            }
        }

    }

}

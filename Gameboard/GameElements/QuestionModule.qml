import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: root

    property int scorePoint: 0
    property string questionType: "undefined"
    property string dataPath: "undefined"
    property string correctAnswer: "undefined"
    property string category: "undefined"


    property bool isRevealed: false

    signal popView()
    signal addPoint(var points)
    signal removePoint(var points)
    signal reveal();
    Rectangle {
        anchors.fill: parent
        color: "purple"
    }
    MouseArea {
        anchors.fill: parent
    }


    ColumnLayout {
        anchors.fill: parent

        Loader {
            Layout.preferredHeight: parent.height * 0.90
            Layout.fillWidth: true
            sourceComponent: {
                switch (root.questionType) {
                    case "QUESTIONMUSIC": return musicComponent;
                    case "QUESTIONPICTURE": return pictureComponent;
                    case "QUESTIONNORMAL": return normalComponent;
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        RowLayout {
            Layout.preferredHeight: parent.height * 0.01
            Layout.fillWidth: true

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 20
                opacity: 0.8
                color: "blue"
                Text {
                    anchors.centerIn: parent
                    text: "Tilbage"
                    font.pointSize: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Popping View")
                        root.popView();
                    }
                }
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 20
                opacity: 0.8
                color: "green"
                Text {
                    anchors.centerIn: parent
                    text: "Rigtigt"
                    font.pointSize: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.addPoint(root.scorePoint)
                    }
                }
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 20
                opacity: 0.8
                color: "red"
                Text {
                    anchors.centerIn: parent
                    text: "Forkert"
                    font.pointSize: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.removePoint(root.scorePoint)
                    }
                }
            }
            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 20
                opacity: 0.8
                color: "yellow"
                Text {
                    anchors.centerIn: parent
                    text: "Afslør"
                    font.pointSize: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.isRevealed = true;
                    }
                }
            }
        }

    }

    Component {
        id: musicComponent
        QuestionMusic {
            anchors.fill: parent

            isRevealed: root.isRevealed;
            dataPath: root.dataPath
            scorePoint: root.scorePoint
            onPopView: root.popView();
        }
    }
    Component {
        id: pictureComponent
        QuestionImage {
            anchors.fill: parent
            isRevealed: root.isRevealed;
            dataPath: root.dataPath
            scorePoint: root.scorePoint
            correctAnswer: root.correctAnswer
            onPopView: root.popView();
        }
    }

    Component {
        id: normalComponent
        QuestionNormal {
            anchors.fill: parent
            isRevealed: root.isRevealed;
            dataPath: root.dataPath
            scorePoint: root.scorePoint
            correctAnswer: root.correctAnswer
            category: root.category
            onPopView: root.popView();
        }
    }

}

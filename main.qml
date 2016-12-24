import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root
visible: true
        width: 640
        height: 480
    title: qsTr("Quiz")
//    Component.onCompleted: showFullScreen()
    MainGame {
        id: mainGame
        anchors.fill: parent
    }

//    visible: true
//    width: 640
//    height: 480
//    title: qsTr("Hello World")

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
//        }
//    }

//    TextEdit {
//        id: textEdit
//        text: qsTr("Enter some text...")
//        verticalAlignment: Text.AlignVCenter
//        anchors.top: parent.top
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.topMargin: 20
//        Rectangle {
//            anchors.fill: parent
//            anchors.margins: -10
//            color: "transparent"
//            border.width: 1
//        }
//    }
}

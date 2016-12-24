import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: root

    property ListModel scoreModel: ListModel {}
    property int currentTeam: 1

    onScoreModelChanged: {
        console.log(scoreModel.count)
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "blue"
    }



    RowLayout {
        anchors.fill:parent
        anchors.leftMargin: 10
        anchors.rightMargin: 20
//        anchors.horizontalCenter: root.horizontalCenter
        spacing: 5

        Repeater {
            id: repeater
            model: scoreModel
            Rectangle {
                id: teamCard
                property int borderSize: 1
                property int teamNumber: teamNo

//                width: 100; height: 40
                Layout.preferredHeight: parent.height * 0.9
                Layout.preferredWidth: parent.width / (scoreModel.count)

                border.width: borderSize
                color: teamColor
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: score
                    font.pointSize: 20
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        setActiveTeam(teamNo)
                    }
                }
            }
        }
    }

    function setActiveTeam(teamNo) {
        root.currentTeam = teamNo;
        for(var i = 0; i < repeater.count; i++) {
            if(repeater.itemAt(i).teamNumber === root.currentTeam) {
                repeater.itemAt(i).borderSize = 5
            } else {
                repeater.itemAt(i).borderSize = 1
            }
        }
    }


//    ListView {
//        id: scoreView
////        width: parent.width
////        height: parent.height
//        anchors.fill:parent
//        anchors.horizontalCenter: root.horizontalCenter
//        spacing: 5
//        orientation: ListView.Horizontal

//        model: scoreModel;

//        delegate: Rectangle {
//            height: root.height * 0.9
//            width: root.width * 0.1
//            radius: 10
//            color: "yellow"
//            Text {
//                anchors.centerIn: parent
//                text: score
//            }
//        }
//    }
}

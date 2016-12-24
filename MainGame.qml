import QtQuick 2.6
import QtQuick.Layouts 1.3

import "Gameboard"
import "Scoreboard"

Item {
    id: root

    ColumnLayout {
        id: mainSetup
        anchors.fill: parent

        spacing: 5

        Scoreboard {
            id: scoreBoard
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
            scoreModel: scoreboardModel
        }

        Gameboard {
            id: gameboard
            Layout.fillWidth: true
            Layout.fillHeight: true
            onAddPoint: {
                scoreboardModel.setScore(scoreBoard.currentTeam, points)
            }
            onRemovePoint: {
                scoreboardModel.setScore(scoreBoard.currentTeam, -points)
            }
        }

    }

    ListModel {
        id: scoreboardModel

        ListElement {
            teamNo: 1
            score: 0
            teamColor: "red"
        }
        ListElement {
            teamNo: 2
            score: 0
            teamColor: "yellow"
        }
        ListElement {
            teamNo: 3
            score: 0
            teamColor: "green"
        }

        function setScore(teamNo, score) {
            for(var i = 0; i < scoreboardModel.count; i++) {
                if(scoreboardModel.get(i).teamNo === teamNo) {
                    scoreboardModel.get(i).score += score;
                    break;
                }
            }


        }
    }





}

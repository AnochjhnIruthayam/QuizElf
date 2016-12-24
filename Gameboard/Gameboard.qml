import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

import "GameElements"

Item {
    id: root

    property int intervalSpacing: 20
    property int cCARD_HEIGHT: (root.height )/ (musicView.count + 1.5)

    signal addPoint(var points)
    signal removePoint(var points)

    Image {
        anchors.fill: parent
        source: "Images/background.jpg"
    }
    GameData {
        id: gameData
    }

    StackView {
        id: stackView
//        anchors.fill: parent
        height: parent.height
        width: parent.width
        delegate: StackViewDelegate {
            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                }
            }
        }
        initialItem: RowLayout {
            id: comlumLayout

            anchors.fill: parent

            spacing: 20

            ListView {
                id: musicView
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 10

                model: gameData.musicRevert

                header: GameCardHeader {
                    height: cCARD_HEIGHT
                    width: parent.width
                    headerText: gameData.musicRevert.headerText
                }

                delegate: GameCard {
                    height: cCARD_HEIGHT
                    width: parent.width
                    score: scorePoint
                    visible: !isFlipped

                    onClicked: {
                        console.log("Open music for " + scorePoint);
                        gameData.musicRevert.setFlipped(scorePoint, true)
                        stackView.push({item: questionComponent, properties: {scorePoint: scorePoint, questionType: "QUESTIONMUSIC", dataPath: dataPath} ,destroyOnPop: true})
                    }
                }

            }

            ListView {
                id: pictureView
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 10

                model: gameData.commonPictures

                header: GameCardHeader {
                    height: cCARD_HEIGHT
                    width: parent.width
                    headerText: gameData.commonPictures.headerText
                }

                delegate: GameCard {
                    height: cCARD_HEIGHT
                    width: parent.width
                    score: scorePoint
                    visible: !isFlipped
                    onClicked: {
                        console.log("Open pictures 2016 for " + scorePoint);

                        gameData.commonPictures.setFlipped(scorePoint, true)
                        stackView.push({item: questionComponent, properties: {scorePoint: scorePoint, questionType: "QUESTIONPICTURE", dataPath: dataPath, correctAnswer: correctAnswer} ,destroyOnPop: true})
                    }
                }
            }

            ListView {
                id: geographyView
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 10

                model: gameData.geography

                header: GameCardHeader {
                    height: cCARD_HEIGHT
                    width: parent.width
                    headerText: gameData.geography.headerText
                }

                delegate: GameCard {
                    height: cCARD_HEIGHT
                    width: parent.width
                    score: scorePoint
                    visible: !isFlipped
                    onClicked: {
                        console.log("Open geography for " + scorePoint);
                        gameData.geography.setFlipped(scorePoint, true)
                        stackView.push({item: questionComponent, properties: {scorePoint: scorePoint, questionType: "QUESTIONNORMAL", dataPath: dataPath, correctAnswer: correctAnswer, category: gameData.geography.headerText} ,destroyOnPop: true})
                    }
                }
            }

            ListView {
                id: fictionalCharactersView
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 10

                model: gameData.fictionalCharacters

                header: GameCardHeader {
                    height: cCARD_HEIGHT
                    width: parent.width
                    headerText: gameData.fictionalCharacters.headerText
                }

                delegate: GameCard {
                    height: cCARD_HEIGHT
                    width: parent.width
                    score: scorePoint
                    visible: !isFlipped
                    onClicked: {
                        console.log("Open fictional for " + scorePoint);

                        gameData.fictionalCharacters.setFlipped(scorePoint, true)
                        stackView.push({item: questionComponent, properties: {scorePoint: scorePoint, questionType: "QUESTIONNORMAL", dataPath: dataPath, correctAnswer: correctAnswer, category: gameData.fictionalCharacters.headerText} ,destroyOnPop: true})
                    }
                }
            }

            ListView {
                id: year2016View
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 10

                model: gameData.year2016

                header: GameCardHeader {
                    height: cCARD_HEIGHT
                    width: parent.width
                    headerText: gameData.year2016.headerText
                }

                delegate: GameCard {
                    height: cCARD_HEIGHT
                    width: parent.width
                    score: scorePoint
                    visible: !isFlipped
                    onClicked: {
                        console.log("Open year 2016 for " + scorePoint);
                        gameData.year2016.setFlipped(scorePoint, true)
                        stackView.push({item: questionComponent, properties: {scorePoint: scorePoint, questionType: "QUESTIONNORMAL", dataPath: dataPath, correctAnswer: correctAnswer, category: gameData.year2016.headerText} ,destroyOnPop: true})
                    }
                }
            }
        }

    }


    Component {
        id: questionComponent
        QuestionModule {
            height: parent.height
            width: parent.width
            onPopView: stackView.pop();
            onAddPoint: root.addPoint(points);
            onRemovePoint: root.removePoint(points);
        }
    }


}

import QtQuick 2.6

Item {
    id: root

    property alias musicRevert: musicRevert
    property alias commonPictures: commonPictures
    property alias geography: geography
    property alias fictionalCharacters: fictionalCharacters
    property alias year2016: year2016
    property alias mainData: mainData

    ListModel {
        id: musicRevert

        property string headerText: "Musik"

        ListElement {
            scorePoint: 100
            dataPath: "Madeon.mp3"
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 200
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 300
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 400
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 500
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }

        function setFlipped(score, flipTo) {
            for(var i = 0; i < musicRevert.count; i ++) {
                if(musicRevert.get(i).scorePoint === score) {
                    musicRevert.get(i).isFlipped = flipTo;
                    break;
                }
            }
        }
    }
    ListModel {
        id: commonPictures

        property string headerText: "Billeder"

        ListElement {
            scorePoint: 100
            dataPath: "willsmith.jpg"
            correctAnswer: "Will Smith"
            isFlipped: false
        }
        ListElement {
            scorePoint: 200
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 300
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 400
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 500
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        function setFlipped(score, flipTo) {
            for(var i = 0; i < commonPictures.count; i ++) {
                if(commonPictures.get(i).scorePoint === score) {
                    commonPictures.get(i).isFlipped = flipTo;
                    break;
                }
            }
        }
    }

    ListModel {
        id: geography

        property string headerText: "Geografi"

        ListElement {
            scorePoint: 100
            dataPath: "Hvor ligger København?"
            correctAnswer: "I Danmark"
            isFlipped: false
        }
        ListElement {
            scorePoint: 200
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 300
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 400
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 500
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        function setFlipped(score, flipTo) {
            for(var i = 0; i < geography.count; i ++) {
                if(geography.get(i).scorePoint === score) {
                    geography.get(i).isFlipped = flipTo;
                    break;
                }
            }
        }
    }

    ListModel {
        id: fictionalCharacters

        property string headerText: "Fiktive Karakterer"


        ListElement {
            scorePoint: 100
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 200
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 300
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 400
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 500
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        function setFlipped(score, flipTo) {
            for(var i = 0; i < fictionalCharacters.count; i ++) {
                if(fictionalCharacters.get(i).scorePoint === score) {
                    fictionalCharacters.get(i).isFlipped = flipTo;
                    break;
                }
            }
        }
    }

    ListModel {
        id: year2016

        property string headerText: "Året 2016"

        ListElement {
            scorePoint: 100
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 200
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 300
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 400
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        ListElement {
            scorePoint: 500
            dataPath: ""
            correctAnswer: ""
            isFlipped: false
        }
        function setFlipped(score, flipTo) {
            for(var i = 0; i < year2016.count; i ++) {
                if(year2016.get(i).scorePoint === score) {
                    year2016.get(i).isFlipped = flipTo;
                    break;
                }
            }
        }
    }

    ListModel {
        id: mainData
    }

    Component.onCompleted: {
        mainData.append(musicRevert)
        mainData.append(commonPictures)
        mainData.append(geography)
        mainData.append(fictionalCharacters)
        mainData.append(year2016)

    }
}

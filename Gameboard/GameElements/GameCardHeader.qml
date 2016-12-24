import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: root

    property string headerText: "undefined"
    property int pointSize: 30

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.05
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "#4286f4"
            radius: 50
            opacity: 0.9
            Text {
                anchors.centerIn: parent
                text: root.headerText
                font.pointSize: root.pointSize
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.05
        }
    }




}

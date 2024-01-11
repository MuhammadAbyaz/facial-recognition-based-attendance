import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material
import Qt.labs.qmlmodels


Page{
            ComboBox {
                id: combo
    model: ["First", "Second", "Third"]
    }
    ScrollView{
        anchors.fill: parent
        anchors.margins: 300
    TableView {
            anchors.fill: parent
            columnSpacing: 1
            rowSpacing: 1
            clip: true

            model: TableModel {
                TableModelColumn { display: "name" }
                TableModelColumn { display: "color" }
                TableModelColumn { display: "gender" }

                rows: [
                    {
                        "name": "cat",
                        "color": "black",
                        "gender": "male"
                    },
                ]
            }

            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 50
                border.width: 1

                Text {
                    text: display
                    anchors.centerIn: parent
                }
            }
        }
    }
    }
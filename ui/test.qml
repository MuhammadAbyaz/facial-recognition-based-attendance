import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material
import Qt.labs.qmlmodels

Page {
    Column {
        TableView {
                    anchors.fill: parent
                    columnSpacing: 1
                    rowSpacing: 1
                    clip: true

                    model: TableModel {
                        id: attendance_model
                        TableModelColumn {
                            display: "date"
                        }
                        TableModelColumn {
                            display: "studentID"
                        }
                        TableModelColumn {
                            display: "courseID"
                        }

                        rows: []
                    }
                    Connections {
                        target: attendance_api
                        function onDataChanged() {
                            attendance_model.clear();
                            var attendance = attendance_api.attendance;
                            for (var i = 0; i < attendance.length; ++i) {
                                attendance_model.appendRow(attendance[i]);
                                console.log(JSON.stringify(attendance_model.getRow(0)));
                            }
                        }
                    }
                    ComboBox {
    editable: true
    model: ListModel {
        id: model
        ListElement { text: "Banana" }
        ListElement { text: "Apple" }
        ListElement { text: "Coconut" }
    }
    onAccepted: {
        if (find(editText) === -1)
            model.append({text: editText})
    }
}
                    delegate: Column {
                        Row {
                            Rectangle {
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
    }
}

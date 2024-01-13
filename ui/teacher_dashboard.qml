import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material
import Qt.labs.qmlmodels

Page {
    title: "Smart Attendance"
    property int currentIndex: 0
    property var courses: teacher_api.courses_model()
    // property var courses: ["Programming language","OOP"]

    property var options: ["View Attendance", "Mark Attendance"]

    Popup {
        id: view_attendance_popup
        parent:Overlay.overlay
        x: 615
        y: 180
        height: 400
        width: 597
        modal: true
        focus: true
        Row {
            width: parent.width
            Text {
                x: 225
                y: 10
                text: qsTr("<h1>Attendance</h1>")
                color: '#740041'
            }
            Button {
                id: export_button
                anchors.right: parent.right
                Material.background: "#740041"
                Image{
                    anchors.centerIn:parent
                    source:"https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/download.svg"
                }
                
            }
        }
        Row {
            y: 60
            width: parent.width
            Row {
                spacing: 1
                Rectangle {
                    implicitWidth: 190
                    implicitHeight: 50
                    border.width: 0
                    Text {
                        text: qsTr("<h1>Date</h1>")
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    implicitWidth: 190
                    implicitHeight: 50
                    border.width: 0
                    Text {
                        text: qsTr("<h1>Student</h1>")
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    implicitWidth: 190
                    implicitHeight: 50
                    border.width: 0
                    Text {
                        text: qsTr("<h1>Course</h1>")
                        anchors.centerIn: parent
                    }
                }
            }
        }
        Row {
            anchors.fill: parent
            anchors.topMargin: 115
            Column {
                anchors.fill: parent
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
                            }
                        }
                    }
                    delegate: Column {
                        Row {
                            Rectangle {
                                implicitWidth: 190
                                implicitHeight: 40
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
    }
    Row {
        anchors.fill: parent

        Pane {
            width: 300
            height: parent.height
            Material.elevation: 6

            Image {
                x: -10
                y: -120
                height: 300
                width: 300
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logo.png"
            }
            Column {
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.centerIn: parent
                width: 300
                spacing: -11

                Repeater {
                    id: course_repeater
                    model: options
                    delegate: Button {
                        height: 60
                        width: 300
                        padding: 20
                        Text {
                            property int index
                            anchors.centerIn: parent
                            font.bold: true
                            font.pixelSize: 18
                            text: modelData
                        }
                        background: Rectangle {
                            color: '#fffbfe'
                        }
                        onClicked: {
                            currentIndex = index;
                        }
                    }
                }
            }
        }

        Loader {
            width: parent.width - 200
            height: parent.height
            sourceComponent: {
                switch (currentIndex) {
                case 0:
                    return getAttendanceComponent;
                case 1:
                    return attendanceComponent;
                }
            }
        }

        Component {
            id: getAttendanceComponent
            Column {

                y: 350
                Row{
                    x:120
                    spacing:180
                TextField {
                y:5
                id: date_field
                placeholderText: qsTr("yyyy/mm/dd")
                width: 200
            }
                ComboBox {
                    id: comboBox
                    width: 200
                    editable: true
                    model: courses

                   
                }

                RoundButton {
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("View Attendance")
                        color: "white"
                    }
                    width: 150
                    height: 60
                    x: 500

                    radius: 50
                    Material.background: '#740041'

                    onClicked: {
                        attendance_api.fetch_attendance(1, "2023-12-31");
                        view_attendance_popup.open();
                    }
                }
            }
            }
        }

    }

    Component {
        id: attendanceComponent
        Column {
            y:80
            Image{
                x:300
                width:500
                height:500
                source:'https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/attendance_marking.svg'
            }
            Row{
                x:450
            Button {
                height:60
                width:200
                Material.background: "#740041"
                Text {
                    anchors.centerIn:parent
                    font.pixelSize: 16
                    color:"#ffffff"
                    text: qsTr("Mark Attendance")
                }
                onClicked: {
                    attendance_api.mark_attendance();
                }
            }
            }
        }
    }
}

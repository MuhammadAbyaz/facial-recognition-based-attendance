import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material
import Qt.labs.qmlmodels

Page {
    title: "Smart Attendance"
    property int currentIndex : 0
    property var courses: teacher_api.courses_model()
    property var options: ["View Attendance", "Mark Attendance"]

    Row {
        anchors.fill: parent

        Pane {
            width: 300
            height: parent.height
            Material.elevation: 6

            Image{
                x: -10
                y: -120
                height: 300
                width: 300
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logo.png"
            }
            Column{
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.centerIn: parent
                width: 300
                spacing: -11
                
                Repeater{
                    id: course_repeater
                    model: options
                    delegate: Button {
                            height: 60
                            width: 300
                            padding: 20
                            Text{
                                property int index
                                anchors.centerIn: parent
                                font.bold: true
                                font.pixelSize: 18
                                text: modelData
                                color: 'white'
                            }
                            background: Rectangle{
                                color: '#740041'
                            }
                        onClicked: {
                            currentIndex = index
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
                    case 0: return getAttendanceComponent;
                    case 1: return attendanceComponent;
                }
            }
        }
        
        Component {
            id: getAttendanceComponent

            Column{
                anchors.fill: parent


            TableView {
                anchors.fill: parent
                columnSpacing: 1
                rowSpacing: 1
                clip: true

                model: TableModel {
                    id: attendance_model
                    TableModelColumn { display: "date" }
                    TableModelColumn { display: "studentID" }
                    TableModelColumn { display: "courseID" }

                    rows: []
                }
                Connections{
                target: attendance_api
                function onDataChanged() {
                    attendance_model.clear()
                    var attendance = attendance_api.attendance
                    for (var i = 0; i < attendance.length; ++i) {
                        attendance_model.appendRow(attendance[i])
                        console.log(JSON.stringify(attendance_model.getRow(0)))
                    }
                }
            }
                delegate: Column{
                    Row{
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
                Button {
                    anchors.centerIn: parent
                    text: "Fetch Data"
                    onClicked: {
                        attendance_api.fetch_attendance(1,"2023-12-31")
                    }
                }
                }
            }
        }


        Component {
            id: attendanceComponent
            Column {
                anchors.fill: parent
                Button{
                    Text{
                        text: qsTr("Mark Attendance")
                    }
                    onClicked: {
                        attendance_api.mark_attendance()
                    }
                }
            }
        }
    }
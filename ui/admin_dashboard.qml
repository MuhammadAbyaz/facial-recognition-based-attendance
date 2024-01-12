import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Smart Attendance"
    property var options: ["Teachers", "Students", "Report a bug", "Logout"]
    property int currentIndex: 0

    //teacher popups


    Popup {
        id: add_teacher_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Add Teacher</h1>")
                x: 80
            }
            TextField {
                id: teacher_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: teacher_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: teacher_password_field
                placeholderText: qsTr("Password")
                width: 300
            }
            Row {
                spacing: 50
                RadioButton {
                    id: teacher_gender_male
                    text: qsTr("Male")
                }
                RadioButton {
                    id: teacher_gender_female
                    text: qsTr("Female")
                }
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Add")
                }
            }
        }
    }
    Popup {
        id: delete_teacher_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Delete Teacher</h1>")
                x: 80
            }
            TextField {
                id: teacher_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Delete")
                }
            }
        }
    }

    Popup {
        id: edit_teacher_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Edit Teacher</h1>")
                x: 80
            }
            TextField {
                id: teacher_edit_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
            TextField {
                id: teacher_edit_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: teacher_edit_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: teacher_edit_password_field
                placeholderText: qsTr("Password")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Edit")
                }
            }
        }
    }
    Popup {
        id: view_teacher_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>View Teacher</h1>")
                x: 80
            }
            TextField {
                id: teacher_view_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
            Button {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("View")
                }
            }
        }
    }


    // student popups


    Popup {
        id: add_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Add Student</h1>")
                x: 80
            }
            TextField {
                id: student_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: student_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: student_roll_no_field
                placeholderText: qsTr("Roll number")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Add")
                }
            }
        }
    }
    Popup {
        id: delete_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Delete Student</h1>")
                x: 80
            }
            TextField {
                id: student_id_field
                placeholderText: qsTr("Student Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Delete")
                }
            }
        }
    }

    Popup {
        id: edit_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Edit Student</h1>")
                x: 80
            }
            TextField {
                id: student_edit_id_field
                placeholderText: qsTr("Student Id")
                width: 300
            }
            TextField {
                id: student_edit_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: student_edit_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: student_edit_roll_no_field
                placeholderText: qsTr("Roll number")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Edit")
                }
            }
        }
    }
    Popup {
        id: view_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>View Student</h1>")
                x: 80
            }
            TextField {
                id: student_view_id_field
                placeholderText: qsTr("Student Id")
                width: 300
            }
            Button {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("View")
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
            // You can customize the appearance of the sidebar here
            // Dark background color
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
                spacing: 4
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
                            // color: 'white'
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
                    return teacherPage;
                case 1:
                    return studentPage;
                case 2:
                    return reportPage;
                }
            }
        }

        // teacher component

        Component {
            id: teacherPage

            Column {

                y: 230

                Row {
                    x: 480
                    spacing: 50
                    RoundButton {
                        x: 50
                        height: 120
                        width: 120
                        Material.background: "#ffffff"
                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
                        }
                        onClicked: {
                            add_teacher_popup.open();
                        }
                    }
                    RoundButton {
                        x: 70
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/delete.png"
                        }

                        onClicked: {
                            delete_teacher_popup.open();
                        }
                    }
                }
                spacing: 50
                Row {
                    x: 480
                    spacing: 50
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/edit.png"
                        }

                        onClicked: {
                            edit_teacher_popup.open();
                        }
                    }
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/view.png"
                        }

                        onClicked: {
                            view_teacher_popup.open();
                        }
                    }
                }
            }
        }

        // student componenet


        Component {
            id: studentPage
            Column {
                y: 230
                Row {
                    x: 480
                    spacing: 50
                    RoundButton {
                        x: 50
                        height: 120
                        width: 120
                        Material.background: "#ffffff"
                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
                        }
                        onClicked: {
                            add_student_popup.open();
                        }
                    }
                    RoundButton {
                        x: 70
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/delete.png"
                        }

                        onClicked: {
                            delete_student_popup.open();
                        }
                    }
                }
                spacing: 50
                Row {
                    x: 480
                    spacing: 50
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/edit.png"
                        }

                        onClicked: {
                            edit_student_popup.open();
                        }
                    }
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/view.png"
                        }

                        onClicked: {
                            view_student_popup.open();
                        }
                    }
                }
            }
        }
        Component {
            id: reportPage
            Column {
                y: 150
                Text {
                    x: 440
                    text: qsTr("<h1>Bug Report</h1>")
                    font.pixelSize: 30
                    color: "#740041"
                }
                spacing: 50
                Column {
                    x: 450
                    spacing: 10
                    TextField {
                        id: bugtitle
                        placeholderText: qsTr("Enter Bug Title")
                        width: 300
                    }
                    TextArea {
                        id: bugdescriptionfield
                        placeholderText: qsTr("Describe the bug ....")
                        width: 300
                    }
                    TextField {
                        id: contact
                        placeholderText: qsTr("Contact info(optional)")
                        width: 300
                        echoMode: TextInput.Password
                    }
                    Button {
                        x: 80
                        text: qsTr("Submit")
                        width: 150
                        height: 60
                        background: Rectangle {
                            radius: 50
                            color: '#740041'
                        }
                        highlighted: true
                    }
                }
            }
        }
    }
}

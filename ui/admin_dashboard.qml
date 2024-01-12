import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Smart Attendance"
    property var options: ["Teachers", "Students", "Report a bug", "Logout"]
    property int currentIndex: 0
    Popup {
        id: add_popup
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
            x:80
        }
            TextField {
                id: name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: password_field
                placeholderText: qsTr("Password")
                width: 300
            }
            Row {
                spacing: 50
                RadioButton {
                    id: gender_male
                    text: qsTr("Male")
                }
                RadioButton {
                    id: gender_female
                    text: qsTr("Female")
                }
            }
            Button {    
                        x:120
                        width: 70
                        height: 50
                        background: Rectangle {
                            radius: 50
                            color: '#740041'
                            Image {
                                width:18
                                height:18
                                anchors.centerIn: parent
                                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
                            }
                        }
                        highlighted: true
                    }
        }
    }
    Popup {
        id: delete_popup
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
            x:80
        }
            TextField {
                id: id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
           Button {    
                        x:120
                        width: 70
                        height: 50
                        background: Rectangle {
                            radius: 50
                            color: '#740041'
                            Image {
                                width:18
                                height:18
                                anchors.centerIn: parent
                                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/delete.png"
                            }
                        }
                        highlighted: true
                    } 
        }
    }
    Popup {
        id: edit_popup
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
            x:80
        }
            TextField {
                id: edit_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
             TextField {
                id: edit_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: edit_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: edit_password_field
                placeholderText: qsTr("Password")
                width: 300
            }
           Button {    
                        x:120
                        width: 70
                        height: 50
                        background: Rectangle {
                            radius: 50
                            color: '#740041'
                            Image {
                                width:18
                                height:18
                                anchors.centerIn: parent
                                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/edit.png"
                            }
                        }
                        highlighted: true
                    } 
        }

    }
    Popup {
        id: view_popup
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
            x:80
        }
            TextField {
                id: view_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
           Button {    
                        x:120
                        width: 70
                        height: 50
                        background: Rectangle {
                            radius: 50
                            color: '#740041'
                            Image {
                                width:18
                                height:18
                                anchors.centerIn: parent
                                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/view.png"
                            }
                        }
                        highlighted: true
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
                case 3:
                    return teampage;
                }
            }
        }
        Component {
            id: teacherPage
            Column {
                y: 230
                Row {
                    x: 480
                    spacing: 50
                    // Button {
                    //     x: 50
                    //     width: 120
                    //     height: 120
                    //     background: Rectangle {
                    //         radius: 120
                    //         color: '#740041'
                    //         Image {
                    //             anchors.centerIn: parent
                    //             source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
                    //         }
                    //     }
                    //     highlighted: true
                    //     onClicked: {
                    //         add_popup.open();
                    //     }
                    // }
                RoundButton {
            x: 50
            height: 100
            width: 100
            Material.accent: Material.Red
            Image {
                anchors.centerIn: parent
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
            }
        }
                    Button {
                        x: 70
                        width: 120
                        height: 120
                        background: Rectangle {
                            radius: 120
                            color: '#740041'
                            Image {
                                anchors.centerIn: parent
                                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/delete.png"
                            }
                            Material.elevation: 6
                        }
                        highlighted: true
                        onClicked: {
                            delete_popup.open();
                        }
                    }
                }
                spacing: 50
                Row {
                    x: 480
                    spacing: 50
                    Button {
                        x: 90
                        width: 120
                        height: 120
                        background: Rectangle {
                            radius: 120
                            color: '#740041'
                            Image {
                                anchors.centerIn: parent
                                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/edit.png"
                            }
                        }
                        highlighted: true
                        onClicked: {
                            edit_popup.open();
                        }
                    }
                    Button {
                        x: 90
                        width: 120
                        height: 120
                        background: Rectangle {
                            radius: 120
                            color: '#740041'
                            Image {
                                anchors.centerIn: parent
                                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/view.png"
                            }
                        }
                        highlighted: true
                        onClicked: {
                            view_popup.open();
                        }
                    }
                }
            }
        }
        Component {
            id: studentPage
            Column {
                Text {
                    anchors.centerIn: parent
                    text: "Settings Page"
                    font.pixelSize: 20
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

    Text {
        anchors.centerIn: parent
        property string username: login_api.get_username()
        text: username
    }
}

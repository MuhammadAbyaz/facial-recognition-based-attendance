import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Facial Recognition Based Attendance"

    RowLayout {
        x: 0
        y: -200
        width: 1530
        height: 500
        Image {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/Frame%201.png"
        }
    }
    RowLayout {
        spacing: 50
        y: 150
        Column {
            y: 150
            Image {
                width: 765
                height: 500
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/login_ill.png"
                fillMode: Image.PreserveAspectFit
            }
        }
        Column {
            spacing: 10
            Pane {
                rotation: 0
                x: 120
                height: 500
                width: 500
                Text {
                    x: 160
                    text: qsTr("<b>WELCOME</b>")
                    font.family: "Helvetica"
                    font.pointSize: 24
                    color: "#740041"
                }
                Column {
                    spacing: 10
                    anchors.centerIn: parent
                    TextField {
                        id: usernameField
                        placeholderText: qsTr("Username or Email")
                        width: 300
                    }
                    TextField {
                        id: passwordField
                        placeholderText: qsTr("Password")
                        width: 300
                        echoMode: TextInput.Password
                    }
                    Button {
                        x: 80
                        text: qsTr("Login")
                        width: 150
                        height: 60
                        background: Rectangle {
                            radius: 100
                            color: '#740041'
                        }
                        highlighted: true
                        onClicked: {
                            stackView.push("admin_dashboard.qml");
                        }
                    }
                }
                Text {
                    x: 160
                    anchors.bottom: parent.bottom
                    text: qsTr("<b>In collaboration with</b>")
                    font.pixelSize: 15
                    color: "#740041"
                }
                Image {
                    x: 310
                    height: 30
                    width: 30
                    anchors.bottom: parent.bottom
                    source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/Frame%201%20(2).png"
                }
            }
        }
    }
}

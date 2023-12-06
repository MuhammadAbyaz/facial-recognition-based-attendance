import QtQuick 2.16
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Facial Recognition Based Attendance"
    Image {
            x: 680
            y: 100
            width: 165
            height: 135
            source: "https://upload.wikimedia.org/wikipedia/en/thumb/8/8b/NEDUET_logo.svg/1200px-NEDUET_logo.svg.png"
            fillMode: Image.PreserveAspectFit
        }
    Column {
        anchors.centerIn: parent
        spacing: 20
        
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
            text: qsTr("Login")
            width: 150
            height:60
            x: 73
            Material.background: Material.Blue
            highlighted: true
            onClicked: {
                con.login(usernameField.text, passwordField.text);
                stackView.push("dashboard.qml");
            }

        }
    }
}
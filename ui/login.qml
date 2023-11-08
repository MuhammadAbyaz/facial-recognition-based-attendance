import QtQuick 2.16
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Facial Recognition Based Attendance"
    Column {
        anchors.centerIn: parent
        spacing: 10

        TextField {
            id: usernameField
            placeholderText: qsTr("Username or Email")
            width: 300
        }

        TextField {
            id: passwordField
            placeholderText: qsTr("Secret Password")
            width: 300
            echoMode: TextInput.Password
        }

        Button {
            text: qsTr("Login")
            width: 300
            Material.background: Material.accent
            highlighted: true
            onClicked: {
                con.login(usernameField.text, passwordField.text);
                stackView.push("dashboard.qml");
            }
        }
    }
}

import QtQuick 2.16
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Facial Recognition Based Attendance"

    Image {
        width: 1400
        height: 700
        x: 45
        y: -260
        source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logo.png"
        fillMode: Image.PreserveAspectFit
    }

    Column {
        y: 150
        Image {
            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/login_illustration.png"
            fillMode: Image.PreserveAspectFit
        }
    }
    Image {
        x: 1000
        y: 155
        width: 180
        height: 150
        source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/ned_logo.png"
        fillMode: Image.PreserveAspectFit
    }
    Column {
        spacing: 20
        x: 700
        y: 370
        TextField {
            id: usernameField
            placeholderText: qsTr("Username or Email")
            width: 300
            x: 250
        }
        TextField {
            id: passwordField
            placeholderText: qsTr("Password")
            width: 300
            echoMode: TextInput.Password
            x: 250
        }
        Button {
            text: qsTr("Login")
            width: 150
            height: 60
            x: 323
            background: Rectangle {
                radius: 50
                color: '#740041'
            }
            highlighted: true
            onClicked: {
                con.login(usernameField.text, passwordField.text);
                stackView.push("admin_dashboard.qml");
            }
        }
    }
}

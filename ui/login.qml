import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Facial Recognition Based Attendance"

    Popup {
        id: popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Label {
            id: popupText
            text: "Error"
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'red'
        }
    }

Row{
    height:200
    width:parent.width
    anchors.top:parent.top
    Image {
        anchors.centerIn:parent
        source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logo.svg"
        fillMode: Image.PreserveAspectFit
    }
}
    Column {
        x:50
        y: 150
        Image {
            width:850
            height:450
            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/login_illustration.svg"
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
            id: emailField
            placeholderText: qsTr("Email")
            width: 300
            x: 250
            text: "m.abyaz681@gmail.com"
        }
        Text {
            id: emailFieldError
            font.pixelSize: 12
            x: 250
            padding: 0
            color: 'red'
        }
        TextField {
            id: passwordField
            placeholderText: qsTr("Password")
            width: 300
            echoMode: TextInput.Password
            x: 250
            text: 'nothing78'
        }
        Text {
            id: passwordFieldError
            font.pixelSize: 12
            x: 250
            padding: 0
            color: 'red'
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
                if (!emailField.text) {
                    emailFieldError.text = 'Email can\'t be empty.'
                    return;
                }
                emailFieldError.text  = '';
                if (!passwordField.text) {
                    passwordFieldError.text = 'Password can\'t be empty.'
                    return;
                }
                passwordFieldError.text = '';
                var result = login_api.login(emailField.text, passwordField.text);
                if (result.success) {
                    stackView.replace("teacher_dashboard.qml");
                } else {
                    popupText.text = result.error;
                    popup.open();
                }
            }
        }
    }
}

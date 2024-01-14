import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Smart Attendance"
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
        anchors.left: parent.left
        height: parent.height
        width: 700
        Image {
            anchors.centerIn: parent
            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/login_illustration.svg"
        }
    }
    Text{
        x:1040
        y:270
        text: qsTr("<h1>WELCOME</h1>")
        color: "#740041"
    }
    Column {
        spacing: 20
        height: parent.height
        x: 700
        y: 340
        TextField {
            id: emailField
            placeholderText: qsTr("Email")
            width: 300
            x: 250
            text: ""
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
            text: ''
        }
        Text {
            id: passwordFieldError
            font.pixelSize: 12
            x: 250
            padding: 0
            color: 'red'
        }
        RoundButton {
            Text{
            anchors.centerIn: parent
            text: qsTr("Login")
            color: "white"
            }
            width: 150
            height: 60
            x: 323
            radius:  50
            Material.background: '#740041'
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
                if (result.success && emailField.text == "asmakhan@neduet.edu.pk" &&
                    passwordField.text == "password") {
                    stackView.replace("admin_dashboard.qml");
                } else if (result.success){
                    stackView.replace("teacher_dashboard.qml");
                }
                else {
                    popupText.text = result.error;
                    popup.open();
                }
            }
        }
    }
    Row{
        height:30
        width: parent.width
        anchors.bottom: parent.bottom
    Text{
        anchors.centerIn: parent
        text: qsTr("In collaboration with")
        color: "#740041"
        font.pixelSize:17
        font.bold: true
    }
    Image{
        x: 860
        y:-2
        source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/ned_logo.svg"
    }
    }


}

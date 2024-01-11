import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

ApplicationWindow {
    visible: true
    height: 780
    width: 1530
    title: qsTr("Smart Attendance")
    flags: Qt.Window | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint
    Material.theme: Material.Light
    Material.accent: "#000000"

    onClosing: {
        var result = login_api.sign_out()
        console.log(result)
    }

    StackView {
        id: stackView
        initialItem: "test.qml"
        anchors.fill: parent
    }
}

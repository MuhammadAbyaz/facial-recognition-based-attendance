import QtQuick 2.16
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

ApplicationWindow {
    visible: true
    height: 800
    width: 800
    title: qsTr("Facial Recognition Based Attendance")
    flags: Qt.Window | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowCloseButtonHint
    Material.theme: Material.Light
    Material.accent: "#000000"

    StackView {
        id: stackView
        initialItem: "login.qml"
        anchors.fill: parent
    }
}

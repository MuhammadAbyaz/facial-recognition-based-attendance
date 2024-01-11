import QtQuick 2.16
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: 'Admin Dashboard'

    TabBar {
        id: tabBar
        x: -245
        y: 0
        width: 1800
        height: 70
        rotation: 0
        background: Pane {
            Material.elevation: 6
        }
    }
    Image {
        x: 20
        y: -120
        width: 270
        height: 312
        source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logo.png"
        fillMode: Image.PreserveAspectFit
    }
    TabBar {
        x: 880
        y: 12
        TabButton {
            id: tabButton
            x: 770
            y: 12
            width: 100
            height: 48
            text: qsTr("Teachers")
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 14
            rotation: 0
        }

        TabButton {
            id: student_button
            x: 900
            y: 12
            width: 100
            height: 48
            text: qsTr("Students")
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 14
            rotation: 0
        }
        TabButton {
            id: report_button
            x: 1020
            y: 12
            width: 100
            height: 48
            text: qsTr("Report")
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 14
            rotation: 0
        }
        TabButton {
            id: policy_button
            x: 1140
            y: 12
            width: 100
            height: 48
            text: qsTr("Policy")
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 14
            rotation: 0
        }

        TabButton {
            id: team_button
            x: 1260
            y: 12
            width: 100
            height: 48
            text: qsTr("Team")
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 14
            rotation: 0
        }
        TabButton {
            id: logout_button
            x: 1380
            y: 12
            width: 100
            height: 48
            text: qsTr("Logout")
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 14
            rotation: 0

            onClicked: {
                logoutMenu.open();
            }

            Menu {
                id: logoutMenu
                y: logout_button.height
                MenuItem {
                    text: "Log Out"
                    onTriggered: {
                        print("logging out...");
                    }
                }
                MenuItem {
                    text: "Stay logged In"
                    onTriggered: {
                        print("Staying logged in...");
                    }
                }
            }
        }

        Rectangle {
            id: hoverLine
            width: 20
            height: 1
            color: "blue"
            visible: false

            anchors {
                // top: parent.bottom
                topMargin: -2
            }
        }
    }

    Text {
        anchors.centerIn: parent
        property string username: login_api.get_username()
        text: username
    }
}

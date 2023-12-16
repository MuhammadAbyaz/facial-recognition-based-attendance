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
        y: 238
        width: 785
        height: 300
        rotation: 90
        background: Pane {
            Material.elevation: 6
        }
    }
    Image {
        x: 10
        y: -96
        width: 270
        height: 312
        source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logo.png"
        fillMode: Image.PreserveAspectFit
    }
    TabButton {
        id: tabButton
        x: 19
        y: 138
        width: 280
        height: 48
        text: qsTr("Teachers")
        font.weight: Font.Normal
        font.bold: false
        font.pointSize: 14
        rotation: 0

        Label {
            font.pixelSize: 16
            Image {
                id: image1
                x: 35
                y: 10
                width: 30
                height: 30
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/teacher.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    TabButton {
        id: student_button
        x: 19
        y: 200
        width: 280
        height: 48
        text: qsTr("Students")
        font.weight: Font.Normal
        font.bold: false
        font.pointSize: 14
        rotation: 0

        Label {
            font.pixelSize: 16
            Image {
                x: 35
                y: 10
                width: 30
                height: 30
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/student.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    TabButton {
        id: report_button
        x: 19
        y: 262
        width: 280
        height: 48
        text: qsTr("Report")
        font.weight: Font.Normal
        font.bold: false
        font.pointSize: 14
        rotation: 0

        Label {
            font.pixelSize: 16
            Image {
                x: 35
                y: 10
                width: 30
                height: 30
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/report.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    TabButton {
        id: policy_button
        x: 19
        y: 324
        width: 280
        height: 48
        text: qsTr("Policy")
        font.weight: Font.Normal
        font.bold: false
        font.pointSize: 14
        rotation: 0

        Label {
            font.pixelSize: 16
            Image {
                x: 35
                y: 10
                width: 30
                height: 30
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/terms.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    // ToolSeparator {
    //     rotation: 0
    //     width: 240
    //     x: 30
    //     y: 386
    //     orientation: Qt.Horizontal
    // }
    Pane {
        x: 30
        y: 386
        width: 240
        height: 0
        Material.elevation: 3
    }
    TabButton {
        id: team_button
        x: 19
        y: 420
        width: 280
        height: 48
        text: qsTr("Team")
        font.weight: Font.Normal
        font.bold: false
        font.pointSize: 14
        rotation: 0

        Label {
            font.pixelSize: 16
            Image {
                x: 35
                y: 10
                width: 30
                height: 30
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/team.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    TabButton {
        id: logout_button
        x: 19
        y: 482
        width: 280
        height: 48
        text: qsTr("Logout")
        font.weight: Font.Normal
        font.bold: false
        font.pointSize: 14
        rotation: 0

        Label {
            font.pixelSize: 16
            Image {
                x: 35
                y: 10
                width: 30
                height: 30
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logout.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    Text {
        text: 'Copyright © 2024 ASK Pvt. Ltd.'
        font.bold: false
        font.weight: Font.Normal
        font.pixelSize: 10
        x: 80
        y: 750
    }
}

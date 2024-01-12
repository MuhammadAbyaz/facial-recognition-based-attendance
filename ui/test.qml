import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material
import Qt.labs.qmlmodels

Page {
    Column {
        RoundButton {
            height: 80
            width: 80
            Image {
                anchors.centerIn: parent
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/delete.png"
            }
        }
    }
}

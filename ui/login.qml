import QtQuick 2.16

import QtQuick.Layouts

import QtQuick.Controls

import QtQuick.Window

import QtQuick.Controls.Material



Page {



    title: "Facial Recognition Based Attendance"



    Row {



        y: 60



        width: 1530



        Image {



            anchors.centerIn: parent



            source: "https://i.imgur.com/8LLR5Lp.png"



            fillMode: Image.PreserveAspectFit

        }

    }



    //  Pane {



    //     x:175



    //     y:125



    //     width: 450



    //     height: 600



    //     Material.elevation: 7



    // }



    Column {



        y: 150



        Image {



            source: "https://i.imgur.com/IMzUmnl.png"



            fillMode: Image.PreserveAspectFit

        }

    }



    Image {



        x: 1000



        y: 155



        width: 180



        height: 150



        source: "https://upload.wikimedia.org/wikipedia/en/thumb/8/8b/NEDUET_logo.svg/1200px-NEDUET_logo.svg.png"



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

                stackView.push("dashboard.qml");

            }

        }

    }

}


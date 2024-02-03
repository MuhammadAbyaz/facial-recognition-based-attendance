import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

Page {
    title: "Smart Attendance"
    property var options: ["Teachers", "Students","Courses"]
    property int currentIndex: 0
    property var courses : admin_api.get_courses()
    property var selected_courses : []
    Popup {
        id: error_popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Label {
            id: error_popup_text
            text: "Error"
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'red'
        }
    }

//TEACHER POPUPS

    // add popup
    Popup{
        id: teacher_created_popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Label {
            id: teacher_created_popup_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
    }

    // delete popup
    Popup{
        id: teacher_removed_popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Label {
            id: teacher_removed_popup_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
    }

    // view popup
    Popup{
        id: teacher_viewed_popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Column{
            spacing: 20
        Row{
            anchors.top: parent.top
            width: parent.width
        Text{
            anchors.centerIn: parent
            text: qsTr("<h1>Teacher</h1>")
            color: "#740041"
        }
        }
        Label {
            id: teacher_viewed_name_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        Label {
            id: teacher_viewed_email_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        Label {
            id: teacher_viewed_gender_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        }
    }

    // add teacher popup
    Popup {
        id: add_teacher_popup
        x: 630
        y: 180
        height: 450
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Add Teacher</h1>")
                x: 80
            }
            TextField {
                id: teacher_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: teacher_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: teacher_password_field
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
                width: 300
            }            
            TextField {
                id: course_id_field
                placeholderText: qsTr("Course ID")
                width: 300
            }
            Row {
                spacing: 50
                RadioButton {
                    id: teacher_gender_male
                    text: qsTr("Male")
                }
                RadioButton {
                    id: teacher_gender_female
                    text: qsTr("Female")
                }
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Add")
                }
                onClicked:{
                    var gender = ""
                    if (teacher_gender_male.checked){
                        gender = teacher_gender_male.text
                    } else{
                        gender = teacher_gender_female.text
                    }
                    var teacher_id = admin_api.add_teacher(teacher_name_field.text,teacher_email_field.text,teacher_password_field.text,gender,parseInt(course_id_field.text))
                    teacher_created_popup_text.text = "Teacher created with id: " + teacher_id
                    teacher_name_field.text = ""
                    teacher_email_field.text = ""
                    teacher_password_field.text = ""
                    course_id_field.text = ""
                    add_teacher_popup.close()
                    teacher_created_popup.open()
                }
            }
        }
    }

    // delete teacher popup
    Popup {
        id: delete_teacher_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Delete Teacher</h1>")
                x: 80
            }
            TextField {
                id: teacher_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Delete")
                }
                onClicked: {
                    var teacher_id = admin_api.delete_teacher(parseInt(teacher_id_field.text))
                    teacher_id_field.text = ""
                    delete_teacher_popup.close()
                    teacher_removed_popup_text.text = "Teacher with id: "+ teacher_id+ " successfully removed"
                    teacher_removed_popup.open()
                }
            }
        }
    }

    // edit teacher popup
    Popup {
        id: edit_teacher_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Edit Teacher</h1>")
                x: 80
            }
            TextField {
                id: teacher_edit_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
            TextField {
                id: teacher_edit_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: teacher_edit_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: teacher_edit_password_field
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Update")
                }
                onClicked: {
                    var teacher_id = teacher_edit_id_field.text
                    if (!teacher_id){
                        error_popup_text.text =  'ID can\'t  be empty';
                        error_popup.open();
                        return
                    }
                    teacher_id  = parseInt(teacher_id);

                    const payload = {};
                    var teacher_name = teacher_edit_name_field.text
                    teacher_edit_name_field.text = ""
                    if (teacher_name) {
                        payload["name"] = teacher_name
                    }
                    var teacher_email = teacher_edit_email_field.text
                    teacher_edit_email_field.text = ""
                    if (teacher_email) {
                        payload["email"] = teacher_email
                    }
                    var teacher_password = teacher_edit_password_field.text
                    teacher_edit_password_field.text = ""
                    if (teacher_password){
                        payload["password"] = teacher_password
                    }
                    var response = admin_api.edit_teacher(teacher_id,payload)
                    teacher_created_popup_text.text = "Teacher with id "+response + " successfully updated"
                    edit_teacher_popup.close()
                    teacher_created_popup.open()
                    teacher_created_popup_text.text = ""
                }
            }
        }
    }

    // view teacher popup
    Popup {
        id: view_teacher_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                x: 80
                color: '#740041'
                text: qsTr("<h1>View Teacher</h1>")
            }
            TextField {
                id: teacher_view_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("View")
                }
                onClicked: {
                    var teacher_json = admin_api.get_teacher(parseInt(teacher_view_id_field.text))
                    teacher_view_id_field.text = ""
                    view_teacher_popup.close()
                    teacher_viewed_name_text.text = "Name: "+ teacher_json.name
                    teacher_viewed_email_text.text = "Email: "+ teacher_json.email
                    teacher_viewed_gender_text.text = "Gender: "+ teacher_json.gender
                    teacher_viewed_popup.open()
                }
            }
        }
    }

// STUDENT POPUPS

    // view popup
    Popup{
        id: student_viewed_popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Column{
            spacing: 20
        Row{
            anchors.top: parent.top
            width: parent.width
        Text{
            anchors.centerIn: parent
            text: qsTr("<h1>Student</h1>")
            color: "#740041"
        }
        }
        Label {
            id: student_viewed_name_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        Label {
            id: student_viewed_email_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        Label {
            id: student_viewed_roll_no_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        }
    }

    // delete popup
    Popup{
        id: student_removed_popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Label {
            id: student_removed_popup_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
    }

    // add student popup
    Popup {
        id: add_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Add Student</h1>")
                x: 80
            }
            TextField {
                id: student_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: student_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: student_roll_no_field
                placeholderText: qsTr("Roll number")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Add")
                }
                onClicked:{
                    var student_name = student_name_field.text
                    var student_email = student_email_field.text
                    var student_roll_number = student_email_field.text
                    student_name_field.text = ""
                    student_email_field.text = ""
                    student_roll_no_field.text = ""
                    var student_id = admin_api.add_student(student_name,student_email,student_roll_number)
                    teacher_created_popup_text.text = "Student successfully created with id: "+student_id
                    add_student_popup.close()
                    teacher_created_popup.open()
                }
            }
        }
    }

    // delete student popup
    Popup {
        id: delete_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Delete Student</h1>")
                x: 80
            }
            TextField {
                id: student_id_field
                placeholderText: qsTr("Student Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Delete")
                }
                onClicked: {
                    var student_id = admin_api.delete_student(parseInt(student_id_field.text))
                    student_id_field.text = ""
                    delete_student_popup.close()
                    student_removed_popup_text.text = "Student with id "+student_id+" deleted successfully"
                    student_removed_popup.open()
                }
            }
        }
    }

    // edit student popup
    Popup {
        id: edit_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Edit Student</h1>")
                x: 80
            }
            TextField {
                id: student_edit_id_field
                placeholderText: qsTr("Student Id")
                width: 300
            }
            TextField {
                id: student_edit_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: student_edit_email_field
                placeholderText: qsTr("Email")
                width: 300
            }
            TextField {
                id: student_edit_roll_no_field
                placeholderText: qsTr("Roll number")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Edit")
                }
                onClicked: {
                    var student_id = student_edit_id_field.text
                    student_edit_id_field.text = ""
                    if (!student_id){
                        error_popup_text.text =  'ID can\'t  be empty';
                        error_popup.open();
                        return
                    }
                    student_id  = parseInt(student_id);

                    const payload = {};
                    var student_name = student_edit_name_field.text
                    student_edit_name_field.text = ""
                    if (student_name) {
                        payload["name"] = student_name
                    }
                    var student_email = student_edit_email_field.text
                    student_edit_email_field.text = ""
                    if (student_email) {
                        payload["email"] = student_email
                    }
                    var student_roll_number = student_edit_roll_no_field.text
                    student_edit_roll_no_field.text = ""
                    if (student_roll_number){
                        payload["roll_number"] = student_roll_number
                    }
                    var response = admin_api.edit_student(student_id,payload)
                    teacher_created_popup_text.text = "Student with id "+response + " successfully updated"
                    edit_student_popup.close()
                    teacher_created_popup.open()
                }
            }
        }
    }

    // view student popup
    Popup {
        id: view_student_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>View Student</h1>")
                x: 80
            }
            TextField {
                id: student_view_id_field
                placeholderText: qsTr("Student Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("View")
                }
                onClicked: {
                    var student_json = admin_api.view_student(parseInt(student_view_id_field.text))
                    student_view_id_field = ""
                    view_student_popup.close()
                    student_viewed_name_text.text = "Name: "+ student_json.name
                    student_viewed_email_text.text = "Email: "+ student_json.email
                    student_viewed_roll_no_text.text = "Roll Number: "+ student_json.roll_number
                    student_viewed_popup.open()
                }
            }
        }
    }

    // enroll course popup
    Popup {
        id: enroll_course_popup
        x: 800
        y: 250

        Column {
            anchors.fill: parent
            Column{
                spacing: 10
            Text{
                x: 5
                y: 100
                text: qsTr("<h1>Enroll in course</h1>")
                color: "#740041"
            }
            TextField {
                id: enroll_course_id_field
                placeholderText: qsTr("Student Id")
                width: 300
            }
            Repeater {
                        model: courses
                        delegate: CheckBox {
                            width: 200
                                text: courses[index].courseName
                                checked : false
                                onClicked: {
                                    if (checked){
                                        selected_courses.push(index)
                                    } else{
                                        var item_index = selected_courses.findIndex(element => element === index)
                                        if (item_index!=-1){ 
                                        selected_courses.splice(item_index, 1)
                                    }
                                    }
                                }
                            }
            }
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Enroll")
                }
                onClicked:{
                    if (selected_courses.length == 0){
                        error_popup_text.text = "Select atleast one course"
                    }
                    else{
                        var course_ids = []
                        for (var value of selected_courses){
                            course_ids.push(courses[parseInt(value)]["courseID"])
                        }
                        var id = parseInt(enroll_course_id_field.text)
                        var result = admin_api.enroll_in_course(id,course_ids)
                        teacher_created_popup_text.text = "Course enrolled for student id: "+ id
                        enroll_course_popup.close()
                        teacher_created_popup.open()
                    }
                }
            }
        }
    }

// COURSES POPUPS

    // view popup
    Popup{
        id: course_viewed_popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        modal: true
        focus: true
        Column{
            spacing: 20
        Row{
            anchors.top: parent.top
            width: parent.width
        Text{
            anchors.centerIn: parent
            text: qsTr("<h1>View Course</h1>")
            color: "#740041"
        }
        }
        Label {
            id: course_viewed_id_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        Label {
            id: course_viewed_name_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        Label {
            id: course_viewed_instructor_id_text
            text: ""
            font.pixelSize: 18
            font.bold: true
            padding: 10
            horizontalAlignment: Label.AlignHCenter
            color: 'black'
        }
        }
    }
    // add course popup
    Popup {
        id: add_course_popup
        x: 630
        y: 180

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Add Course</h1>")
                x: 80
            }
            TextField {
                id: course_name_field
                placeholderText: qsTr("Course Name")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Add")
                }
                onClicked:{
                    var course_name = admin_api.add_course(course_name_field.text)
                    course_name_field.text = ""
                    teacher_removed_popup_text.text = "Course added with course id: "+ course_name
                    add_course_popup.close()
                    teacher_removed_popup.open()
                }
            }
        }
    }
    // view course popup
    Popup {
        id: view_course_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>View Course</h1>")
                x: 80
            }
            TextField {
                id: course_view_id_field
                placeholderText: qsTr("Course Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("View")
                }
                onClicked: {
                    var course_id = parseInt(course_view_id_field.text)
                    course_view_id_field.text = ""
                    var course = admin_api.view_course(course_id)
                    view_course_popup.close()
                    course_viewed_id_text.text = "Course ID: "+ course_id
                    course_viewed_name_text.text = "Course Name: "+ course.courseName
                    course_viewed_instructor_id_text.text = "Instructor ID: "+ course.teacherID
                    course_viewed_popup.open()
                }
            }
        }
    }
    // edit course popup
    Popup {
        id: edit_course_popup
        x: 630
        y: 180
        height: 400
        width: 600

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                color: '#740041'
                text: qsTr("<h1>Edit Course</h1>")
                x: 80
            }
            TextField {
                id: course_edit_id_field
                placeholderText: qsTr("Course Id")
                width: 300
            }
            TextField {
                id: course_edit_name_field
                placeholderText: qsTr("Name")
                width: 300
            }
            TextField {
                id: course_edit_instructor_id_field
                placeholderText: qsTr("Teacher Id")
                width: 300
            }
            RoundButton {
                x: 120
                width: 70
                height: 50
                Material.background: '#740041'
                Text {
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("Edit")
                }
                onClicked: {
                    var course_id = course_edit_id_field.text
                    course_edit_id_field.text = ""
                    if (!course_id){
                        error_popup_text.text =  'ID can\'t  be empty';
                        error_popup.open();
                        return
                    }
                    course_id  = parseInt(course_id);

                    const payload = {};
                    var course_name = course_edit_name_field.text
                    course_edit_name_field.text = ""
                    if (course_name) {
                        payload["courseName"] = course_name
                    }
                    var course_instructor_id = course_edit_instructor_id_field.text
                    course_edit_instructor_id_field.text = ""
                    if (course_instructor_id) {
                        payload["teacherID"] = course_instructor_id
                    }
                    var response = admin_api.update_course(course_id,payload)
                    teacher_created_popup_text.text = "Course with id "+response + " successfully updated"
                    edit_course_popup.close()
                    teacher_created_popup.open()
                }
            }
        }
    }
    // Sidebar
    Row {
        anchors.fill: parent
        Pane {
            width: 300
            height: parent.height
            Material.elevation: 6
            Image {
                x: -10
                y: -120
                height: 300
                width: 300
                source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/logo.png"
            }
            Column {
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.centerIn: parent
                width: 300
                spacing: 4
                Repeater {
                    id: course_repeater
                    model: options
                    delegate: Button {
                        height: 60
                        width: 300
                        padding: 20
                        Text {
                            property int index
                            anchors.centerIn: parent
                            font.bold: true
                            font.pixelSize: 18
                            text: modelData
                        }
                        background: Rectangle {
                            color: '#fffbfe'
                        }
                        onClicked: {
                            currentIndex = index;
                        }
                    }
                }
            }
        }
        Loader {
            width: parent.width - 200
            height: parent.height
            sourceComponent: {
                switch (currentIndex) {
                case 0:
                    return teacherPage;
                case 1:
                    return studentPage;
                case 2:
                    return coursePage;
                case 3:
                    return reportPage
                }
            }
        }

        // teacher component
        Component {
            id: teacherPage
            Column {
            Row{
                    width: parent.width
                    y: -100
                    x: -20
                    Text{
                        anchors.centerIn: parent
                        text: qsTr("Admin Dashboard")
                        font.pixelSize:50
                        font.bold: true
                        color: '#740041'
                    }
                }
                y: 230
                spacing: 50
                // add and delete teacher buttons
                Row {
                    x: 480
                    spacing: 50
                    RoundButton {
                        x: 50
                        height: 120
                        width: 120
                        Material.background: "#ffffff"
                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
                        }
                        onClicked: {
                            add_teacher_popup.open();
                        }
                    }
                    RoundButton {
                        x: 70
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/delete.png"
                        }

                        onClicked: {
                            delete_teacher_popup.open();
                        }
                    }
                }
                // edit and view teacher buttons
                Row {
                    x: 480
                    spacing: 50
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/edit.png"
                        }

                        onClicked: {
                            edit_teacher_popup.open();
                        }
                    }
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/view.png"
                        }

                        onClicked: {
                            view_teacher_popup.open();
                        }
                    }
                }
            }
        }

        // student componenet
        Component {
            id: studentPage
            Column {
                x: 50
                y: 220
                spacing: 50
             Row{
                    width: parent.width
                    y: -100
                    x: -100
                    Text{
                        anchors.centerIn: parent
                        text: qsTr("Admin Dashboard")
                        font.pixelSize:50
                        font.bold: true
                        color: '#740041'
                    }
                }
                // add and delete and edit student buttons
                Row {
                    x: 340
                    spacing: 50
                    RoundButton {
                        x: 50
                        height: 120
                        width: 120
                        Material.background: "#ffffff"
                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
                        }
                        onClicked: {
                            add_student_popup.open();
                        }
                    }
                    RoundButton {
                        x: 70
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/delete.png"
                        }
                        onClicked: {
                            delete_student_popup.open();
                        }
                    }
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/edit.png"
                        }

                        onClicked: {
                            edit_student_popup.open();
                        }
                    }
                }
                // edit and courses student buttons
                Row {
                    x: 420
                    spacing: 50
                    
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/view.png"
                        }

                        onClicked: {
                            view_student_popup.open();
                        }
                    }
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"
                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/enroll_course.svg"
                        }
                        onClicked: {
                            enroll_course_popup.open();
                        }
                    }
                
                }
               
                 
                    
            }
        }

        // course component
        Component {
            id: coursePage
            Column {
                y: 300
                spacing: 50
                            Row{
                    width: parent.width
                    y: -100
                    x: -50
                    Text{
                        anchors.centerIn: parent
                        text: qsTr("Admin Dashboard")
                        font.pixelSize:50
                        font.bold: true
                        color: '#740041'
                    }
                }
                // add course buttons
                Row {
                    x: 380
                    spacing: 50
                    RoundButton {
                        x: 50
                        height: 120
                        width: 120
                        Material.background: "#ffffff"
                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/add.png"
                        }
                        onClicked: {
                            add_course_popup.open();
                        }
                    }
                // edit and view teacher buttons
                Row {
                    x: 480
                    spacing: 50
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/view.png"
                        }

                        onClicked: {
                            view_course_popup.open();
                        }
                    }
                    RoundButton {
                        x: 90
                        width: 120
                        height: 120
                        Material.background: "#ffffff"

                        Image {
                            anchors.centerIn: parent
                            source: "https://xvvcduvfikwcadbbwivi.supabase.co/storage/v1/object/public/assets/edit.png"
                        }

                        onClicked: {
                            edit_course_popup.open();
                        }
                    }
                    
                }
            }
        }
        }
    }
}

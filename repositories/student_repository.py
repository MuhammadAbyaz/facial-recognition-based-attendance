from constants.tables import STUDENTS
from database.db import supabase
from image_capture import capture_images
from models.student import Student


def student_course(student_id, course_id):
    student_course_json = {"studentID": student_id, "courseID": course_id}
    data, _ = supabase.table("student_courses").insert(
        student_course_json
    ).execute()


def add_student(name, email, roll_number, course_ids: list):
    newStudent = Student(name, email, roll_number)
    data, _ = supabase.table(STUDENTS).insert(newStudent.json()).execute()
    capture_images(data[1][0]["id"])
    student_id = data[1][0]["id"]
    for id in course_ids:
        student_course(student_id, id)
    return data[1][0]["id"]


def remove_student(student_id):
    data, _ = supabase.table(STUDENTS).delete().eq(
        "id", student_id
    ).execute()

    return data[1][student_id - 1]["id"]


def update_student(student_id, **kwargs):
    old_student = get_by_id(student_id)
    student_json = old_student.json()
    student_json.update(kwargs)

    data, _ = (
        supabase.table(STUDENTS)
        .update(student_json)
        .eq("id", student_id)
        .execute()
    )
    return data[1][0]


def get_by_id(student_id):
    data, _ = supabase.table(STUDENTS).select("*").eq(
        "id", student_id
    ).execute()
    return Student.from_json(data[1][0])


def get_all_students():
    data, _ = supabase.table(STUDENTS).select('*').execute()
    return [Student.from_json(record) for record in data[1]]

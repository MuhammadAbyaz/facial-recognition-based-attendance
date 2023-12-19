from database.db import supabase
from image_capture import capture_images
from models.student import Student


def add_student(name, email, roll_number, courses):
    newStudent = Student(name, email, roll_number, courses)

    data, _ = supabase.table("se_students").insert(newStudent.json()).execute()

    capture_images(data[1][0]["id"])

    return data[1][0]["id"]


def remove_student(student_id):
    data, _ = supabase.table("se_students").delete().eq(
        "id", student_id
    ).execute()

    return data[1][student_id - 1]["id"]


def update_student(student_id, **kwargs):
    old_student = get_by_id(student_id)
    student_json = old_student.json()
    student_json.update(kwargs)

    data, _ = (
        supabase.table("se_students")
        .update(student_json)
        .eq("id", student_id)
        .execute()
    )
    return data


def get_by_id(student_id, **kwargs):
    data, _ = supabase.table("se_students").select("*").eq(
        "id", student_id).execute()
    return Student.from_json(data[1][0])

from constants.tables import TEACHERS
from database.db import supabase
from models.teacher import Teacher
from repositories.course_repository import update_course


def add_teacher(name, email, password, gender, course_id):
    newTeacher = Teacher(name, email, password, gender)
    data, _ = supabase.table(TEACHERS).insert(
        newTeacher.json()
    ).execute()
    update_course(course_id, teacherID=data[1][0]["id"])
    return data[1][0]["id"]


def remove_teacher(teacher_id):
    data, _ = supabase.table(TEACHERS).delete().eq(
        "id", teacher_id
    ).execute()
    return data[1][teacher_id-1]["id"]


def update_teacher(teacher_id, **kwargs):
    old_teacher = get_by_id(teacher_id)
    teacher_json = old_teacher.json()
    teacher_json.update(kwargs)
    data, _ = supabase.table(TEACHERS).update().eq(
        "id", teacher_id).execute()
    return data[1][0]


def get_by_id(teacher_id):
    data, _ = supabase.table(TEACHERS).select(
        "*").eq("id", teacher_id).execute()
    return Teacher.from_json(data[1][0])

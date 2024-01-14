from constants.tables import TEACHERS
from database.db import supabase
from models.teacher import Teacher
from repositories.course_repository import update_course


def add_teacher(name, email, password, gender, course_id):
    newTeacher = Teacher(name, email, password, gender)
    data, _ = supabase.table(TEACHERS).insert(newTeacher.json()).execute()
    update_course(course_id, teacherID=data[1][0]["id"])
    supabase.auth.sign_up({"email": email, "password": password})
    return data[1][0]["id"]


def remove_teacher(teacher_id):
    data, _ = supabase.table(TEACHERS).delete().eq("id", teacher_id).execute()
    return data[1][0]["id"]


def update_teacher(teacher_id, **kwargs):
    old_teacher = get_by_id(teacher_id)
    teacher_json = old_teacher.json()
    teacher_json.update(kwargs)
    response = supabase.table(TEACHERS).update(
        teacher_json).eq("id", teacher_id).execute()
    return response.data[0]["id"]


def get_by_id(teacher_id):
    data, _ = supabase.table(TEACHERS).select(
        "*").eq("id", teacher_id).execute()
    return Teacher.from_json(data[1][0])


def get_all_teachers():
    data, _ = supabase.table(TEACHERS).select("*").execute()
    return [Teacher.from_json(record) for record in data[1]]


def get_teacher_by_email(email: str):
    data, _ = supabase.table(TEACHERS).select(
        "*").eq("email", email).limit(1).execute()
    return Teacher.from_json(data[1][0])

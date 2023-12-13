from database.db import supabase
from exceptions.not_exist import NotExistException
from models.teacher import Teacher


def add_teacher(name, email, course, password):
    newTeacher = Teacher(name, email, course, password)
    data, _ = supabase.table("teachers").insert(newTeacher.json()).execute()
    return data[1][0]["id"]


def remove_teacher(teacher_id):
    data, _ = supabase.table('teachers').delete().eq(
        "id", teacher_id).execute()
    if not data[1]:
        raise NotExistException()
    return data[1][0]["id"]


def update_teacher():
    pass

from database.db import supabase
from models.teacher import Teacher


def add_teacher(name, email, password, courses, gender):
    newTeacher = Teacher(name, email, password, courses, gender)
    data, _ = supabase.table("teachers").insert(
        newTeacher.json()
    ).execute()
    return data[1][0]["id"]


def remove_teacher(teacher_id):
    data, _ = supabase.table("teachers").delete().eq(
        "id", teacher_id
    ).execute()
    return data[1][teacher_id-1]["id"]


def update_teacher(teacher_id, **kwargs):
    old_teacher = get_by_id(teacher_id)
    teacher_json = old_teacher.json()
    teacher_json.update(kwargs)
    data, _ = supabase.table("teachers").update().eq(
        "id", teacher_id).execute()
    return data


def get_by_id(teacher_id):
    data, _ = supabase.table("teachers").select(
        "*").eq("id", teacher_id).execute()
    return Teacher.from_json(data[1][0])

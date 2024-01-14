from constants.tables import COURSES
from database.db import supabase
from models.course import Course


def get_courses():
    data, _ = supabase.table(COURSES).select("*").execute()
    course_list = list()
    for record in data[1]:
        course_list.append(record)
    return course_list


def add_course(course_name):
    new_course = Course(course_name)
    data, _ = supabase.table(COURSES).insert(new_course.json()).execute()
    return data[1][0]["courseID"]


def get_course_by_id(course_id):
    response = supabase.table(COURSES).select(
        "*").eq("courseID", course_id).execute()
    return Course.from_json(response.data[0])


def get_course_id_by_name(course_name):
    response = supabase.table(COURSES).select(
        "*").eq("courseName", course_name).execute()
    return response.data[0]["courseID"]


def update_course(course_id, **kwargs):
    response = supabase.table(COURSES).select(
        "*").eq("courseID", course_id).execute()
    old_course = response.data[0]
    old_course.update(kwargs)
    data, _ = supabase.table(COURSES).update(
        old_course).eq("courseID", course_id).execute()
    return data[1][0]["courseID"]

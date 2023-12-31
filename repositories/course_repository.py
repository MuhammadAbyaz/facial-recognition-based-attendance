from constants.tables import COURSES
from database.db import supabase
from models.course import Course


def get_courses():
    data, _ = supabase.table(COURSES).select("*").execute()
    courses_list = list()
    for val in data[1]:
        course_dict = dict()
        for key in val.keys():
            if key == "courseID" or key == "courseName":
                course_dict[key] = val[key]
        courses_list.append(course_dict)
    return courses_list


def add_course(course_name):
    new_course = Course(course_name)
    data, _ = supabase.table(COURSES).insert(new_course.json()).execute()
    return data[1][0]["id"]


def remove_course(course_id):
    pass


def update_course(course_id, **kwargs):
    data, _ = supabase.table(COURSES).select(
        "*").eq("courseID", course_id).execute()
    old_course = data[1][0]
    old_course.update(kwargs)
    data, _ = supabase.table(COURSES).update(
        old_course).eq("courseID", course_id).execute()
    return data[1][0]

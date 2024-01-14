from constants.tables import ATTENDANCE
from database.db import supabase
from repositories.course_repository import get_course_by_id
from repositories.student_repository import get_by_id


def get_attendance(date: str, course_id: int):
    data, _ = supabase.table(ATTENDANCE).select(
        "*").eq("date", date).eq("courseID", course_id).execute()
    result = data[1].copy()
    for idx, record in enumerate(result):
        student = get_by_id(record["studentID"])
        course = get_course_by_id(record["courseID"])
        result[idx]["studentName"] = student.name
        result[idx]["courseName"] = course.course_name
    return result


def save_attendance(date, course_id, student_ids):
    data, _ = supabase.table(ATTENDANCE).insert([
        {
            "date": date,
            "courseID": course_id,
            "studentID": student_id
        }
        for student_id in student_ids
    ]).execute()
    return data[1]

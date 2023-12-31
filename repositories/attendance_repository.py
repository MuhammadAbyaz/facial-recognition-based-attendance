from constants.tables import ATTENDANCE
from database.db import supabase


def get_attendance(date: str, course_id: int):
    data, _ = supabase.table(ATTENDANCE).select(
        "*").eq("date", date).eq("courseID", course_id).execute()
    return data[1]


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

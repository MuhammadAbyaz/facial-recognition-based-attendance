from PySide6.QtCore import QObject, Slot

from constants.tables import COURSES
from database.db import supabase
from models.course import Course
from repositories.course_repository import get_course_id_by_name
from repositories.teacher_repository import get_teacher_by_email
from training import training_on_images


class TeacherDashboardBridge(QObject):
    @Slot(result=list)
    def courses_model(self):
        user_email = supabase.auth.get_user().user.email
        teacher = get_teacher_by_email(user_email)
        data, _ = supabase.table(COURSES).select(
            "courseName").eq("teacherID", teacher.id).execute()

        return [record["courseName"] for record in data[1]]

    @Slot(str, result=int)
    def get_course_id(self, course_name):
        return get_course_id_by_name(course_name)

    @Slot()
    def training_on_data(self):
        training_on_images()

from PySide6.QtCore import QObject, Slot

from constants.tables import COURSES
from database.db import supabase
from repositories.teacher_repository import get_teacher_by_email


class TeacherDashboardBridge(QObject):
    @Slot(result=list)
    def courses_model(self):
        user_email = supabase.auth.get_user().user.email
        teacher = get_teacher_by_email(user_email)
        data, _ = supabase.table(COURSES).select(
            "courseName").eq("teacherID", teacher.id).execute()

        return [record["courseName"] for record in data[1]]

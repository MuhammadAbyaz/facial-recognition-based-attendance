import json
from io import StringIO

import pandas as pd
from PySide6.QtCore import Property, QObject, Signal, Slot

import video
from models.attendance import Attendance
from repositories.attendance_repository import get_attendance


class AttendanceBridge(QObject):
    __attendance: list[Attendance] = []
    dataChanged = Signal()

    @Property("QVariantList", notify=dataChanged)
    def attendance(self):
        return self.__attendance

    @Slot(int, str)
    def fetch_attendance(self, course_id: int, date: str):
        self.__attendance = get_attendance(date, course_id)
        self.dataChanged.emit()

    @Slot(int)
    def mark_attendance(self, course_id):
        video.mark_attendance(course_id)

    @Slot(str, int)
    def to_excel(self, date, course_id):
        response = get_attendance(date, course_id)
        df = pd.read_json(StringIO(json.dumps(response)))
        df = df[["date", "studentName", "courseID"]]
        df = df.rename(
            columns={"date": "Date", "studentName": "Student", "courseName": "Course"})
        df.to_excel(f"{date}(attendance).xlsx", engine="xlsxwriter")

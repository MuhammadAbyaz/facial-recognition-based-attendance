import cv2
from PySide6.QtCore import Property, QObject, Signal, Slot

from models.attendance import Attendance
from repositories.attendance_repository import get_attendance


class AttendanceBridge(QObject):
    __attendance: list[Attendance] = []
    dataChanged = Signal()

    @Property('QVariantList', notify=dataChanged)
    def attendance(self):
        return self.__attendance

    @Slot(int, str)
    def fetch_attendance(self, course_id: int, date: str):
        self.__attendance = get_attendance(date, course_id)
        self.dataChanged.emit()

    @Slot()
    def mark_attendance(self):
        video_capture = cv2.VideoCapture(0)

        while True:
            _, frame = video_capture.read()

            cv2.imshow(
                "Frame", frame
            )
            if cv2.waitKey(1) & 0xFF == ord("q"):
                break

        video_capture.release()
        cv2.destroyAllWindows()

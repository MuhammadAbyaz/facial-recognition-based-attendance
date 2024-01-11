class Attendance:
    def __init__(self, date=None, studentID=None, courseID=None):
        self.id = None
        self.date = date
        self.studentID = studentID
        self.courseID = courseID

    def json(self):
        attendance_json = {
            "date": self.date,
            "studentID": self.studentID,
            "courseID": self.courseID,
        }
        if self.id is not None:
            attendance_json['id'] = self.id
        return attendance_json

    @staticmethod
    def from_json(attendance_json: dict):
        attendance = Attendance()
        attendance.id = attendance_json['id']
        attendance.date = attendance_json["date"]
        attendance.studentID = attendance_json["studentID"]
        attendance.courseID = attendance_json["courseID"]
        return attendance

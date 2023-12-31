class Course:
    def __init__(self, course_name, teacher_id=None):
        self.course_name = course_name
        self.teacher_id = teacher_id

    def json(self):
        return {"courseName": self.course_name, "teacherID": self.teacher_id}

    @staticmethod
    def from_json(course_json: dict):
        course_name = course_json["courseName"]
        teacher_id = course_json["teacherID"]
        old_course = Course(course_name, teacher_id)
        return old_course

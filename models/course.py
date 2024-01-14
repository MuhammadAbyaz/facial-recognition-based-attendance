class Course:
    def __init__(self, course_name=None, teacher_id=None):
        self.course_name = course_name
        self.teacher_id = teacher_id
        self.id = None

    def json(self):
        return {"courseName": self.course_name, "teacherID": self.teacher_id}

    @staticmethod
    def from_json(course_json: dict):
        course = Course()
        course.course_name = course_json["courseName"]
        course.teacher_id = course_json["teacherID"]
        course.id = course_json["courseID"]
        return course

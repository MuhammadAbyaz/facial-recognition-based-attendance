class Student():
    def __init__(self, name=None, email=None, roll_number=None, courses=None):
        self.name = name
        self.email = email
        self.roll_number = roll_number
        self.courses = courses

    def json(self):
        return {
            "name": self.name,
            "email": self.email,
            "roll_number": self.roll_number,
            "courses": list(self.courses)
        }

    @staticmethod
    def from_json(student_json: dict):
        old_student = Student()
        old_student.name = student_json["name"]
        old_student.email = student_json["email"]
        old_student.roll_number = student_json["roll_number"]
        old_student.courses = student_json["courses"]
        return old_student

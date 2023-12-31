class Student():
    def __init__(self, name=None, email=None, roll_number=None):
        self.name = name
        self.email = email
        self.roll_number = roll_number
        self.id = None

    def json(self):
        student_json = {
            "name": self.name,
            "email": self.email,
            "roll_number": self.roll_number,
        }
        if self.id is not None:
            student_json['id'] = self.id
        return student_json

    @staticmethod
    def from_json(student_json: dict):
        student = Student()
        student.id = student_json['id']
        student.name = student_json["name"]
        student.email = student_json["email"]
        student.roll_number = student_json["roll_number"]
        return student

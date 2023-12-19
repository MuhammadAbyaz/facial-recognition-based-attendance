class Teacher():
    def __init__(self, name=None, email=None, password=None, courses=None, gender=None) -> None:
        self.name = name
        self.email = email
        self.password = password
        self.courses = courses
        self.gender = gender

    def json(self):
        return {
            "name": self.name,
            "email": self.email,
            "password": self.password,
            "courses": list(self.courses),
            "gender": self.gender
        }

    @staticmethod
    def from_json(teacher_json):
        old_teacher = Teacher()
        old_teacher.name = teacher_json["name"]
        old_teacher.email = teacher_json["email"]
        old_teacher.password = teacher_json["password"]
        old_teacher.courses = teacher_json["courses"]
        old_teacher.gender = teacher_json["gender"]
        return old_teacher

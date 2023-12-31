class Teacher():
    def __init__(self, name, email, password, gender):
        self.name = name
        self.email = email
        self.password = password
        self.gender = gender
        self.id = None

    def json(self):
        teacher_json = {
            "name": self.name,
            "email": self.email,
            "password": self.password,
            "gender": self.gender
        }
        if self.id is not None:
            teacher_json["id"] = self.id
        return teacher_json

    @staticmethod
    def from_json(teacher_json):
        teacher = Teacher()
        teacher.id = teacher_json["id"]
        teacher.name = teacher_json["name"]
        teacher.email = teacher_json["email"]
        teacher.password = teacher_json["password"]
        teacher.gender = teacher_json["gender"]
        return teacher

class Teacher():
    def __init__(self, name, email, course, password) -> None:
        self.name = name
        self.email = email
        self.course = course
        self.password = password

    def json(self):
        return {
            "name": self.name,
            "email": self.email,
            "course": self.course,
            "password": self.password
        }

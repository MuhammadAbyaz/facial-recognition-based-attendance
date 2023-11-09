class Student():
    def __init__(self, name, email, roll_number) -> None:
        self.name = name
        self.email = email
        self.roll_number = roll_number

    def json(self):
        return {
            "name": self.name,
            "email": self.email,
            "roll_number": self.roll_number,
        }

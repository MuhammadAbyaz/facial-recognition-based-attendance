from db import supabase
from image_capture import capture_images
from models.student import Student


def add_student(name, email, roll_number):
    newStudent = Student(name, email, roll_number)
    data, _ = supabase.table("students").insert(newStudent.json()).execute()

    capture_images(data[1][0]["id"])
    return data[1][0]["id"]


def remove_student():
    pass


def update_student():
    pass

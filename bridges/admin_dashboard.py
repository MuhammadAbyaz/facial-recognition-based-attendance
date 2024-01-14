from PySide6.QtCore import QObject, Slot

from models.course import Course
from models.student import Student
from repositories import (course_repository, student_repository,
                          teacher_repository)


class AdminDashboardBridge(QObject):
    @Slot(str, str, str, str, int, result=int)
    def add_teacher(self, name, email, password, gender, course_id):
        return teacher_repository.add_teacher(name, email, password, gender, course_id)

    @Slot(int, result=int)
    def delete_teacher(self, teacher_id):
        return teacher_repository.remove_teacher(teacher_id)

    @Slot(int, result=dict)
    def get_teacher(self, teacher_id):
        teacher = teacher_repository.get_by_id(teacher_id)
        return teacher.json()

    @Slot(int, dict, result=int)
    def edit_teacher(self, teacher_id, update_payload):
        return teacher_repository.update_teacher(teacher_id, **update_payload)

    @Slot(str, str, str, result=int)
    def add_student(self, name, email, roll_number):
        return student_repository.add_student(name, email, roll_number)

    @Slot(int, result=dict)
    def view_student(self, student_id):
        return Student.json(student_repository.get_by_id(student_id))

    @Slot(int, result=int)
    def delete_student(self, student_id):
        return student_repository.remove_student(student_id)

    @Slot(int, dict, result=int)
    def edit_student(self, student_id, update_payload):
        return student_repository.update_student(student_id, **update_payload)

    @Slot(result=list)
    def get_courses(self):
        return course_repository.get_courses()

    @Slot(int, list, result=int)
    def enroll_in_course(self, student_id, course_ids):
        return student_repository.enroll_course(student_id, course_ids)

    @Slot(int, result=dict)
    def view_course(self, course_id):
        return Course.json(course_repository.get_course_by_id(course_id))

    @Slot(int, dict, result=int)
    def update_course(self, course_id, update_payload):
        return course_repository.update_course(course_id, **update_payload)

    @Slot(str, result=int)
    def add_course(self, course_name):
        return course_repository.add_course(course_name)

from datetime import datetime

import cv2

from face_prediction import predict_face
from mail import send_email
from repositories.attendance_repository import get_attendance, save_attendance
from repositories.student_repository import get_all_students
from training import training_on_images


def capture_video(course_id):
    training_on_images()
    students = get_all_students()
    if len(students) == 0:
        raise Exception("No Student Found")
    video_capture = cv2.VideoCapture(0)
    attendance = set()

    while True:
        _, frame = video_capture.read()

        labelled_frame, student = predict_face(frame, students)

        if student is not None:
            attendance.add(student.id)

        cv2.imshow(
            "Frame", labelled_frame if labelled_frame is not None else frame
        )
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break

    video_capture.release()
    cv2.destroyAllWindows()

    today = datetime.now().date().isoformat()
    marked_attendance = map(
        lambda record: record["studentID"], get_attendance(today, course_id))

    attendance_to_mark = filter(
        lambda record: record not in marked_attendance, attendance)

    absent_students = filter(
        lambda student: student.id not in attendance_to_mark, students
    )
    save_attendance(today, course_id, attendance_to_mark)
    send_email(absent_students)

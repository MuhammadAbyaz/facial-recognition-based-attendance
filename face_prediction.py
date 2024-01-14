import cv2
import numpy as np

from face_dectection import detect_face
from helpers import draw_rectangle, draw_text
from models.student import Student

face_recognizer = cv2.face.LBPHFaceRecognizer.create()


def predict_face(_image: np.ndarray, students: list[Student]):
    image = _image.copy()
    face, rect = detect_face(image)
    if face is not None and rect is not None:
        idx, confidence = face_recognizer.predict(face)
        label_text, student = 'Unknown', None
        if confidence < 80:
            student = students[idx-1]
            label_text = student.name
        draw_rectangle(image, rect)
        draw_text(image, label_text, rect[0], rect[1] - 5)

        return image, student
    return None, None

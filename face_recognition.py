import numpy as np
import cv2
from helpers import draw_text, draw_rectangle
from face_detetction import detect_face

face_recognizer = cv2.face.LBPHFaceRecognizer.create()

subjects = ["", "Abyaz", "Hasham"]


def predict_face(_image: np.ndarray):
    image = _image.copy()
    face, rect = detect_face(image)
    if face is not None and rect is not None:
        label, _ = face_recognizer.predict(face)
        label_text = subjects[label]
        draw_rectangle(image, rect)
        draw_text(image, label_text, rect[0], rect[1] - 5)

        return image
    return None

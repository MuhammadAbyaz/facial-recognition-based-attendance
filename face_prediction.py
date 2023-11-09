import cv2
import numpy as np

from face_dectection import detect_face
from helpers import draw_rectangle, draw_text

face_recognizer = cv2.face.LBPHFaceRecognizer.create()


def predict_face(_image: np.ndarray, label_array):
    image = _image.copy()
    face, rect = detect_face(image)
    if face is not None and rect is not None:
        label, confidence = face_recognizer.predict(face)
        if confidence < 80:
            label_text = label_array[label-1]
        else:
            label_text = "Unknown"
        draw_rectangle(image, rect)
        draw_text(image, label_text, rect[0], rect[1] - 5)

        return image
    return None

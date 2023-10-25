import numpy as np
import cv2
import os
from helpers import draw_text, draw_rectangle

subjects = ["", "Abyaz", "Hasham"]

labels = []
faces = []
face_recognizer = cv2.face.LBPHFaceRecognizer.create()


def detect_face(image):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    cascade_path = os.getcwd() + "/haarcascade_frontalface_default.xml"
    face_cascade = cv2.CascadeClassifier(cascade_path)
    detected_faces = face_cascade.detectMultiScale(gray, scaleFactor=1.05,
                                                   minNeighbors=12, minSize=(30, 30),
                                                   flags=cv2.CASCADE_SCALE_IMAGE)
    if len(detected_faces) == 0:
        return None, None

    (x, y, w, h) = detected_faces[0]
    return gray[y:y + w, x:x + h], detected_faces[0]


def training():
    training_data_path = os.listdir(os.getcwd() + "/training")

    for directories in training_data_path:
        label = int(directories[-1])

        student_image_path = "training/" + directories
        student_image_directories = os.listdir(student_image_path)
        for student_image in student_image_directories:
            image_path = student_image_path + "/" + student_image
            image = cv2.imread(image_path)

            print("[INFO] performing training...")
            face, _ = detect_face(image)

            if face is not None:
                faces.append(face)
                labels.append(label)

    face_recognizer.train(faces, np.array(labels))


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

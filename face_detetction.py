import cv2
import os


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

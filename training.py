import cv2
import numpy as np
import requests
from db import bucket_name, supabase

from face_dectection import detect_face
from face_prediction import face_recognizer
from logger import Logger


def decode_image_from_url(url):
    response = requests.get(url)
    numpy_array = np.asarray(bytearray(response.content), dtype=np.uint8)
    image = cv2.imdecode(numpy_array, cv2.IMREAD_COLOR)
    return image


def get_images_url():
    url_list: list[str] = []
    training_bucket = supabase.storage.from_(bucket_name)

    folders = list(map(lambda folder: folder['name'], training_bucket.list()))
    for folder in folders:
        for value in training_bucket.list(folder):
            filename = value['name']
            if ".emptyFolderPlaceholder" == filename:
                continue
            file_path = f"{folder}/{filename}"
            url_list.append(training_bucket.get_public_url(file_path))
    return url_list


def training_on_images():
    labels = []
    faces = []
    image_urls = get_images_url()
    for image_url in image_urls:
        label = int(image_url.split("/")[-2])
        image = decode_image_from_url(image_url)

        Logger.info("performing training")
        face, _ = detect_face(image)

        if face is not None:
            faces.append(face)
            labels.append(label)
    face_recognizer.train(faces, np.array(labels))

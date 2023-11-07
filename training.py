import numpy as np
from face_recognition import face_recognizer
import requests
import cv2
from face_detetction import detect_face
from db import supabase


def decode_image_from_url(url):
    response = requests.get(url)
    numpy_array = np.asarray(bytearray(response.content), dtype=np.uint8)
    image = cv2.imdecode(numpy_array, cv2.IMREAD_COLOR)
    return image


def get_images_url():
    url_list = []
    bucket_name = "training"
    folders = [folder["name"]
               for folder in supabase.storage.from_(bucket_name).list()]
    for folder in folders:
        for value in supabase.storage.from_(bucket_name).list(folder):
            if value["name"] == ".emptyFolderPlaceholder":
                value.pop("name")
            else:
                url_list.append(supabase.storage.from_(
                    bucket_name).get_public_url(folder + "/" + value["name"]))
    return url_list


def image_training():
    labels = []
    faces = []
    image_urls = get_images_url()
    for image_url in image_urls:
        label = int(image_url.split("/")[-2][-1])
        image = decode_image_from_url(image_url)

        print("[INFO] performing training...")
        face, _ = detect_face(image)

        if face is not None:
            faces.append(face)
            labels.append(label)
    face_recognizer.train(faces, np.array(labels))

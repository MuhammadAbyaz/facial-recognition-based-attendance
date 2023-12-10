import os

import cv2

from db import bucket_name, supabase


def capture_images(id):
    x = 570
    y = 45
    font = cv2.FONT_HERSHEY_PLAIN
    font_scale = 3.5
    text_color =(0, 0, 0)
    num = 1
    video = cv2.VideoCapture(0)
    while True:
        _, frame = video.read()
        cv2.putText(frame, str(num), (x, y), font, font_scale,text_color , 3)
        cv2.imshow("Image Capture", frame)
        if cv2.waitKey(1) & 0xFF == ord('n'):
            cv2.imwrite(f"{num}.jpg", frame)
            if num == 10:
                cv2.destroyAllWindows()
                break
            num += 1
    upload_images(id)



def upload_images(id):

    for i in range(1, 11):
        with open(f"{i}.jpg", "rb") as f:
            supabase.storage.from_(bucket_name).upload(
                f"{id}/{i}.jpg", f, {"content-type": "image/jpg"})
    for i in range(1, 11):
        os.remove(f"{i}.jpg")

import cv2

from db import supabase
from face_prediction import predict_face
from training import training_on_images


def capture_video():
    training_on_images()
    response = supabase.table("students").select("id", "name").execute()
    label_array = [res["name"] for res in response.data]
    video_capture = cv2.VideoCapture(0)
    while True:
        _, frame = video_capture.read()

        result = predict_face(frame, label_array)
        if result is not None:
            cv2.imshow("Frame", result)
        else:
            cv2.imshow("Frame", frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    video_capture.release()
    cv2.destroyAllWindows()



import cv2
from face_recognition import predict_face
from face_recognition import training


def video_capture():
    training()
    video_capture = cv2.VideoCapture(0)
    while True:
        _, frame = video_capture.read()

        result = predict_face(frame)
        if result is not None:
            cv2.imshow("Frame", result)
        else:
            cv2.imshow("Frame", frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    video_capture.release()
    cv2.destroyAllWindows()

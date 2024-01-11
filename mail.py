import smtplib
import ssl

from decouple import config


def send_email(absent_students: list):
    message = """
    Subject: Important Notice: Your Absence from Today's Classes

    I hope this message finds you well. We noticed that you were absent from your class today, and we wanted to bring it to your attention.

    We understand that unexpected circumstances can sometimes interfere with your ability to attend classes. If there's any reason for your absence today, we encourage you to communicate with your professor or academic advisor at your earliest convenience. They are here to assist you and can provide guidance on any steps you might need to take to catch up on the material or make up for missed assignments.

    Consistent attendance is crucial for staying on track with your coursework and ensuring you get the most out of your educational experience. If there are any challenges you're facing, whether academic or personal, please don't hesitate to reach out for support. Our university offers various resources and services to help you navigate any difficulties you may encounter.

    Your commitment to attending classes contributes significantly to your overall academic success. If you have already resolved the issue that led to your absence today, we appreciate your prompt attention to this matter.

    Thank you for your cooperation and dedication to your education.
    """

    port = 465
    context = ssl.create_default_context()

    with smtplib.SMTP_SSL("smtp.gmail.com", port, context=context) as server:
        server.login(config('EMAIL'), config('PASSWORD'))
        for student in absent_students:
            server.sendmail(config('EMAIL'), student.email, message)

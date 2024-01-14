import sys
from os.path import abspath, dirname, join

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from bridges.admin_dashboard import AdminDashboardBridge
from bridges.attendance import AttendanceBridge
from bridges.login import LoginBridge
from bridges.teacher_dashboard import TeacherDashboardBridge

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Instance of the Python object
    login_bridge = LoginBridge()
    teacher_bridge = TeacherDashboardBridge()
    attendance_bridge = AttendanceBridge()
    admin_bridge = AdminDashboardBridge()

    # Expose the Python object to QML
    context = engine.rootContext()
    context.setContextProperty("login_api", login_bridge)
    context.setContextProperty("teacher_api", teacher_bridge)
    context.setContextProperty('attendance_api', attendance_bridge)
    context.setContextProperty('admin_api', admin_bridge)

    # Get the path of the current directory, and then add the name
    # of the QML file, to load it.
    qmlFile = join(dirname(__file__), 'ui', 'main.qml')
    engine.load(abspath(qmlFile))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())

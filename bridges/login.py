from gotrue.errors import AuthApiError
from gotrue.types import AuthResponse
from PySide6.QtCore import QObject, Slot

from database.db import supabase


class LoginBridge(QObject):
    __auth: AuthResponse = None

    @Slot(str, str, result=dict)
    def login(self, email: str, password: str):
        try:
            data = supabase.auth.sign_in_with_password({
                "email": email,
                "password": password
            })
            self.__auth = data
            return {"success": True, }
        except AuthApiError as e:
            return {"success": False, "error": e.message}

    @Slot(result=str)
    def get_username(self):
        return '' if self.__auth is None else self.__auth.user.email

    @Slot(result=str)
    def sign_out(self):
        supabase.auth.sign_out()
        return "Signing out"

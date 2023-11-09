class Logger:
    @staticmethod
    def info(message: str):
        print(f'[INFO] {message}')

    @staticmethod
    def debug(message: str):
        print(f'[DEBUG] {message}')

    @staticmethod
    def error(message: str):
        print(f'[ERROR] {message}')

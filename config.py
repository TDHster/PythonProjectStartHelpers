# config.py

import os
from dotenv import dotenv_values


class Config:
    def __init__(self, path=".env"):
        if os.path.isfile(path):
            self._values = dotenv_values(path)
        else:
            self._values = os.environ.copy()

    def __getattr__(self, name):
        try:
            return self._values[name]
        except KeyError:
            raise AttributeError(
                f"Config variable '{name}' not found. "
                "Check your .env file or environment variables."
            ) from None

    def get(self, name, default=None):
        return self._values.get(name, default)

    def __repr__(self):
        keys = ", ".join(self._values.keys())
        return f"<Config loaded: {keys}>"


config = Config()
#Example usage:
# from config import config
# print(config.LOG_LEVEL)  # beware intellisence hint not work, because names are dynamic
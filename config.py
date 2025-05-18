# config.py

from dotenv import dotenv_values


class _Config:
    def __init__(self, path=".env"):
        self._values = dotenv_values(path)

    def __getattr__(self, item):
        if item in self._values:
            return self._values[item]
        raise AttributeError(f"Not found '{item}' in config file.")

    def get(self, item, default=None):
        return self._values.get(item, default)

    def __repr__(self):
        return f"<Config {self._values}>"
    

config = _Config()

#Example usage:
# from config import config
# print(config.LOG_LEVEL)  # beware intellisence hint not work, because names are dynamic
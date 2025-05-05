# config.py

from dotenv import dotenv_values

class Config:
    _config = dotenv_values(".env")

    LOG_LEVEL = _config.get("LOG_LEVEL")
    if not LOG_LEVEL:
        raise ValueError("LOG_LEVEL not found in .env")

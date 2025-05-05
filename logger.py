import os
import logging
from config import Config

current_dir_name = os.path.basename(os.path.abspath(os.path.dirname(__file__)))
logger = logging.getLogger(current_dir_name)

logger = logging.getLogger("briefai")
logger.setLevel(Config.LOG_LEVEL)

if not logger.handlers:
    handler = logging.StreamHandler()
    formatter = logging.Formatter(
        "[%(asctime)s] [%(levelname)s] [%(name)s]: %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S"
    )
    handler.setFormatter(formatter)
    logger.addHandler(handler)

logger.propagate = False

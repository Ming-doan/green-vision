from ultralytics import YOLO
from .constants import YOLO_MODEL


yolo = YOLO(f'assets/{YOLO_MODEL}')  # load model once at start of app
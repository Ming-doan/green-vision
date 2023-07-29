from .yolo import yolo
from PIL import Image
from .utils import db


def predict_pil_image(image: Image):
    ...

def query_from_firebase(label: str) -> list:
    # ...

    return label
from .yolo import yolo
from PIL import Image
from torch import Tensor


def predict_pil_image(image: Image):
    # Predict image
    results = yolo.predict(image, 0.25)
    result_format = list(results)[0]

    # Get results
    boxs: Tensor = result_format.boxes.data
    labels = result_format.names

    # Get boxs result
    boxs_result = []
    for box in boxs:
        result_conf = box[4].item()
        if result_conf > 0.25:
            # Get the center point
            center_x = (box[0] + box[2] // 2).item()
            center_y = (box[1] + box[3] // 2).item()

            boxs_result.append({
                "pos": [int(center_x), int(center_y)],
                "name": labels[int(box[5].item())],
            })

    return boxs_result
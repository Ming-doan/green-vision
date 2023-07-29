from .utils import db, storage
from typing import Any
from .yolo import yolo
from PIL import Image
from torch import Tensor


def predict_pil_image(image: Image) -> list[dict[str, Any]]:
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


def query_from_firebase(label: str) -> list[dict[str, Any]]:
    trash_ref = db.collection("Trash")
    trash_docs = trash_ref.get()
    ans = []

    for trash_doc in trash_docs:
        trash_name = trash_doc.get("name")
        recycle_ids = trash_doc.get("recycleID")
        if trash_name == label:
            if recycle_ids != ['']:
                for recycle_id in recycle_ids:
                    # print(recycle_id)
                    recycleDoc_ref = db.collection(
                        "RecycleDoc").document(recycle_id)
                    recycleDoc_doc = recycleDoc_ref.get()

                    # print(recycleDoc_doc.get("content"))
                    paths = []
                    for path in recycleDoc_doc.get('path'):
                        if path != '':
                            print(path[len("gs://"):].split("/", 1))
                            bucket_name, object_path = path[len(
                                "gs://"):].split("/", 1)
                            bucket = storage.bucket(bucket_name)
                            blob = bucket.blob(object_path)
                            paths.append(blob.generate_signed_url(
                                expiration=3000000000))

                    temp = {
                        'content': recycleDoc_doc.get("content"),
                        'path': paths,
                        'title': recycleDoc_doc.get("title")
                    }

                    ans.append(temp)

    return ans

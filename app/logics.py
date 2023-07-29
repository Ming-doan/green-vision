from typing import Any
from .yolo import yolo
from PIL import Image
from .utils import db, storage


def predict_pil_image(image: Image):
    ...

def query_from_firebase(label: str) -> list[dict[str, Any]]:
    # ...
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
                    recycleDoc_ref = db.collection("RecycleDoc").document(recycle_id)
                    recycleDoc_doc = recycleDoc_ref.get()

                    # print(recycleDoc_doc.get("content"))
                    paths = []
                    for path in recycleDoc_doc.get('paths'):
                        if path != '':
                            print(path[len("gs://"):].split("/", 1))
                            bucket_name, object_path = path[len("gs://"):].split("/", 1)
                            bucket = storage.bucket(bucket_name)
                            blob = bucket.blob(object_path)
                            paths.append(blob.generate_signed_url(expiration=3000000000))

                    temp = {
                        'content': recycleDoc_doc.get("content"),
                        'paths': paths,
                        'title': recycleDoc_doc.get("title")
                    }                    
            
                    ans.append(temp)
            
    return ans
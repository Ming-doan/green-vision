from flask import Flask
from flask_cors import CORS
from flask_socketio import SocketIO
from PIL import Image
from io import BytesIO
import base64
import firebase_admin
from firebase_admin import credentials, firestore, storage


# Socketio
io = SocketIO()


# Firebase initialize
cred = credentials.Certificate(
    "./app/credentials/green-vision-42477-firebase-adminsdk-flci8-8692175679.json")
firebase_admin.initialize_app(
    cred, {"storageBucket": "gs://green-vision-42477.appspot.com"})
# Firebase firestore
db = firestore.client()


# Create flask app
def create_app():
    app = Flask(__name__)

    # CORS
    CORS(app, resources={r'/*': {'origins': '*'}})

    # Socket io
    io.init_app(app, cors_allowed_origins="*")

    return app


# Base64 decode to PIL
def base64_to_pil(image_string):
    image_bytes = BytesIO(base64.b64decode(image_string))
    return Image.open(image_bytes)


def read_api_key(file_name: str):
    with open(file_name) as f:
        api_plain_text = f.read()
    return api_plain_text.split("=")[1].strip()

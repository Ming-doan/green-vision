from flask import Flask
from flask_cors import CORS
from PIL import Image
from io import BytesIO
import base64
import firebase_admin
from firebase_admin import credentials, firestore, storage
import os

# Firebase initialize
cred = {
    "type": "service_account",
    "project_id": "green-vision-42477",
    "private_key_id": os.environ.get("PRIVATE_KEY_ID"),
    "private_key": os.environ.get("PRIVATE_KEY").replace(r'\n', '\n'),
    "client_email": os.environ.get("CLIENT_EMAIL"),
    "client_id": os.environ.get("CLIENT_ID"),
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": os.environ.get("AUTH_PROVIDER_X509_CERT_URL"),
    "client_x509_cert_url": os.environ.get("CLIENT_PROVIDER_X509_CERT_URL"),
    "universe_domain": "googleapis.com"
}
# Create credential
cred = credentials.Certificate(cred)
firebase_admin.initialize_app(
    cred, {"storageBucket": "gs://green-vision-42477.appspot.com"})
# Firebase firestore
db = firestore.client()


# Create flask app
def create_app():
    app = Flask(__name__)

    # CORS
    CORS(app, resources={r'/*': {'origins': '*'}})

    return app


# Base64 decode to PIL
def base64_to_pil(image_string):
    image_bytes = BytesIO(base64.b64decode(image_string))
    return Image.open(image_bytes)


def read_api_key(file_name: str):
    with open(file_name) as f:
        api_plain_text = f.read()
    return api_plain_text.split("=")[1].strip()

from flask import Flask
from flask_cors import CORS
from flask_socketio import SocketIO
from PIL import Image
from io import BytesIO
import base64


# Socketio
io = SocketIO()


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
from flask import Blueprint
from .utils import io, base64_to_pil
from .logics import predict_pil_image
from flask import request, jsonify


# Blueprint for api routes
api_bp = Blueprint('api', __name__, url_prefix='/api')


# Routes
# {domain}/api/predict
@api_bp.route('/predict', methods=['POST'])
def predict():
    # Get data from request
    image_string = request.json['image']
    # Decode image
    image = base64_to_pil(image_string)
    # Predict image
    result = predict_pil_image(image)
    # Return result
    return "Predicted!"


# {domain}/api/recommend/:label_id
@api_bp.route('/recommend/<label_id>', methods=['GET'])
def recommend(label_id):
    return f"Recommended! {label_id}"
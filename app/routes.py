from flask import Blueprint
from .utils import io, base64_to_pil
from .logics import predict_pil_image, query_from_firebase, get_response
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
    image = base64_to_pil(image_string).rotate(270)
    # Predict image
    result = predict_pil_image(image)
    # Return result
    return jsonify({
        "original_size": image.size,
        "predicts": result
    })


# {domain}/api/recommend/:label_id
@api_bp.route('/recommend', methods=['POST'])
def recommend():
    # Get name of trash
    name = request.get_json()['name']
    # Query
    results = query_from_firebase(name)
    return jsonify({
        "recommends": results
    })


@api_bp.route('/message', methods=['POST'])
def generate_text():
    prompt = request.get_json()['prompt']

    response = get_response(prompt)
    return jsonify({
        'generated_text': response['choices'][0]['text'].replace('\n', '')
    })

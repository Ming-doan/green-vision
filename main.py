from app.utils import create_app
from app.routes import api_bp

app = create_app()


# Default route
@app.route('/')
def index():
    return 'Backend is running!'


# Register blueprint
app.register_blueprint(api_bp)


if __name__ == '__main__':
    app.run(host='172.16.255.206')

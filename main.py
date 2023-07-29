from app.utils import create_app, io
from app.routes import api_bp

app = create_app()


# Default route
@app.route('/')
def index():
    return 'Backend is running!'


# Register blueprint
app.register_blueprint(api_bp)


if __name__ == '__main__':
    io.run(app)

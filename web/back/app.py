from flask import Flask
from app.routes.buscar_routes import buscar_bp
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Registrando os blueprints das rotas
app.register_blueprint(buscar_bp)

@app.route("/ping", methods=["GET"])
def sla():
    """Endpoint simples para verificar se a API está funcionando"""
    return {"message": "pong"}

if __name__ == "__main__":
    app.run(debug=True)

from flask import Blueprint
from app.controllers.buscar_controller import BuscarController

# Criando um blueprint para as rotas de busca
buscar_bp = Blueprint("buscar", __name__)

# Rota para busca por coluna específica
@buscar_bp.route("/buscar/<coluna>/<termo>", methods=["GET"])
def buscar_coluna(coluna, termo):
    return BuscarController.buscar_por_coluna(coluna, termo)

# Rota para busca em todas as colunas
@buscar_bp.route("/buscar/<termo>", methods=["GET"])
def buscar_todas_colunas(termo):
    return BuscarController.buscar_em_todas_colunas(termo)

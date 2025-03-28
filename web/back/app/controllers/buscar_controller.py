from flask import jsonify
from app.services.buscar_service import BuscarService

class BuscarController:
    """Controlador responsável pelas requisições de busca"""

    @staticmethod
    def buscar_por_coluna(coluna, termo):
        """Busca operadoras em uma coluna específica"""
        if not termo:
            return jsonify({"erro": "O parâmetro 'termo' é obrigatório"}), 400

        resultados = BuscarService.buscar_operadoras(coluna, termo)

        if resultados:
            return jsonify(resultados)
        else:
            return jsonify({"mensagem": "Nenhum registro encontrado"}), 404

    @staticmethod
    def buscar_em_todas_colunas(termo):
        """Busca operadoras em todas as colunas"""
        if not termo:
            return jsonify({"erro": "O parâmetro 'termo' é obrigatório"}), 400

        resultados = BuscarService.buscar_operadoras(None, termo)

        if resultados:
            return jsonify(resultados)
        else:
            return jsonify({"mensagem": "Nenhum registro encontrado"}), 404

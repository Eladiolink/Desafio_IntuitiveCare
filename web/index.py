import pandas as pd
from flask import Flask, jsonify

# Carregando o CSV
df = pd.read_csv("Relatorio_cadop.csv", sep=";")

# Exibindo os nomes das colunas para diagnóstico
print("Nomes das colunas:", df.columns)

# Remover espaços extras nas colunas, se houver
df.columns = df.columns.str.strip()

# Definindo as colunas que podem ser buscadas
COLUNAS_BUSCA = [
    "Registro_ANS", "CNPJ", "Razao_Social", "Nome_Fantasia", "Modalidade", 
    "Logradouro", "Numero", "Complemento", "Bairro", "Cidade", "UF", "CEP", 
    "DDD", "Telefone", "Fax", "Endereco_eletronico", "Representante", 
    "Cargo_Representante", "Regiao_de_Comercializacao", "Data_Registro_ANS"
]

app = Flask(__name__)

@app.route("/ping", methods=["GET"])
def sla():
    """Endpoint simples para verificar se a API está funcionando"""
    return jsonify({"message": "pong"})


def buscar_operadoras(coluna=None, termo=None):
    """Busca o termo em uma coluna específica ou em todas as colunas se 'coluna' for vazio"""
    termo = termo.lower() if termo else ""
    
    resultados = []

    # Se a coluna for especificada, buscar apenas nessa coluna
    if coluna:
        if coluna not in COLUNAS_BUSCA:
            return []  # Se a coluna não existir, retorna uma lista vazia
        
        for _, row in df.iterrows():
            if pd.notna(row[coluna]) and termo in str(row[coluna]).lower():
                resultados.append(row.to_dict())

    else:
        # Se a coluna não for especificada, buscar em todas as colunas
        for _, row in df.iterrows():
            for coluna in COLUNAS_BUSCA:
                if pd.notna(row[coluna]) and termo in str(row[coluna]).lower():
                    resultados.append(row.to_dict())
                    break  # Não precisa continuar verificando as outras colunas

    return resultados


@app.route("/buscar/<coluna>/<termo>", methods=["GET"])
def buscar_coluna(termo, coluna):
    """
    Endpoint para buscar operadoras em uma coluna específica.
    Parâmetros:
    - coluna: Coluna onde realizar a busca.
    - termo: Termo a ser buscado.
    """
    if not termo:
        return jsonify({"erro": "O parâmetro 'termo' é obrigatório"}), 400

    # Busca nas operadoras pela coluna e termo fornecidos
    resultados = buscar_operadoras(coluna, termo)

    if resultados:
        return jsonify(resultados)
    else:
        return jsonify({"mensagem": "Nenhum registro encontrado"}), 404


@app.route("/buscar/<termo>", methods=["GET"])
def buscar_geral(termo):
    """
    Endpoint para buscar operadoras em todas as colunas.
    Parâmetro:
    - termo: Termo a ser buscado.
    """
    if not termo:
        return jsonify({"erro": "O parâmetro 'termo' é obrigatório"}), 400

    # Busca nas operadoras por todas as colunas
    resultados = buscar_operadoras(None, termo)

    if resultados:
        return jsonify(resultados)
    else:
        return jsonify({"mensagem": "Nenhum registro encontrado"}), 404


if __name__ == "__main__":
    app.run(debug=True)

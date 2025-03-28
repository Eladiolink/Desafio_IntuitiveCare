import pandas as pd

class OperadoraModel:
    """Classe que representa o modelo de dados das operadoras"""

    # Carrega os dados do CSV
    df = pd.read_csv("Relatorio_cadop.csv", sep=";")
    
    # Remove espaços extras nos nomes das colunas
    df.columns = df.columns.str.strip()

    # Define as colunas que podem ser pesquisadas
    COLUNAS_BUSCA = [
        "Registro_ANS", "CNPJ", "Razao_Social", "Nome_Fantasia", "Modalidade", 
        "Logradouro", "Numero", "Complemento", "Bairro", "Cidade", "UF", "CEP", 
        "DDD", "Telefone", "Fax", "Endereco_eletronico", "Representante", 
        "Cargo_Representante", "Regiao_de_Comercializacao", "Data_Registro_ANS"
    ]

    @classmethod
    def get_dataframe(cls):
        """Retorna o DataFrame carregado"""
        return cls.df

    @classmethod
    def get_colunas_busca(cls):
        """Retorna a lista de colunas pesquisáveis"""
        return cls.COLUNAS_BUSCA

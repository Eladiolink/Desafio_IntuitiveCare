from app.models.operadora_model import OperadoraModel
import pandas as pd

class BuscarService:
    """Serviço responsável pela lógica de busca"""

    @staticmethod
    def buscar_operadoras(coluna=None, termo=None):
        """Busca o termo em uma coluna específica ou em todas as colunas"""

        termo = termo.lower() if termo else ""
        df = OperadoraModel.get_dataframe()
        colunas_busca = OperadoraModel.get_colunas_busca()
        
        resultados = []

        # Se a coluna for especificada, buscar apenas nela
        if coluna:
            if coluna not in colunas_busca:
                return []  # Retorna lista vazia se a coluna não existir
            
            for _, row in df.iterrows():
                if pd.notna(row[coluna]) and termo in str(row[coluna]).lower():
                    resultados.append(row.to_dict())

        else:
            # Se não houver coluna, buscar em todas as colunas
            for _, row in df.iterrows():
                for coluna in colunas_busca:
                    if pd.notna(row[coluna]) and termo in str(row[coluna]).lower():
                        resultados.append(row.to_dict())
                        break  # Evita múltiplas adições da mesma linha

        return resultados

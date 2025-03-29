import pdfplumber
import pandas as pd
import os
import zipfile
import PyPDF2

def extrair_tabelas_range_paginas(file_path, pagina_inicial, pagina_final):
    tabelas_completas = []
    
    with pdfplumber.open(file_path) as pdf:
        for pagina_num in range(pagina_inicial, pagina_final + 1):
            page = pdf.pages[pagina_num]
            
            tabelas = page.extract_tables()
            
            if tabelas:
                for tabela in tabelas:
                    df = pd.DataFrame(tabela[1:], columns=tabela[0])
                    tabelas_completas.append(df)
    
    if tabelas_completas:
        df_final = pd.concat(tabelas_completas, ignore_index=True)
        pre_processamento(df_final)
        df_final.to_csv('assets/Rol de Procedimentos e Eventos em Saúde.csv', index=False)
        return df_final
    else:
        print("Nenhuma tabela encontrada.")
        return None

def pre_processamento(dataset):
    dataset['OD'] = dataset['OD'].replace({'OD': 'Seg. Odontológica'}) 
    dataset['AMB'] = dataset['AMB'].replace({'AMB': 'Seg. Ambulatorial'}) 
    #dataset.rename(columns={'OD': 'Seg. Odontológica', 'AMB': 'Seg. Ambulatorial'}, inplace=True)

def comprimir_anexos():
    folder_path = "assets/"

    with zipfile.ZipFile(f"{folder_path}Teste_Eládio_Leal_Alves.zip", 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                if file.lower().endswith('.csv'):
                    file_path = os.path.join(root, file)
                    zipf.write(file_path, os.path.relpath(file_path, folder_path))
    print("CSV comprimido em .zip!")

def transformacao_de_dados(file_path):
    if file_path == None:
        print("Caminho não informado!")
        return

    pagina_inicial = 0
    pagina_final = 0

    with open(file_path, 'rb') as file:
        reader = PyPDF2.PdfReader(file)
        pagina_final = len(reader.pages)-1

    df_tabelas = extrair_tabelas_range_paginas(file_path, pagina_inicial, pagina_final)
    print("Tabela em PDF convertido em CSV!")

    comprimir_anexos()
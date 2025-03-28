from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import urllib.request
import os
import zipfile

chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")

def obter_link_anexo(driver, anexo_texto):
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, f"//a[text()='{anexo_texto}']")))
    return driver.find_element(By.XPATH, f"//a[text()='{anexo_texto}']").get_attribute("href")

def downloads_anexos():
    driver = webdriver.Chrome(options=chrome_options)
    url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
    driver.get(url)

    try:
        # Obter links para os anexos
        anexo_I_link = obter_link_anexo(driver, "Anexo I.")
        anexo_II_link = obter_link_anexo(driver, "Anexo II.")
        
        print(f"Link do Anexo I: {anexo_I_link}")
        print(f"Link do Anexo II: {anexo_II_link}")

        # Caminhos para salvar os arquivos
        file_path_anexo_I = "assets/Anexo_I.pdf"
        file_path_anexo_II = "assets/Anexo_II.pdf"

        # Baixar os arquivos
        urllib.request.urlretrieve(anexo_I_link, file_path_anexo_I)
        urllib.request.urlretrieve(anexo_II_link, file_path_anexo_II)

        print("Downloads completos!")

    except Exception as e:
        print(f"Ocorreu um erro: {e}")
    finally:
        driver.quit()

def comprimir_anexos():
    folder_path = "assets/"

    with zipfile.ZipFile(f"{folder_path}Anexos O Rol de Procedimentos e Eventos em Saúde.zip", 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                if file.lower().endswith('.pdf'):
                    file_path = os.path.join(root, file)
                    zipf.write(file_path, os.path.relpath(file_path, folder_path))
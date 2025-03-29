# Teste IntuitiveCare

Este projeto contém scripts para criação de banco de dados, web scraping e transformação de dados, além de uma aplicação web para consulta de dados cadastrais das Operadoras Ativas na ANS.

## Estrutura do Projeto

### 1. Pasta `banco-dados`
Contém os arquivos SQL para criação da base de dados, população das tabelas e queries analíticas.
- **Querys_Analiticas.sql**: Contém queries para análise dos dados.
- **populate_tabelas.sql**: Script para inserção de dados nas tabelas.
- **BancoDeDados_Tabelas.sql**: Script para criação das tabelas do banco de dados.

### 2. Pasta `web-scraping_transformacao-dados`
Scripts em Python para:
- Download dos dados do "Rol de Procedimentos e Eventos em Saúde" (Anexo_I e Anexo_II).
- Transformação do Anexo_I para CSV.

#### Passos para executar:
1. Criar um ambiente virtual:
   ```sh
   python -m venv venv
   ```
2. Ativar o ambiente virtual:
   - No Windows:
     ```sh
     venv\Scripts\activate
     ```
   - No Linux/Mac:
     ```sh
     source venv/bin/activate
     ```
3. Instalar as dependências:
   ```sh
   pip install -r requirements.txt
   ```
4. Executar o download dos anexos e conversão do Anexo_I para CSV:
   ```sh
   python index.py
   ```

### 3. Pasta `web`
Projeto front-end e back-end para uma aplicação web de consulta de dados cadastrais das Operadoras Ativas na ANS.

#### Back-end:
1. Criar um ambiente virtual:
   ```sh
   python -m venv venv
   ```
2. Ativar o ambiente virtual:
   - No Windows:
     ```sh
     venv\Scripts\activate
     ```
   - No Linux/Mac:
     ```sh
     source venv/bin/activate
     ```
3. Instalar as dependências:
   ```sh
   pip install -r requirements.txt
   ```
4. Rodar a API:
   ```sh
   python app.py
   ```

#### Front-end:
1. Instalar as dependências:
   ```sh
   npm install
   ```
2. Rodar o servidor em modo de desenvolvimento:
   ```sh
   npm run dev
   ```


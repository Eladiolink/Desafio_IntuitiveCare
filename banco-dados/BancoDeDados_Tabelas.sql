CREATE DATABASE IF NOT EXISTS ANS;
USE ANS;

CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA DATE NOT NULL,
    REG_ANS INT(8) NOT NULL,
    CD_CONTA_CONTABIL INT(8) NOT NULL,
    DESCRICAO VARCHAR(150) NOT NULL,
    VL_SALDO_INICIAL DECIMAL(15,2) NOT NULL,
    VL_SALDO_FINAL DECIMAL(15,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS operadoras_de_plano_de_saude_ativas (
    REGISTRO_OPERADORA VARCHAR(6) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL,
    RAZAO_SOCIAL VARCHAR(140) NOT NULL,
    NOME_FANTASIA VARCHAR(140) NOT NULL,
    MODALIDADE VARCHAR(200) NOT NULL,
    LOGRADOURO VARCHAR(40) NOT NULL,
    NUMERO VARCHAR(20) NOT NULL,
    COMPLEMENTO VARCHAR(40),
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    DDD VARCHAR(4) NOT NULL,
    TELEFONE VARCHAR(20) NOT NULL,
    FAX VARCHAR(20),
    ENDERECO_ELETRONICO VARCHAR(255),
    REPRESENTANTE VARCHAR(50) NOT NULL,
    CARGO_RESPONSAVEL VARCHAR(40) NOT NULL,
    REGIAO_COMERCIALIZACAO TINYINT NOT NULL,
    DATA_REGISTRO_ANS DATE NOT NULL
);

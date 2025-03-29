/* Arquivo popular as tabelas com os CSV's

   Para não ferir a segurança do MySQL foi 
   mantido a váriavel "secure_file_priv" o 
   local onde os arquivos foram colocados é
   na pasta base de "secure_file_priv"

   obs: caso "secure_file_priv" não estiver localizado no diretorio:
       "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/"(Linux por exemplo)
       alterar o caminho durante o arquivo.
*/

TRUNCATE TABLE demonstracoes_contabeis;
TRUNCATE TABLE operadoras_de_plano_de_saude_ativas;

-- SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    




# 2024
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = CASE 
        WHEN @DATA REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA
        WHEN @DATA REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d/%m/%Y')
        WHEN @DATA REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA, '%d-%m-%Y')
        ELSE NULL 
    END,
	REG_ANS = NULLIF(TRIM(@REG_ANS), ''),
    CD_CONTA_CONTABIL = NULLIF(TRIM(@CD_CONTA_CONTABIL), ''),
	DESCRICAO = NULLIF(TRIM(@DESCRICAO), ''),
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE operadoras_de_plano_de_saude_ativas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@REGISTRO_OPERADORA, @CNPJ, @RAZAO_SOCIAL, @NOME_FANTASIA, @MODALIDADE, @LOGRADOURO, @NUMERO, 
 @COMPLEMENTO, @BAIRRO, @CIDADE, @UF, @CEP, @DDD, @TELEFONE, @FAX, @ENDERECO_ELETRONICO, 
 @REPRESENTANTE, @CARGO_RESPONSAVEL, @REGIAO_COMERCIALIZACAO, @DATA_REGISTRO_ANS)
SET 
    REGISTRO_OPERADORA = NULLIF(TRIM(@REGISTRO_OPERADORA), ''),
    CNPJ = NULLIF(TRIM(@CNPJ), ''),
    RAZAO_SOCIAL = NULLIF(TRIM(@RAZAO_SOCIAL), ''),
    NOME_FANTASIA = IFNULL(NULLIF(TRIM(@NOME_FANTASIA), ''), ''),
    MODALIDADE = NULLIF(TRIM(@MODALIDADE), ''),
    LOGRADOURO = NULLIF(TRIM(@LOGRADOURO), ''),
    NUMERO = NULLIF(TRIM(@NUMERO), ''),
    COMPLEMENTO = NULLIF(TRIM(@COMPLEMENTO), ''),
    BAIRRO = NULLIF(TRIM(@BAIRRO), ''),
    CIDADE = NULLIF(TRIM(@CIDADE), ''),
    UF = NULLIF(TRIM(@UF), ''),
    CEP = NULLIF(TRIM(@CEP), ''),
    DDD = IFNULL(NULLIF(TRIM(@DDD), ''), ''),
    TELEFONE = IFNULL(NULLIF(TRIM(@TELEFONE), ''), ''),
    FAX = NULLIF(TRIM(@FAX), ''),
    ENDERECO_ELETRONICO = NULLIF(TRIM(@ENDERECO_ELETRONICO), ''),
    REPRESENTANTE = NULLIF(TRIM(@REPRESENTANTE), ''),
    CARGO_RESPONSAVEL = NULLIF(TRIM(@CARGO_RESPONSAVEL), ''),
    REGIAO_COMERCIALIZACAO = IFNULL(NULLIF(TRIM(@REGIAO_COMERCIALIZACAO), ''), 0),
    DATA_REGISTRO_ANS = CASE 
        WHEN @DATA_REGISTRO_ANS REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN @DATA_REGISTRO_ANS
        WHEN @DATA_REGISTRO_ANS REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@DATA_REGISTRO_ANS, '%d/%m/%Y')
        WHEN @DATA_REGISTRO_ANS REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(@DATA_REGISTRO_ANS, '%d-%m-%Y')
        ELSE NULL 
    END;
    
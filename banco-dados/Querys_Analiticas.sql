SELECT 
    o.NOME_FANTASIA,
    SUM(d.VL_SALDO_FINAL - d.VL_SALDO_INICIAL) AS TOTAL_DESPESA
FROM demonstracoes_contabeis d
JOIN operadoras_de_plano_de_saude_ativas o ON d.REG_ANS = o.REGISTRO_OPERADORA
WHERE d.DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
AND d.DATA >= DATE_SUB('2024-12-31', INTERVAL 3 MONTH)
GROUP BY o.NOME_FANTASIA
ORDER BY TOTAL_DESPESA DESC
LIMIT 10;

SELECT 
    o.NOME_FANTASIA,
    SUM(d.VL_SALDO_FINAL - d.VL_SALDO_INICIAL) AS TOTAL_DESPESA
FROM demonstracoes_contabeis d
JOIN operadoras_de_plano_de_saude_ativas o ON d.REG_ANS = o.REGISTRO_OPERADORA
WHERE d.DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
AND YEAR(d.DATA) = 2024
GROUP BY o.NOME_FANTASIA
ORDER BY TOTAL_DESPESA DESC
LIMIT 10;
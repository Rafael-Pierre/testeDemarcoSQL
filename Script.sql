-- Estes Scripts SQL foram feitos com base na utilização de um SGDB Postgre


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Questão A) Estrutura da tabela, que melhor represente a definição de dados exibida;
CREATE TABLE aluguel (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    mes_ano CHAR(5) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    produto VARCHAR(50) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);


-- Questão B) Valor Total de produtos alugados por pessoa, que não inclua os produtos Carro e Raquete como resultado;
SELECT 
    nome,
    SUM(valor) AS valor_total
FROM aluguel a 
WHERE 
    a.produto NOT IN ('Carro', 'Raquete')
GROUP BY 
    nome;
   
   
-- Questão C) Liste as cores distintas dos produtos que foram alugados após o mês de Julho/22
SELECT DISTINCT cor
FROM produtos
WHERE to_date(mes_ano, 'MM-YY') > to_date('07-22', 'MM-YY');
   

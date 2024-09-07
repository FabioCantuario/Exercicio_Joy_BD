-- Exclusão das Tabelas
DROP PROCEDURE relatorio_quantidade_produtos_por_dia;
DROP TABLE compra;
DROP TABLE produto;


-- Criação das Tabelas
CREATE TABLE produto (
    idProduto SERIAL PRIMARY KEY,
    nomeProduto VARCHAR(255) NOT NULL,
    quantidadeProduto INT NOT NULL,
    precoProduto DECIMAL(10, 2) NOT NULL
);

CREATE TABLE compra (
    idCompra SERIAL PRIMARY KEY,
    fkIdProduto INT NOT NULL,
    dataDeCompra DATE NOT NULL,
    FOREIGN KEY (fkIdProduto) REFERENCES produto(idProduto)
);

-- Populando Dados
INSERT INTO produto (nomeProduto, quantidadeProduto, precoProduto) VALUES
('Produto A', 10, 15.50),
('Produto B', 20, 25.75),
('Produto C', 15, 30.00),
('Produto D', 5, 50.25),
('Produto E', 8, 12.10),
('Produto F', 12, 22.60),
('Produto G', 30, 45.00),
('Produto H', 7, 35.75),
('Produto H', 23, 35.75),
('Produto I', 25, 10.99),
('Produto J', 18, 55.40),
('Produto K', 22, 18.20),
('Produto L', 17, 48.90),
('Produto M', 14, 29.50),
('Produto N', 11, 40.00),
('Produto O', 9, 21.75),
('Produto P', 13, 60.00),
('Produto Q', 16, 34.90),
('Produto R', 21, 13.80),
('Produto S', 6, 26.30),
('Produto T', 19, 44.60),
('Produto U', 23, 19.99);

INSERT INTO compra (fkIdProduto, dataDeCompra) VALUES
(1, '2024-01-15'),
(2, '2024-02-20'),
(3, '2024-03-10'),
(4, '2024-04-05'),
(5, '2024-05-25'),
(6, '2024-06-30'),
(7, '2024-07-15'),
(8, '2024-08-10'),
(9, '2024-08-10'),
(10, '2024-09-20'),
(11, '2024-10-05'),
(12, '2024-11-25'),
(13, '2024-12-10'),
(14, '2024-01-25'),
(15, '2024-02-15'),
(16, '2024-03-30'),
(18, '2024-04-20'),
(19, '2024-05-10'),
(19, '2024-06-15'),
(19, '2024-07-05'),
(20, '2024-08-25');

-- Consulta Simples
SELECT * FROM produto;
SELECT * FROM compra;

-- Consulta com Inner
select count(*), sum(quantidadeproduto) from compra
inner join produto
on fkidproduto = produto.idproduto
where datadecompra = '2024-08-10';

-- Criação de Relatorio
-- Cria uma tabela temporária para armazenar os resultados
CREATE TEMP TABLE temp_relatorio_quantidade_produtos_por_dia (
    data_de_compra DATE,
    quantidade_total INT
) ON COMMIT DELETE ROWS;  -- Opção para limpar a tabela ao final da transação

-- Cria a procedure
CREATE OR REPLACE PROCEDURE relatorio_quantidade_produtos_por_dia()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Limpa a tabela temporária antes de inserir novos dados
    TRUNCATE temp_relatorio_quantidade_produtos_por_dia;

    -- Insere os resultados na tabela temporária
    INSERT INTO temp_relatorio_quantidade_produtos_por_dia (data_de_compra, quantidade_total)
    SELECT
        c.dataDeCompra AS data_de_compra,
        SUM(p.quantidadeProduto) AS quantidade_total
    FROM
        compra c
    JOIN
        produto p ON c.fkIdProduto = p.idProduto
    GROUP BY
        c.dataDeCompra
    ORDER BY
        c.dataDeCompra;
END;
$$;

-- Executa a procedure
CALL relatorio_quantidade_produtos_por_dia();

-- Consulta a tabela temporária para ver os resultados
SELECT * FROM temp_relatorio_quantidade_produtos_por_dia;

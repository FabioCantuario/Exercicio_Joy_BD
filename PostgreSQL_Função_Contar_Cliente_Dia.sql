-- Exclusão das Tabelas
DROP FUNCTION contar_clientes_por_data;
DROP TABLE venda;
DROP TABLE produto;
DROP TABLE cliente;


-- Criação das Tabelas

-- Criação da tabela cliente
CREATE TABLE cliente (
    idCliente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    dataCadastro DATE  -- Adiciona uma coluna para armazenar a data de cadastro
);

-- Criação da tabela produto
CREATE TABLE produto (
    idProduto SERIAL PRIMARY KEY,
    descricaoProduto VARCHAR(255),
    valorUnProduto NUMERIC(10, 2),
    quantidadeProduto INTEGER
);

-- Criação da tabela venda
CREATE TABLE venda (
    idVenda SERIAL PRIMARY KEY,
    dataVenda DATE,
    fkIdCliente INTEGER REFERENCES cliente(idCliente),
    fkIdProduto INTEGER REFERENCES produto(idProduto),
    valorTotalVenda NUMERIC(10, 2)
);

-- Populando Tabelas
INSERT INTO cliente (nome, sobrenome, cpf, telefone, email, dataCadastro) VALUES
('Ana', 'Silva', '123.456.789-00', '(11) 99999-0000', 'ana.silva@example.com', '2024-09-01'),
('Bruno', 'Costa', '234.567.890-11', '(11) 98888-1111', 'bruno.costa@example.com', '2024-09-01'),
('Carla', 'Lima', '345.678.901-22', '(11) 97777-2222', 'carla.lima@example.com', '2024-09-02'),
('Daniel', 'Oliveira', '456.789.012-33', '(11) 96666-3333', 'daniel.oliveira@example.com', '2024-09-02'),
('Eduarda', 'Pereira', '567.890.123-44', '(11) 95555-4444', 'eduarda.pereira@example.com', '2024-09-03'),
('Felipe', 'Mendes', '678.901.234-55', '(11) 94444-5555', 'felipe.mendes@example.com', '2024-09-03'),
('Gabriela', 'Souza', '789.012.345-66', '(11) 93333-6666', 'gabriela.souza@example.com', '2024-09-04'),
('Hugo', 'Nunes', '890.123.456-77', '(11) 92222-7777', 'hugo.nunes@example.com', '2024-09-04'),
('Isabela', 'Barros', '901.234.567-88', '(11) 91111-8888', 'isabela.barros@example.com', '2024-09-05'),
('João', 'Freitas', '012.345.678-99', '(11) 90000-9999', 'joao.freitas@example.com', '2024-09-05'),
('Karina', 'Rodrigues', '123.456.789-01', '(21) 99999-0000', 'karina.rodrigues@example.com', '2024-09-06'),
('Lucas', 'Gomes', '234.567.890-12', '(21) 98888-1111', 'lucas.gomes@example.com', '2024-09-06'),
('Mariana', 'Alves', '345.678.901-23', '(21) 97777-2222', 'mariana.alves@example.com', '2024-09-07'),
('Nathan', 'Martins', '456.789.012-34', '(21) 96666-3333', 'nathan.martins@example.com', '2024-09-07'),
('Olga', 'Santos', '567.890.123-45', '(21) 95555-4444', 'olga.santos@example.com', '2024-09-08'),
('Pedro', 'Araujo', '678.901.234-56', '(21) 94444-5555', 'pedro.araujo@example.com', '2024-09-08'),
('Quésia', 'Silveira', '789.012.345-67', '(21) 93333-6666', 'quesia.silveira@example.com', '2024-09-09'),
('Rafael', 'Santos', '890.123.456-78', '(21) 92222-7777', 'rafael.santos@example.com', '2024-09-09'),
('Sofia', 'Pinto', '901.234.567-89', '(21) 91111-8888', 'sofia.pinto@example.com', '2024-09-10'),
('Tiago', 'Nascimento', '012.345.678-90', '(21) 90000-9999', 'tiago.nascimento@example.com', '2024-09-10');

INSERT INTO produto (descricaoProduto, valorUnProduto, quantidadeProduto) VALUES
('Produto A', 10.00, 100),
('Produto B', 20.00, 50),
('Produto C', 30.00, 200),
('Produto D', 40.00, 150),
('Produto E', 50.00, 75),
('Produto F', 60.00, 90),
('Produto G', 70.00, 110),
('Produto H', 80.00, 60),
('Produto I', 90.00, 80),
('Produto J', 100.00, 40),
('Produto K', 15.00, 95),
('Produto L', 25.00, 85),
('Produto M', 35.00, 120),
('Produto N', 45.00, 65),
('Produto O', 55.00, 55),
('Produto P', 65.00, 95),
('Produto Q', 75.00, 105),
('Produto R', 85.00, 45),
('Produto S', 95.00, 25),
('Produto T', 105.00, 30),
('Produto U', 115.00, 50);

INSERT INTO venda (dataVenda, fkIdCliente, fkIdProduto, valorTotalVenda) VALUES
('2024-09-01', 1, 1, 10.00),
('2024-09-01', 2, 2, 20.00),
('2024-09-02', 3, 3, 30.00),
('2024-09-02', 4, 4, 40.00),
('2024-09-03', 5, 5, 50.00),
('2024-09-03', 6, 6, 60.00),
('2024-09-04', 7, 7, 70.00),
('2024-09-04', 8, 8, 80.00),
('2024-09-05', 9, 9, 90.00),
('2024-09-05', 10, 10, 100.00),
('2024-09-06', 11, 11, 15.00),
('2024-09-06', 12, 12, 25.00),
('2024-09-07', 13, 13, 35.00),
('2024-09-07', 14, 14, 45.00),
('2024-09-08', 15, 15, 55.00),
('2024-09-08', 16, 16, 65.00),
('2024-09-09', 17, 17, 75.00),
('2024-09-09', 18, 18, 85.00),
('2024-09-10', 19, 19, 95.00),
('2024-09-10', 20, 20, 105.00);

-- Consulta simples
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM venda;

-- Criar Função
CREATE OR REPLACE FUNCTION contar_clientes_por_data(p_data DATE)
RETURNS INTEGER AS $$
DECLARE
    v_contagem INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_contagem
    FROM cliente
    WHERE dataCadastro = p_data;

    RETURN v_contagem;
END;
$$ LANGUAGE plpgsql;

-- Usar Função
SELECT contar_clientes_por_data('2024-09-08');

-- Confirmar Função
SELECT * from cliente
WHERE datacadastro = '2024-09-08';

-- Exclusão das Tabelas
DROP TABLE livroemprestimo;
DROP TABLE livro;
DROP TABLE sessao;
DROP TABLE emprestimo;
DROP TABLE aluno;

-- Criação das Tabelas
create table aluno (
  idAluno serial PRIMARY KEY NOT NULL,
  nomeAluno VARCHAR(15) NOT NULL,
  sobrenomeAluno VARCHAR(15) not NULL,
  matriculaAluno int UNIQUE NOT NULL,
  emailAluno VARCHAR(40) UNIQUE NOT NULL,
  telefoneAluno VARCHAR(15) UNIQUE not NULL
);

create table emprestimo (
  codigoEmprestimo serial PRIMARY KEY NOT NULL,
  dataHoraEmp TIMESTAMP NOT NULL,
  dataDevolucao DATE NOT NULL,
  fkIdAluno INT not NULL,
  CONSTRAINT fkAluno FOREIGN KEY (fkIdAluno) REFERENCES aluno(idAluno)
);

create table sessao (
  codigoSessao serial PRIMARY KEY NOT NULL,
  descricaoSessao VARCHAR(30) NOT NULL,
  localizacaoSessao VARCHAR(30)
);

create table livro (
  codigolivro serial PRIMARY KEY NOT NULL,
  tituloLivro VARCHAR(50) NOT NULL,
  autorLivro VARCHAR(30),
  fkIdSessao INT,
  CONSTRAINT fkSessao FOREIGN KEY (fkIdSessao) REFERENCES sessao(codigoSessao)
);

create table livroemprestimo (
  fkCodigoLivro int NOT NULL,
  fkCodigoEmprestimo int NOT NULL,
  CONSTRAINT pkLivroEmprestimo primary key(fkCodigoLivro,fkCodigoEmprestimo),
  CONSTRAINT fkCodigoLivro FOREIGN KEY (fkCodigoLivro) REFERENCES livro(codigolivro),
  CONSTRAINT fkCodigoEmprestimo FOREIGN KEY (fkCodigoEmprestimo) REFERENCES emprestimo(codigoEmprestimo)
);

-- Populando as Tabelas

INSERT into aluno (nomeAluno,sobrenomeAluno,matriculaAluno,emailAluno,telefoneAluno) VALUES
    ('Daniela', 'Amorim',1234 , 'daniela_amorim@gmail.com','(11) 98221-9132'),
    ('Veronica', 'Martins',4896 , 'ver.martins@yahoo.com','(11) 97234-9633'),
    ('Tamara', 'Costa',2345 , 'costa.tamara@gmail.com','(11) 98248-9634'),
    ('Geovana', 'Ricci',2548 , 'geovana.ricci@gmail.com','(11) 98242-9235'),
    ('Ariadny', 'Ricci',1452 , 'ricci.ariadny@gmail.com','(11) 97521-9636'), 
    ('Mariana', 'Brito',0236 , 'mariana.brito@uol.com','(11) 98698-9337'), 
    ('Thiago', 'Alves',8965 , 'thiago.alves@gmail.com','(11) 97657-9638'), 
    ('Juliana', 'Mendes',6472 , 'juliana_mendes@gmail.com','(11) 98637-9439'),
    ('Bernardo', 'Pereira',5874 , 'bernardopereira@gmail.com','(11) 99723-9640'),
    ('Angelica', 'Oliveira',3541 , 'oliveira.angel@gmail.com','(11) 98759-9541');

INSERT into emprestimo (dataHoraEmp,dataDevolucao,fkIdAluno) VALUES
    ('2022/01/05 16:00:00','2022/01/10', 6),
    ('2022/02/20 08:30:00','2022/02/23', 1),
    ('2022/05/12 10:45:01','2022/05/23', 3),
    ('2022/06/14 14:20:00','2022/06/20', 5),
    ('2022/07/26 15:40:00','2022/07/29', 4),
    ('2022/08/24 20:50:00','2022/08/28', 9),
    ('2022/10/29 19:45:00','2022/10/30', 10),
    ('2022/12/12 13:50:00','2022/12/15', 8),
    ('2022/11/24 14:30:00','2022/11/26', 7),
    ('2022/05/17 09:50:00','2022/05/19', 2),
    ('2022/04/14 07:00:00','2022/04/20', 10),
    ('2022/09/15 11:00:00','2022/09/23', 3),
    ('2022/04/16 11:10:00','2022/04/23', 3),
    ('2022/03/11 11:20:00','2022/03/23', 3);

INSERT into sessao (descricaoSessao,localizacaoSessao) VALUES
    ('Sessao1','Partilheira1'),
    ('Sessao2','Partilheira2'),
    ('Sessao3','Partilheira3'),
    ('Sessao4','Partilheira4'),
    ('Sessao5','Partilheira5'),
    ('Sessao6','Partilheira6'),
    ('Sessao7','Partilheira7'),
    ('Sessao8','Partilheira8'),
    ('Sessao9','Partilheira9'),
    ('Sessao10','Partilheira10'),
    ('Sessao11','Partilheira11'),
    ('Sessao12','Partilheira12'),
    ('Sessao13',null),
    ('Sessao14',null);

INSERT into livro (tituloLivro,autorLivro,fkIdSessao) VALUES
    ('Modelo Conceitual e Diagrama ER', 'Pressman, Roger S.',3),
    ('Livro 2: Modelo Relacional e Álgebra Relacional', 'Heuser, Carlos Alberto',1),
    ('Livro 3: Liguagem SQL', 'Beighley, Lynn', NULL),
    ('Conceito de Java', 'Pressman, Roger S.',11),
    ('Estrutura de Dados', 'Pressman, Roger S.',8),
    ('Banco de dados Oracle', 'Pressman, Roger S.',10),
    ('Programando em Python', 'Pressman, Roger S.',NULL),
    ('JavaScript todos os conceitos', 'Pressman, Roger S.',10),
    ('Android Studio', 'Pressman, Roger S.',4),
    ('Html e Css: Desenvolvimento Web', 'Pressman, Roger S.',2),
    ('Ruby para internet', 'Pressman, Roger S.',1),
    ('Conceito de IOS', null,10),
    ('Conceito de Teste',null,13),
    ('Conceito de IOS',null,14);

insert into livroemprestimo (fkCodigoLivro, fkCodigoEmprestimo) VALUES
	(2, 9),
    (9, 10),
    (2, 2), 
    (3, 6), 
    (4, 11), 
    (5, 3), 
    (1, 8), 
    (2, 5), 
    (3, 1), 
    (4, 9), 
    (5, 2),
    (5, 6), 
    (4, 8), 
    (3, 11), 
    (2, 4),
    (14,2),
    (13,8),
    (12,5);
    
-- Consulta SQL
SELECT * FROM aluno;
SELECT * FROM livro;
SELECT * FROM emprestimo;
SELECT * FROM sessao;
SELECT * FROM livroemprestimo;

-- CONSULTA COM INNER JOIN, LEFT, RIGHT, FULL

select * 
from livro
join sessao 
ON livro.fkidsessao = sessao.codigosessao;

select * 
from livro
LEFT join sessao 
ON livro.fkidsessao = sessao.codigosessao;

select * 
from livro
RIGHT join sessao 
ON livro.fkidsessao = sessao.codigosessao;

select * 
from livro
FULL join sessao 
ON livro.fkidsessao = sessao.codigosessao;
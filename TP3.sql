/*
TP 3 - Visualização de Dados e Introdução a SQL
O código abaixo foi desenvolvido em MySQL, dentro do MySQL Workbench, logo é possível que existam diferenças entre algumas queries e comandos em comparação com o SQL Lite.
*/

/*
Criação do Banco de Dado e seleção do Banco de Dado
*/
CREATE DATABASE DADOS_TP3;
USE DADOS_TP3;

/*
Parte 1
d. Rode ele na ferramenta SQL escolhida por você, e crie as seguintes tabelas, todas com dados:
*/
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado VARCHAR(100),
    CEP VARCHAR(20)
);

INSERT INTO Clientes (ClienteID, Nome, Email, Endereco, Cidade, Estado, CEP) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'Rua das Flores, 123', 'São Paulo', 'SP', '01234-567'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', 'Av. Brasil, 456', 'Rio de Janeiro', 'RJ', '21000-000'),
(3, 'Carlos Souza', 'carlos.souza@email.com', 'Praça da Liberdade, 789', 'Belo Horizonte', 'MG', '30140-010'),
(4, 'Ana Clara', 'ana.clara@email.com', 'Rua XV de Novembro, 1011', 'Curitiba', 'PR', '80020-310'),
(5, 'Pedro Martins', 'pedro.martins@email.com', 'Av. Sete de Setembro, 1213', 'Salvador', 'BA', '40060-001');

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2)
);

INSERT INTO Produtos (ProdutoID, Nome, Descricao, Preco) VALUES
(1, 'Notebook Gamer', 'Notebook de alto desempenho para jogos', 5300.00),
(2, 'Smartphone 128GB', 'Smartphone moderno com 128GB de armazenamento', 2200.50),
(3, 'Tablet 8"', 'Tablet compacto de 8 polegadas, ideal para uso diário', 1200.99),
(4, 'Smartwatch Fitness', 'Relógio inteligente com recursos de monitoramento de saúde', 890.00),
(5, 'Fone de Ouvido Bluetooth', 'Fones de ouvido sem fio com cancelamento de ruído', 450.75),
(6, 'Câmera DSLR', 'Câmera profissional para fotografia de alta qualidade', 7800.00),
(7, 'Mouse Gamer', 'Mouse ergonômico com alta precisão para jogos', 299.99),
(8, 'Teclado Mecânico', 'Teclado mecânico retroiluminado para uso intensivo', 520.00),
(9, 'Monitor 4K', 'Monitor 4K de 32 polegadas para gráficos nítidos', 4400.00),
(10, 'Carregador Portátil', 'Carregador portátil de alta capacidade', 150.00),
(11, 'Impressora Multifuncional', 'Impressora multifuncional para impressão, cópia e digitalização', 890.00),
(12, 'Webcam HD', 'Webcam de alta definição para videoconferências', 220.00),
(13, 'Roteador Wi-Fi', 'Roteador de alta velocidade para conexão de internet sem fios', 340.50),
(14, 'Speaker Bluetooth', 'Caixa de som portátil com conexão Bluetooth', 360.00),
(15, 'Drone com Câmera', 'Drone equipado com câmera para fotografia aérea', 5600.00),
(16, 'Console de Videogame', 'Console de última geração para jogos eletrônicos', 4500.00),
(17, 'Tripé para Câmera', 'Tripé ajustável para câmeras fotográficas', 120.00),
(18, 'HD Externo 1TB', 'Disco rígido externo de 1TB para armazenamento extra', 550.00),
(19, 'Pen Drive 64GB', 'Pen drive com 64GB de capacidade de armazenamento', 80.00),
(20, 'Carregador Sem Fio', 'Carregador sem fio universal para smartphones', 210.00);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    Status VARCHAR(50),
    Total DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido, Status, Total) VALUES
(1, 1, '2024-03-01', 'Em processamento', 5300.00),
(2, 2, '2024-03-02', 'Em processamento', 2500.50),
(3, 3, '2024-03-03', 'Entregue', 1500.98),
(4, 4, '2024-03-04', 'Enviado', 450.75),
(5, 5, '2024-03-05', 'Entregue', 890.00),
(6, 1, '2024-03-06', 'Cancelado', 8240.00),
(7, 2, '2024-03-07', 'Entregue', 299.99),
(8, 3, '2024-03-08', 'Enviado', 520.00),
(9, 4, '2024-03-09', 'Entregue', 4400.00),
(10, 5, '2024-03-10', 'Cancelado', 150.00),
(11, 1, '2024-03-11', 'Em processamento', 890.00),
(12, 2, '2024-03-12', 'Entregue', 440.00),
(13, 3, '2024-03-13', 'Enviado', 340.50),
(14, 4, '2024-03-14', 'Entregue', 360.00),
(15, 5, '2024-03-15', 'Em processamento', 5600.00),
(16, 1, '2024-03-16', 'Entregue', 4620.00),
(17, 2, '2024-03-17', 'Enviado', 120.00),
(18, 3, '2024-03-18', 'Entregue', 550.00),
(19, 4, '2024-03-19', 'Enviado', 630.00),
(20, 5, '2024-03-20', 'Cancelado', 210.00);

CREATE TABLE DetalhesPedido (
    DetalheID INT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

INSERT INTO DetalhesPedido (DetalheID, PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 1, 1, 1, 5300.00),
(2, 2, 2, 1, 2200.50),
(21, 2, 10, 2, 150.00),
(3, 3, 3, 1, 1200.99),
(22, 3, 7, 1, 299.99),
(4, 4, 5, 1, 450.75),
(5, 5, 4, 1, 890.00),
(6, 6, 6, 1, 7800.00),
(23, 6, 12, 2, 220.00),
(7, 7, 7, 1, 299.99),
(8, 8, 8, 1, 520.00),
(9, 9, 9, 1, 4400.00),
(10, 10, 10, 1, 150.00),
(11, 11, 11, 1, 890.00),
(12, 12, 12, 2, 220.00),
(13, 13, 13, 1, 340.50),
(14, 14, 14, 1, 360.00),
(15, 15, 15, 1, 5600.00),
(16, 16, 16, 1, 4500.00),
(24, 16, 17, 1, 120.00),
(17, 17, 17, 1, 120.00),
(18, 18, 18, 1, 550.00),
(19, 19, 19, 1, 80.00),
(25, 19, 18, 1, 550.00),
(20, 20, 20, 1, 210.00);

/*
Parte 1
g. Coloque os nomes nos padrões discutidos em sala de aula.
*/
ALTER TABLE clientes
RENAME TO CLIENTES;

ALTER TABLE detalhespedido
RENAME TO DETALHES_PEDIDO;

ALTER TABLE pedidos
RENAME TO PEDIDOS;

ALTER TABLE produtos
RENAME TO PRODUTOS;

ALTER TABLE CLIENTES 
CHANGE COLUMN ClienteID CLIENTE_ID INT,
CHANGE COLUMN Nome NOME VARCHAR(100),
CHANGE COLUMN Email EMAIL VARCHAR(100),
CHANGE COLUMN Endereco ENDERECO VARCHAR(255),
CHANGE COLUMN Cidade CIDADE VARCHAR(100),
CHANGE COLUMN Estado ESTADO VARCHAR(100);

ALTER TABLE DETALHES_PEDIDO 
CHANGE COLUMN DetalheID DETALHES_ID INT,
CHANGE COLUMN PedidoID PEDIDO_ID INT,
CHANGE COLUMN ProdutoID PRODUTO_ID INT,
CHANGE COLUMN Quantidade QUANTIDADE INT,
CHANGE COLUMN PrecoUnitario PRECO_UNITARIO DECIMAL(10, 2);

ALTER TABLE PEDIDOS
CHANGE COLUMN PedidoID PEDIDO_ID INT,
CHANGE COLUMN ClienteID CLIENTE_ID INT,
CHANGE COLUMN DataPedido DATA_PEDIDO DATE,
CHANGE COLUMN Status STATUS VARCHAR(50),
CHANGE COLUMN Total TOTAL DECIMAL(10, 2);

ALTER TABLE PRODUTOS
CHANGE COLUMN ProdutoID PRODUTO_ID INT,
CHANGE COLUMN Nome NOME VARCHAR(100),
CHANGE COLUMN Descricao DESCRICAO TEXT,
CHANGE COLUMN Preco PRECO DECIMAL(10, 2);

/*
Parte 1
h. Escreva as observações: se houve algum erro, se não concorda com a base disponibilizada, entre outros assuntos pertinentes em um arquivo de texto, para gerar um PDF no final.

Para evitar a verbosidade e criação de colunas desnecessárias, eu não utilizaria a coluna TOTAL na tabela PEDIDOS, já que é algo que apresentaria um valor que poderia ser encontrado com uma query de soma dos valores de cada produto dentro daquele pedido.
*/

/*
Parte 2
a. Uma consulta simples, para listar todos os produtos.
*/
SELECT *
FROM PRODUTOS;

/*
Parte 2
b. Uma consulta básica, para listar os nomes dos clientes ordenados por ordem alfabética.
*/
SELECT NOME
FROM CLIENTES
ORDER BY NOME;

/*
Parte 2
c. Selecione os detalhes do pedido de id 2.
*/
SELECT *
FROM PEDIDOS
WHERE PEDIDO_ID = 2;

/*
Parte 2
d. Encontre produtos com preço maior que 1000 reais e ordene de maior valor para menor valor.
*/
SELECT *
FROM PRODUTOS
WHERE PRECO > 1000
ORDER BY PRECO ASC;

/*
Parte 2
e. Mostre apenas 5 pedidos com total menor que 1000 reais.
*/
SELECT *
FROM PEDIDOS
WHERE TOTAL < 1000
LIMIT 5;

/*
Parte 2
f. Selecione produtos que estão em uma faixa de preço de 300 a 1000 reais.
*/
SELECT NOME, PRECO
FROM PRODUTOS
WHERE PRECO BETWEEN 300 AND 1000;

/*
Parte 2
g. Encontre pedidos do cliente Carlos Souza do dia 01/03/2024 até 10/03/2024.
*/
SELECT *
FROM PEDIDOS
JOIN CLIENTES ON PEDIDOS.CLIENTE_ID = CLIENTES.CLIENTE_ID
WHERE CLIENTES.NOME = 'Carlos Souza'
	AND PEDIDOS.DATA_PEDIDO BETWEEN '2024-03-01' AND '2024-03-10';

/*
Parte 2
h. Retorne pedidos específicos do cliente Carlos Souza, e também todos que estão com o status “Entregue”.
*/
SELECT *
FROM PEDIDOS
JOIN CLIENTES ON PEDIDOS.CLIENTE_ID = CLIENTES.CLIENTE_ID
WHERE (CLIENTES.NOME = 'Carlos Souza') 
	OR (PEDIDOS.STATUS = 'Entregue');

/*
Parte 2
i. Selecione pedidos que contém os produtos “Notebook Gamer”, “Smartwatch Fitness”, “Roteador Wi-Fi”, “Pen Drive 64GB” e “Mouse Gamer”.
*/
SELECT PEDIDOS.PEDIDO_ID, PRODUTOS.NOME, PEDIDOS.DATA_PEDIDO, PEDIDOS.STATUS, PEDIDOS.TOTAL
FROM PEDIDOS
JOIN DETALHES_PEDIDO ON PEDIDOS.PEDIDO_ID = DETALHES_PEDIDO.PEDIDO_ID
JOIN PRODUTOS ON DETALHES_PEDIDO.PRODUTO_ID = PRODUTOS.PRODUTO_ID
WHERE PRODUTOS.NOME IN ('Notebook Gamer', 'Smartwatch Fitness', 'Roteador Wi-Fi', 'Pen Drive 64GB', 'Mouse Gamer');
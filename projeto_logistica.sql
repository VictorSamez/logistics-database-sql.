-- ====================================================================
-- PROJETO: Sistema de Banco de Dados para Gestão de Logística (LogiData)
-- Autor: [victor Samez]
-- Objetivo: Demonstrar habilidades em DDL, DML e consultas relacionais (JOINS).
-- ====================================================================

-- 1. CRIAÇÃO DAS TABELAS (DDL)
-- --------------------------------------------------------------------

-- Criando a tabela de Clientes (Remetentes/Destinatários)
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    cidade TEXT NOT NULL
);

-- Criando a tabela de Entregadores (Motoristas)
CREATE TABLE IF NOT EXISTS entregadores (
    id_entregador INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_entregador TEXT NOT NULL,
    veiculo TEXT NOT NULL,
    status TEXT DEFAULT 'Disponível'
);

-- Criando a tabela de Pedidos/Entregas (Tabela Relacional)
CREATE TABLE IF NOT EXISTS entregas (
    id_entrega INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_entregador INTEGER,
    produto TEXT NOT NULL,
    valor_frete REAL NOT NULL,
    status_entrega TEXT DEFAULT 'Pendente',
    data_entrega TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_entregador) REFERENCES entregadores(id_entregador)
);


-- 2. INSERÇÃO DE DADOS DE TESTE (DML)
-- --------------------------------------------------------------------

INSERT INTO clientes (nome, telefone, cidade) VALUES 
('Empresa Alfa', '51-99999-1111', 'Canoas'),
('Loja Beta', '51-99999-2222', 'Porto Alegre'),
('Mercado Central', '51-99999-3333', 'Canoas');

INSERT INTO entregadores (nome_entregador, veiculo, status) VALUES 
('Marcos Paulo', 'Carro', 'Disponível'),
('Ana Silva', 'Moto', 'Em Rota'),
('Carlos Souza', 'Caminhão', 'Disponível');

-- Inserindo entregas (repare no uso dos IDs para associar cliente e entregador)
INSERT INTO entregas (id_cliente, id_entregador, produto, valor_frete, status_entrega, data_entrega) VALUES 
(1, 2, 'Notebooks', 45.00, 'Entregue', '2026-06-01'),
(2, 2, 'Roupas', 25.50, 'Em Rota', '2026-06-08'),
(3, 1, 'Alimentos', 120.00, 'Pendente', '2026-06-08'),
(1, 3, 'Cadeiras Escritório', 250.00, 'Entregue', '2026-06-05');


-- 3. CONSULTAS E RELATÓRIOS INTELIGENTES (DQL)
-- --------------------------------------------------------------------

-- Relatório 1: Lista Geral de Entregas mostrando os nomes do Cliente e do Entregador (Uso de INNER JOIN)
SELECT 
    e.id_entrega,
    c.nome AS Nome_Cliente,
    c.cidade AS Destino,
    e.produto,
    ent.nome_entregador AS Motorista,
    e.status_entrega AS Status
FROM entregas e
INNER JOIN clientes c ON e.id_cliente = c.id_cliente
INNER JOIN entregadores ent ON e.id_entregador = ent.id_entregador;

-- Relatório 2: Faturamento Total com Fretes (Uso de Funções de Agregação)
SELECT 
    COUNT(id_entrega) AS Total_De_Entregas,
    SUM(valor_frete) AS Faturamento_Total_Frete,
    AVG(valor_frete) AS Valor_Medio_Por_Frete
FROM entregas;

-- Relatório 3: Quantidade de entregas pendentes ou em rota por cidade
SELECT 
    c.cidade,
    COUNT(e.id_entrega) AS Qtd_Entregas_Ativas
FROM entregas e
INNER JOIN clientes c ON e.id_cliente = c.id_cliente
WHERE e.status_entrega != 'Entregue'
GROUP BY c.cidade;

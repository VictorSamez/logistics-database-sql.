# 📦 Logistics Database System (LogiData)

O **LogiData** é um sistema de banco de dados relacional focado na gestão e análise de operações logísticas de entregas. O projeto simula o ecossistema real de uma transportadora, controlando de forma automatizada o fluxo de clientes, motoristas, valores de fretes e o status de cada pedido.

A ideia deste projeto nasceu da oportunidade de unir a minha sólida experiência prática anterior no setor de operações e logística com as competências técnicas que venho desenvolvendo na área de TI.

---

## 🛠️ Tecnologias e Ferramentas
* **Linguagem:** SQL (Padrão ANSI)
* **SGBD:** SQLite
* **Interface de Gestão:** SQLite Studio
* **Editor de Código:** VS Code

---

## 📋 Arquitetura do Banco de Dados
O sistema é composto por 3 tabelas principais altamente relacionadas:
1. `clientes`: Registo de remetentes/destinatários e a sua localização.
2. `entregadores`: Controlo da frota de motoristas, tipos de veículos e disponibilidade.
3. `entregas`: A tabela central que conecta clientes e entregadores para monitorizar produtos, valores de frete e o estado da entrega.

---

## 🚀 Competências Técnicas Demonstradas

### 1. Modelagem e Estruturação (DDL)
* Criação de tabelas com restrições de integridade rigorosas (`NOT NULL`).
* Definição de chaves primárias (`PRIMARY KEY`) com numeração automática (`AUTOINCREMENT`).
* Relacionamento seguro entre entidades através de chaves estrangeiras (`FOREIGN KEY`).

### 2. Manipulação de Dados (DML)
* Criação de massa de dados de teste coerente para simular o dia a dia de uma operação real (`INSERT INTO`).

### 3. Análise de Dados e Relatórios (DQL)
* **INNER JOIN:** Junção de múltiplas tabelas para transformar IDs numéricos em relatórios legíveis com nomes de clientes e motoristas.
* **Funções de Agregação:** Uso de `SUM`, `COUNT` e `AVG` para extrair métricas de faturamento total, ticket médio de frete e volume de entregas.
* **Agrupamentos:** Uso de `GROUP BY` combinado com filtros `WHERE` para monitorizar a quantidade de entregas pendentes por cidade.

---

## 📂 Como Explorar este Repositório
* `projeto_logistica.sql`: Contém todos os scripts de criação, inserção e as consultas prontas para serem executadas.
* `projeto_logistica.sql`: O arquivo de banco de dados já compilado e populado, pronto para ser aberto diretamente no **SQLite Studio**.

---
Projeto desenvolvido por [Victor Samez] — Conectando vivência de mercado com inteligência de dados.

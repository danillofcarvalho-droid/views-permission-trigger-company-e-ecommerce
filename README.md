# Banco de Dados – Company & E-commerce

Este projeto tem como objetivo demonstrar a aplicação de conceitos de manipulação de dados em banco de dados relacionais utilizando MySQL. O projeto foi desenvolvido como parte de um desafio prático envolvendo criação de tabelas, views, índices, triggers, procedures e controle de acesso a dados.

O repositório contém dois cenários distintos de banco de dados: **Company** e **E-commerce**. Cada cenário foi utilizado para aplicar diferentes recursos do MySQL.

## Estrutura do projeto

O projeto está organizado em duas principais bases de dados:

### Company
Banco de dados voltado para gestão de funcionários, departamentos e projetos.
Principais entidades:
- Employee
- Department
- Project
- Works_on
- Dependent
- Dept_locations

Neste cenário foram implementados:
- Views para visualização de dados estratégicos
- Controle de acesso utilizando usuários e permissões
- Procedure para manipulação de dados de funcionários

As views criadas permitem responder perguntas como:
- Número de empregados por departamento e localidade
- Lista de departamentos e seus gerentes
- Projetos com maior número de empregados
- Relação entre projetos, departamentos e gerentes
- Identificação de empregados que possuem dependentes e se exercem função de gerente

Além disso, foram criados usuários com diferentes níveis de acesso ao banco de dados, permitindo controle sobre quais informações cada perfil pode visualizar.

### E-commerce
Banco de dados voltado para o gerenciamento de clientes, pedidos, produtos e fornecedores.
Principais entidades:
- Clients
- Orders
- Product
- Supplier
- Seller
- ProductOrder
- ProductSupplier

Neste cenário foram implementados **triggers** para automatizar ações importantes no banco de dados.
As triggers criadas possuem os seguintes objetivos:
- Registrar dados de clientes antes da exclusão da conta, evitando perda de informações importantes
- Registrar alterações de salário de colaboradores, mantendo um histórico de modificações


## Objetivo do projeto

O principal objetivo deste projeto é demonstrar o uso de recursos avançados de banco de dados, como:
- Criação de índices
- Views
- Triggers
- Procedures
- Controle de acesso com usuários e permissões

Esses recursos permitem melhorar a organização dos dados, aumentar a performance das consultas e garantir maior segurança e controle sobre as informações armazenadas no banco de dados.

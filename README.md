# Projeto de Banco de Dados para Oficina

Este projeto consiste na criação de um banco de dados para uma oficina mecânica. O banco de dados deve armazenar informações sobre clientes, funcionários, veículos, peças, serviços, ordens de serviço e pagamentos.

## Esquema Lógico

O esquema lógico do banco de dados é composto pelas seguintes tabelas:

* `cliente`: armazena informações sobre clientes, como nome, CPF, endereço, telefone e e-mail.
* `funcionario`: armazena informações sobre funcionários, como nome, CPF, função, salário e data de contratação.
* `veiculo`: armazena informações sobre veículos, como placa, chassi, modelo, marca, ano e cor.
* `peca`: armazena informações sobre peças, como código, descrição, marca, modelo, preço e quantidade em estoque.
* `servico`: armazena informações sobre serviços, como código, descrição, preço e tempo de execução.
* `ordem_servico`: armazena informações sobre ordens de serviço, como data de abertura, data de fechamento, status, valor total e funcionário responsável.
* `item_ordem_servico`: armazena informações sobre os itens de uma ordem de serviço, como código do serviço, quantidade, preço unitário e valor total.
* `pagamento`: armazena informações sobre pagamentos, como data, valor, forma de pagamento e número do documento.

## Scripts SQL

Os scripts SQL para criação do esquema do banco de dados e persistência de dados estão disponíveis neste repositório.

## Queries

As seguintes queries foram desenvolvidas para demonstrar o uso de cláusulas SQL avançadas:

### Recuperação simples com SELECT Statement

```sql
SELECT
  cliente.nome,
  cliente.cpf,
  cliente.telefone,
  cliente.e-mail
FROM
  cliente;
```

### Filtros com WHERE Statement
```sql
SELECT
  cliente.nome,
  cliente.cpf,
  cliente.telefone,
  cliente.e-mail
FROM
  cliente
WHERE
  cliente.cpf = '123.456.789-00';

```
### Crie expressões para gerar atributos derivados
```sql
SELECT
  cliente.nome,
  cliente.cpf,
  cliente.telefone,
  cliente.e-mail,
  (cliente.data_nascimento - CURDATE()) AS idade
FROM
  cliente;

```
### Defina ordenações dos dados com ORDER BY
```sql
SELECT
  cliente.nome,
  cliente.cpf,
  cliente.telefone,
  cliente.e-mail
FROM
  cliente
ORDER BY
  cliente.nome;

```
### Condições de filtros aos grupos – HAVING Statement
```sql
SELECT
  cliente.nome,
  COUNT(*) AS total_clientes
FROM
  cliente
GROUP BY
  cliente.cidade
HAVING
  COUNT(*) > 10;

```

### Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
```sql
SELECT
  cliente.nome,
  veiculo.placa,
  servico.descricao,
  ordem_servico.valor_total
FROM
  cliente
INNER JOIN
  ordem_servico
ON
  cliente.id = ordem_servico.cliente_id
INNER JOIN
  item_ordem_servico
ON
  ordem_servico.id = item_ordem_servico.ordem_servico_id
INNER JOIN
  servico
ON
  item_ordem_servico.servico_id = servico.id
WHERE
  ordem_servico.status = 'Aprovado';

```

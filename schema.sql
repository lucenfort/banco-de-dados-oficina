CREATE DATABASE e_commerce;

USE e_commerce;

CREATE TABLE cliente (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  e-mail VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE funcionario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  funcao VARCHAR(255) NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  data_contratacao DATE NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE veiculo (
  id INT NOT NULL AUTO_INCREMENT,
  placa VARCHAR(7) NOT NULL,
  chassi VARCHAR(17) NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  marca VARCHAR(255) NOT NULL,
  ano INT NOT NULL,
  cor VARCHAR(255) NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE peca (
  id INT NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  marca VARCHAR(255) NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  quantidade_estoque INT NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE servico (
  id INT NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  tempo_execucao INT NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ordem_servico (
  id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  data_abertura DATE NOT NULL,
  data_fechamento DATE NOT NULL,
  status VARCHAR(255) NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  funcionario_responsavel INT NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente (id) ON DELETE CASCADE
);

CREATE TABLE item_ordem_servico (
  id INT NOT NULL AUTO_INCREMENT,
  ordem_servico_id INT NOT NULL,
  servico_id INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (ordem_servico_id) REFERENCES ordem_servico (id) ON DELETE CASCADE,
  FOREIGN KEY (servico_id) REFERENCES servico (id) ON DELETE CASCADE
);

CREATE TABLE pagamento (
  id INT NOT NULL AUTO_INCREMENT,
  ordem_servico_id INT NOT NULL,
  forma_pagamento VARCHAR(255) NOT NULL,
  data_pagamento DATE NOT NULL,
  data_cadastro DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (ordem_servico_id) REFERENCES ordem_servico (id) ON DELETE CASCADE
);

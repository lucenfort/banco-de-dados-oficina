USE e_commerce;

-- Inserção de dados na tabela cliente

INSERT INTO cliente (nome, cpf, telefone, e-mail, data_nascimento)
VALUES
  ('João da Silva', '123.456.789-00', '(11) 1234-5678', 'joao.silva@email.com', '1990-01-01'),
  ('Maria da Silva', '987.654.321-00', '(21) 9876-5432', 'maria.silva@email.com', '1991-02-02'),
  ('José da Silva', '321.654.987-00', '(31) 3216-5498', 'jose.silva@email.com', '1992-03-03');

-- Inserção de dados na tabela funcionário

INSERT INTO funcionario (nome, cpf, funcao, salario, data_contratacao)
VALUES
  ('Pedro da Silva', '654.321.987-00', 'Mecânico', 2000.00, '2023-01-01'),
  ('Ana da Silva', '543.216.987-00', 'Secretária', 1500.00, '2022-02-02'),
  ('João da Silva', '789.012.345-67', 'Gerente', 5000.00, '2021-03-03');

-- Inserção de dados na tabela veículo

INSERT INTO veiculo (placa, chassi, modelo, marca, ano, cor)
VALUES
  ('ABC-1234', '1234567890123456', 'Gol', 'Volkswagen', 2022, 'Vermelho'),
  ('XYZ-5678', '9876543210987654', 'Onix', 'Chevrolet', 2021, 'Branco'),
  ('QWE-9012', '7654321098765432', 'Fiesta', 'Ford', 2020, 'Prata');

-- Inserção de dados na tabela peça

INSERT INTO peca (codigo, descricao, marca, modelo, preco, quantidade_estoque, data_cadastro)
VALUES
  ('123456', 'Pneu 185/65 R15', 'Bridgestone', 'Turanza ER300', 200.00, 50, CURRENT_TIMESTAMP()),
  ('789012', 'Amortecedor dianteiro', 'Monroe', 'Gas-a-Gas', 300.00, 20, CURRENT_TIMESTAMP()),
  ('345678', 'Pastilha de freio dianteira', 'Valeo', 'Sinterizadas', 150.00, 100, CURRENT_TIMESTAMP());

-- Inserção de dados na tabela serviço

INSERT INTO servico (codigo, descricao, preco, tempo_execucao)
VALUES
  ('1', 'Troca de óleo', 100.00, 30),
  ('2', 'Revisão de freios', 200.00, 60),
  ('3', 'Conserto de motor', 500.00, 240);

-- Inserção de dados na tabela ordem_servico

INSERT INTO ordem_servico (cliente_id, data_abertura, data_fechamento, status, valor_total, funcionario_id, veiculo_id, peca_id, servico_id)
VALUES
  (1, '2023-03-08', NULL, 'Aberto', 1000.00, 1, 1, 1, 1);

-- Criação de uma função para calcular o valor total de uma ordem de serviço

CREATE FUNCTION valor_total_ordem_servico(
  id_ordem_servico INT
) RETURNS DOUBLE
AS
BEGIN
  -- Retorna o valor total da ordem de serviço
  RETURN (
    SELECT SUM(servico.preco)
    FROM ordem_servico
    JOIN servico
      ON ordem_servico.servico_id = servico.id
    WHERE ordem_servico.id = id_ordem_servico
  );
END;

-- Usando a função para calcular o valor total de uma ordem de serviço

SELECT valor_total_ordem_servico(1);

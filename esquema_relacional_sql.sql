-- criação do banco de dados para o cenário oficina mecânica

CREATE DATABASE IF NOT EXISTS  oficina_mecanica;

USE oficina_mecanica;

-- criar tabela cliente

CREATE TABLE IF NOT EXISTS cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(10),
    nomeMeioAbreviado CHAR(3),
    sobrenome VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    endereco VARCHAR(300),
    CONSTRAINT unico_cpf_cliente UNIQUE (cpf)
);
    
ALTER TABLE cliente AUTO_INCREMENT=1;

    
-- DESC cliente;
    
-- criar tabela veiculo

CREATE TABLE IF NOT EXISTS veiculo(
	idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
	Placa CHAR(7) UNIQUE,
    TipoVeiculo ENUM('Motocicleta','Automóvel'),
    MarcaVeiculo CHAR(10),
    ModeloVeiculo CHAR(10),
    AnoVeiculo INT,
    idCliente INT,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES cliente (idCliente)
);

ALTER TABLE veiculo AUTO_INCREMENT=1;

-- criar tabela funcionario

CREATE TABLE IF NOT EXISTS funcionario(
	idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(10),
    nomeMeioAbreviado CHAR(3),
    sobrenome VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    CONSTRAINT unico_cpf_cliente UNIQUE (cpf)
    );
    
ALTER TABLE funcionario AUTO_INCREMENT=1;

-- Criar tabela serviço

CREATE TABLE IF NOT EXISTS servico(
	idServico INT AUTO_INCREMENT PRIMARY KEY,
	idVeiculo INT,
    idFuncionario INT,
    dataEntrada DATE,
    tipoServico ENUM('Revisão', 'Troca de Óleo', 'Peças', 'Reparo Simples'),
	descricaoServico VARCHAR(255),
    orcamento FLOAT,
	statusOrcamento ENUM('Reprovado', 'Aprovado', 'Em andamento'),
    dataEntrega DATE,
	tipoPagamento ENUM('Boleto', 'Cartão', 'Dois cartões'),
    valorTotal FLOAT,
    CONSTRAINT fk_servico_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculo (idVeiculo),
    CONSTRAINT fk_servico_funcionario FOREIGN KEY (idFuncionario) REFERENCES funcionario (idFuncionario)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

ALTER TABLE servico AUTO_INCREMENT=1;
    
-- DESC servico;


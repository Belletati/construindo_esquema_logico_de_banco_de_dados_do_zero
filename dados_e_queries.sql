USE oficina_mecanica;

SHOW TABLES;

DESC cliente;

INSERT INTO cliente (nome, nomeMeioAbreviado, sobrenome, CPF, endereco) VALUES
							('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
							('Matheus','O','Pimentel', 987654321,'rua alameda 289, Centro - Cidade das flores'),
							('Ricardo','F','Silva', 45678913,'avenida alameda vinha 1009, Centro - Cidade das flores'),
							('Julia','S','França', 789123456,'rua lareiras 861, Centro - Cidade das flores'),
							('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
							('Isabela','M','Cruz', 654789123,'rua alameda das flores 28, Centro - Cidade das flores');
SELECT * FROM cliente;

DESC funcionario;

INSERT INTO funcionario (nome, nomeMeioAbreviado, sobrenome, CPF) VALUES
							('Jose', 'R', 'Silva', 335589458),
							('Marcos', NULL, 'Barbosa', 578631495),
							('Domingos', 'S', 'Sauro',746589123);
SELECT * FROM funcionario;

DESC veiculo;

INSERT INTO veiculo (Placa, TipoVeiculo, MarcaVeiculo, ModeloVeiculo, AnoVeiculo, idCliente) VALUES 
							 ('EUD2584', 'Motocicleta','Honda', 'NXR', 2020, 1),
                             ('DFG6548', 'Automóvel','Fiat', 'Pulse', 2019, 4),
                             ('AGH7969', 'Automóvel', 'Ford', 'Ka', 2015, 6),
                             ('UKB1467', 'Automóvel', 'Fiat', 'Mobi', 2018, 5),
                             ('QWE6658', 'Automóvel', 'Toyota', 'Hilux', 2015, 3),
                             ('MNI2374', 'Motocicleta', 'Honda', 'ADV', 2023, 2),
                             ('WRT4474', 'Automóvel', 'Fiat', 'Strada', 2014, 5),
                             ('XCD6985', 'Automóvel', 'Toyota', 'Etios', 2016, 1),
                             ('SDF3656', 'Motocicleta', 'Yamaha', 'WR', 2022, 4);
                             
SELECT * FROM veiculo ORDER BY idCliente;

DESC servico;

INSERT INTO servico (idVeiculo, idFuncionario, dataEntrada, tipoServico, descricaoServico, orcamento, statusOrcamento, dataEntrega, tipoPagamento, valorTotal) VALUES 
							 (1, 1, '2023-2-25','Revisão', 'Revisão de rotina', 600.00, 'Aprovado', '2023-2-28', 'Dois cartões', 600.00),
                             (2, 2,'2023-2-25', 'Troca de Óleo', 'Troca padrão', 135.00, 'Reprovado', '2023-2-25', NULL, NULL),
                             (3, 3, '2023-2-26', 'Peças', 'Retrovisor esquerdo', 129.90, 'Em andamento', '2023-2-26', 'Cartão', 129.90),
                             (4, 1,'2023-2-27', 'Revisão', 'Revisão de rotina', 600.00, 'Em andamento', '2023-3-2', 'Cartão', 600.00);
                             
INSERT INTO servico (idVeiculo, idFuncionario, dataEntrada, tipoServico, descricaoServico, orcamento, statusOrcamento, dataEntrega, tipoPagamento, valorTotal) VALUES 
							 (2, 2, '2023-2-25','Revisão', 'Revisão de rotina', 600.00, 'Aprovado', '2023-2-28', 'Cartão', 600.00);
SELECT * FROM servico;



-- queries SQL

SELECT COUNT(*) FROM cliente;

SELECT * FROM cliente c, veiculo v WHERE c.idCliente = v.idCliente;

SELECT CONCAT(c.nome,' ', c.sobrenome) AS cliente, s.idServico AS Pedido, s.valorTotal AS Total, v.Placa AS Placa 
FROM cliente c, servico s, veiculo v 
WHERE c.idCliente = v.idCliente AND v.idVeiculo = s.idVeiculo;

SELECT COUNT(Nped.Pedido) AS Numero_de_Pedidos, Nped.cliente, SUM(Total) AS Total
FROM (
	SELECT CONCAT(c.nome,' ', c.sobrenome) AS cliente, s.idServico AS Pedido, s.valorTotal AS Total, v.Placa AS Placa 
	FROM cliente c, servico s, veiculo v 
	WHERE c.idCliente = v.idCliente AND v.idVeiculo = s.idVeiculo
    ) AS Nped
GROUP BY Nped.cliente; 	    
    

SELECT * 
FROM cliente c 
JOIN veiculo v ON c.idCliente = v.idCliente;

SELECT COUNT(i.idVeiculo) AS Num_veiculos_cadastrados, CONCAT(i.nome,' ', i.sobrenome) AS cliente
FROM (
	SELECT * 
	FROM cliente c 
	JOIN veiculo v USING (idCliente)
) AS i
GROUP BY idCliente;
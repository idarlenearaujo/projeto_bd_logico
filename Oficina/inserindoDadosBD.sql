# Inserindo dados

# Tabela Clients
insert into Clients (Cname, Mname, Lname, Address, CPF, CNPJ, Sex, Bdate)
values('Maria', 'A', 'Chaves', 'Rua Irai, 25, Centro - Cidade das Flores', null, '025145699000109', default, null),
('José', 'G', 'Magela', 'Avenida Presidente Vargas, 366, Centro - Cidade das Flores', '12312312325', null, 'M', '1994-04-15'),
('Stelita', 'G', 'Hiskyer', 'Rua Araruama, 1258, Centro - Cidade das Flores', '14725836989', null, 'F', '1988-03-16'),
('Fernanda', 'K', 'Silva', 'Rua Sacramento, 1, Lapa - Cidade das Flores', null, '022589654000325', default, null),
('Paula', 'R', 'Pinto', 'Rua Lopes da Silva, 27, Copacabana - Cidade das Flores', null, '195876444000109', default, null),
('Bruno', 'P', 'Lopes', 'Avenida Argentina, 125, Capanema - Cidade das Flores', '12358965422', null, 'M', '1970-07-19'),
('Alex', 'A', 'Guimarães', 'Avenida Amazonas, 290, Lapa - Cidade das Flores', '11145869888', null, 'M', '1990-08-19'),
('Kaike', 'S', 'Menezes', 'Rua São Francisco de Assis, 242, Lapa - Cidade das Flores', null, '014555888001222', default, null);

# Tabela Carro
insert into Car (Cname, Brand, Color, CarYear)
values ('Gol', 'Volkswagen', 'Branco', '1997'),
('Palio', 'Fiat', 'Prata', '2003'),
('X1', 'BMW', 'Preto', '2021'),
('RAM', 'Ford', 'Cinza', '2021');

# Tabela Mecânico
insert into Mechanic (Mname, MMname, MLname)
values ('Francisco', 'A', 'Silva'),
('Ricardo', 'S', 'Franco'),
('Junior', 'W', 'Lopes'),
('Luis', 'A', 'Fernandes');

# Tabela Fornecedor
insert into Supplier (Sname, CNPJ, Address)
values ('Fiz Premium do Brasil', '12456987008533', 'Rua dos Internacionais, 255, Centro - Rio de Janeiro'),
('Volkswagen do Brasil', '25369852004502', 'Avenida Amazonas, 1589, Centro - Belo Horizonte'),
('Fiat do Brasil', '12589658007711', 'Rua Irai, 25, Centro - Itaúna'),
('Importados Blitz', '44589632005802', 'Rua Jardim das Palmeiras, 444, Jardins - São Paulo'),
('Brasil das Peças', '19498366000109', 'Avenida Imperatriz Laopes, 4777, Centro - Curitiba');

# Tabela Estoque
insert into Storages (Sname, Location, Quantity)
values ('Estoque X1', 'Cidade das Flores', 5000),
('Estoque X2', 'Cidade das Flores', 10000),
('Estoque X3', 'Cidade das Flores', 50000);

# Tabela Produto/Serviço
insert into CarPart (Cname, TypeCarPart)
values ('Alternador', default),
('Radiador', default),
('Troca de óleo', null),
('Alinhamento e balanceamento', default),
('Amortecedor Dianteiro', default),
('Bateria', default),
('Troca de pastilhas de freio', null),
('Correia Dentada', default),
('Diagnóstico e reparo de sistemas elétricos', null),
('Filtro de Óleo', default);

# Tabela Produto/Serviço - Estoque
insert into CarPart_Storage (idCPSStorage, idCPSCarPart, StatusStorage)
values (1, 2, default),
(1, 2, default),
(1, 6, default),
(1, 6, default),
(2, 6, default),
(3, 6, default),
(2, 6, default),
(2, 8, default),
(3, 1, default),
(3, 8, default);

# Tabela Produto/Serviço - Fornecedor
insert into CarPart_Supplier (idCPSSupplier, idCPSCarPart)
values (1, 1),
(2, 2),
(3, 5),
(1, 6),
(3, 8),
(1, 10);

# Tabela SO
insert into ServiceOrder (idSOClient, idSOMechanic, idSOCar, TotalValue, Discount, StatusSO)
values (1, 1, 1, 350.00, 10.50, 'Entregue'),
(2, 1, 1, 550.00, default, 'Entregue'),
(2, 1, 1, 200.00, default, default),
(4, 3, 2, 520.00, 0.55, 'Em andamento'),
(5, 2, 2, 2270.00, 0.00, default),
(6, 2, 3, 580.00, default, default),
(6, 2, 4, 120.00, 5.00, 'Entregue'),
(6, 2, 3, 369.00, default, 'Entregue'),
(7, 3, 3, 200.00, default, 'Cancelado'),
(8, 3, 2, 40.00, default, 'Em andamento'),
(3, 1, 2, 200.55, 8.55, default);

# Tabela So movimentos
insert into CarPart_SO (idCPSOCarPart, idCPSOSO, ValueCarPart, Quantity, StatusCarPart)
values (6, 1, 350.00, 1, default),
(6, 2, 350.00, 1, default),
(3, 2, 200.00, 1, default),
(3, 3, 200.00, 1, default),
(2, 4, 520.00, 1, default),
(1, 5, 750.00, 1, default),
(5, 5, 1520.00, 1, default),
(8, 6, 580.00, 1, default),
(9, 7, 120.00, 1, default),
(10, 8, 369.00, 1, default),
(4, 9, 200.00, 1, default),
(7, 10, 40.00, 1, default),
(4, 11, 200.00, 1, default);
    
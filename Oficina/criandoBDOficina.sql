# Criando o BD
CREATE DATABASE oficina;

# Selecionando o BD
USE oficina;

# Criando tabela Cliente
create table Clients (
	idClient int auto_increment not null primary key,
    Cname varchar(45) not null,
    Mname char(3) not null,
    Lname varchar(45) not null,
    Address varchar(255) not null,
    CPF varchar(11),
    CNPJ varchar(15),
    Sex char(2) default 'SN',
    Bdate date,
    constraint cpf_unique_client unique (CPF),
    constraint cnpj_unique_client unique (CNPJ)
);

# Criando tabela Carro
create table Car (
	idCar int auto_increment not null primary key,
    Cname varchar(45) not null,
    Brand varchar(45) not null,
    Color varchar(45) not null,
    CarYear char(4) not null
);

# Criando tabela Mecânico
create table Mechanic (
	idMechanic int auto_increment not null primary key,
    Mname varchar(45) not null,
    MMname char(3) not null,
    MLname varchar(45) not null
);

# Criando tabela Fornecedor
create table Supplier (
	idSupplier int auto_increment not null primary key,
	Sname varchar(45) not null,
    CNPJ varchar(15) not null,
    Address varchar(255)
);

# Criando tabela Estoque
create table Storages (
	idStorage int auto_increment not null primary key,
    Sname varchar(45) not null,
    Location varchar(45) not null,
    Quantity float not null
);

# Criando tabela Produto/Serviço
create table CarPart (
	idCarPart int auto_increment not null primary key,
    Cname varchar(100) not null,
    TypeCarPart ENUM('Peça', 'Serviço') default 'Peça'
);

# Criando tabela CarPart - Storage - N:N
create table CarPart_Storage (
	idCarPartStorage int auto_increment not null,
	idCPSStorage int,
    idCPSCarPart int,
    primary key(idCPSStorage, idCPSCarPart, idCarPartStorage),
    StatusStorage ENUM('Disponível', 'Indisponível') default 'Disponível',
    key (idCarPartStorage),
    constraint fk_idStorage_CarPart_Storage foreign key (idCPSStorage) references storages (idStorage),
    constraint fk_idCarPart_CarPart_Storage foreign key (idCPSCarPart) references carpart (idCarPart)
);

# Criando tabela CarPart - Supplier - N:N
create table CarPart_Supplier (
	idCarPartSupplier int auto_increment not null,
    idCPSSupplier int,
    idCPSCarPart int,
    primary key(idCPSSupplier, idCPSCarPart, idCarPartSupplier),
    key(idCarPartSupplier),
	constraint fk_idSupplier_CarPart_Supplier foreign key (idCPSSupplier) references supplier (idSupplier),
    constraint fk_idCarPart_CarPart_Supplier foreign key (idCPSCarPart) references carpart (idCarPart)
);

# Criando tabela SO
create table ServiceOrder (
	idServiceOrder int auto_increment not null primary key,
    idSOClient int,
    idSOMechanic int,
    idSOCar int,
    TotalValue float,
    Discount float default 0.0,
    StatusSO ENUM('Agendado', 'Em andamento', 'Finalizado', 'Entregue', 'Cancelado') default 'Agendado',
    constraint fk_idClient_SO foreign key (idSOClient) references clients (idClient),
    constraint fk_idMechanic_SO foreign key (idSOMechanic) references mechanic (idMechanic),
    constraint fk_idCar_SO foreign key (idSOCar) references car (idCar)    
);

# Criando tabela N:N - SO_Item
create table CarPart_SO (
	idCarPartSO int auto_increment not null,
	idCPSOCarPart int,
    idCPSOSO int,
    primary key (idCPSOCarPart, idCPSOSO, idCarPartSO),
    ValueCarPart float not null,
    Quantity int not null,
    StatusCarPart ENUM('Nova', 'Usada') default 'Nova',
    key(idCarPartSO),
    constraint fk_idSO_CarPart_SO foreign key (idCPSOSO) references serviceOrder (idServiceOrder),
    constraint fk_idCarPart_CarPart_SO foreign key (idCPSOCarPart) references carPart (idCarPart)
);

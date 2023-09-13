create database Mush_Room;

use mush_room;

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar (20) not null,
cnpj char (14) not null unique,
email varchar (25) not null,
telefone char (11) not null
);

create table usuarios(
idUsuario int primary key auto_increment,
tipoUser varchar(20),
constraint chkTipoUser check (tipoUser IN ('ADM','Normal','SuperADM')),
nomeUser varchar(50) not null,
cpf varchar(40) unique not null,
senha varchar(20) not null
);

create table cogumelo(
idCogumelo int primary key auto_increment,
nomeEspecie varchar(50) not null,
tempMax INT not null,
tempMin INT not null,
umiMax INT not null,
umiMin INT not null
);

create table sensor(
idSensor int primary key auto_increment, 
statSensor boolean not null,
nomeSensor varchar(30) not null
);

create table registros(
idRegistro int primary key auto_increment,
dataHora datetime default current_timestamp, 
idSensor int, -- Chave estrangeira
idCogumelo int, -- Chave estrangeira
dadoSensorTemp int not null,
dadoSensorUmi int not null
);

insert into registros(idSensor,dadoSensorTemp, dadoSensorUmi) VALUES
	( 1, 20, 36),
    ( 2, 12, 34),
    ( 3, 70, 30);

insert into sensor(statSensor,nomeSensor) VALUES
	( 0, 'Sensor1'),
    ( 1, 'Sensor2'),
    ( 1, 'Sensor3');
    
insert into cogumelo(nomeEspecie,tempMax,tempMin,umiMax,umiMin) VALUES
    ('Shimeji','30','25','90','80'),
	('Shitake','25','20','95','75'),
	('Champignon','25','12','90','80');
    
insert into usuarios(tipoUser,nomeUser,cpf,senha) VALUES
	('ADM', 'Paulo', '453.545.030-78', '*****'),
    ('SuperADM', 'Carlos', '046.736.000-61', '**************'),
    ('Normal', 'João', '673.865.700-58', '*********');
    
select * from cogumelo;
select * from sensor;
select * from usuarios;
select * from registros;
    
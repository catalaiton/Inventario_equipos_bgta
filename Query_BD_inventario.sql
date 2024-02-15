/*crear y usar BD*/
CREATE DATABASE inventario_equipos;
USE inventario_equipos;

/*crear tabla sede y llamar todo para comprobar*/
CREATE TABLE sede (
	codigo int not null auto_increment,
    nombre varchar(50) not null,
    ciudad varchar(50) not null,
    direccion varchar (100),
    resp_sede varchar(100),
    PRIMARY KEY (codigo)
);

select * from sede;

/*crear tabla equipo y llamar todo para comprobar*/

CREATE TABLE equipo(
	serial_equipo varchar(50) not null,
	n_maquina varchar(50),
    estado varchar(50),
    propiedad varchar(50),
    contrato int not null,
    marca Varchar(50),
    orden_interna int,
    cuenta int,
    modelo varchar(50),
    linea_marca varchar(50),
    procesador varchar(50),
    disco varchar(50),
    memoria varchar(50),
    software_ad varchar(50),
    tipo_equipo varchar(50),
    f_activacion date,
    f_finalizacion date,
    f_entrega date,
    doc_usuarioant int,
    cod_sede int,
    primary key (serial_equipo),
    foreign key(cod_sede) references sede(codigo)
);

select * from equipo;

/*crear tabla analista y llamar todo para comprobar*/

CREATE TABLE analista (
	documento int not null,
    nombre Varchar(100) not null,
    cod_sede int,
    primary key(documento),
    foreign key (cod_sede) references sede(codigo)
);

select * from analista;

/*crear tabla acta y llamar todo para comprobar*/

CREATE TABLE acta (
	num_acta int not null,
    fecha date not null,
    hora time,
    ser_equipo varchar(50),
    doc_analista int,
    primary key(num_acta),
    foreign key(ser_equipo) references equipo(serial_equipo),
    foreign key(doc_analista) references analista(documento)
);

select * from acta;

/*crear tabla usuario y llamar todo para comprobar*/

CREATE TABLE usuario(
	documento int not null,
    nombre varchar(100) not null,
    cargo varchar(100) not null,
    area varchar(50),
    ser_equipo varchar(50),
    primary key(documento),
    foreign key(ser_equipo) references equipo(serial_equipo)
);

select * from usuario;

/*crear tabla periferico y llamar todo para comprobar*/

CREATE TABLE periferico(
	serial_periferico int not null,
    tipo varchar(50) not null,
    marca varchar(50),
    ser_equipo varchar(50),
    primary key (serial_periferico),
    foreign key (ser_equipo) references equipo(serial_equipo)
);

select * from periferico;
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
    maleta varchar(10),
    guaya varchar(10),
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
    ser_equipo varchar(20),
    primary key(documento),
    foreign key (cod_sede) references sede(codigo),
    foreign key (ser_equipo) references equipo(serial_equipo)
);

select * from analista;

/*crear tabla acta y llamar todo para comprobar*/

CREATE TABLE acta (
	num_acta varchar(50) not null,
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
	serial_periferico varchar(50) not null,
    tipo varchar(50) not null,
    ser_equipo varchar(50),
    primary key (serial_periferico),
    foreign key (ser_equipo) references equipo(serial_equipo)
);

select * from periferico;

/* QUERY para obtener datos principales*/

SELECT 
	sede.nombre AS sede,
    equipo.*,
    usuario.nombre AS usuario_anterior,
    periferico.serial_periferico, periferico.tipo,
    acta.num_acta, acta.fecha, acta.hora,
    analista.documento AS doc_analista, analista.nombre AS nombre_analista,
    usuario.documento AS doc_usuarioact,usuario.nombre AS usuario, usuario.cargo, usuario.area
FROM 
    equipo
INNER JOIN 
    usuario ON equipo.serial_equipo = usuario.ser_equipo
INNER JOIN 
    usuario AS usuario_ant ON equipo.doc_usuarioant = usuario.documento
INNER JOIN 
	sede ON equipo.cod_sede = sede.codigo
INNER JOIN
	acta ON equipo.serial_equipo = acta.ser_equipo
INNER JOIN
	analista ON equipo.serial_equipo = analista.ser_equipo
INNER JOIN
	periferico ON equipo.serial_equipo = periferico.ser_equipo;
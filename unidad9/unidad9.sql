DROP DATABASE IF EXISTS unidad8;

CREATE DATABASE IF NOT EXISTS unidad8
CHARACTER SET utf8mb4;

USE unidad8;

CREATE TABLE centro (
	codigo INTEGER PRIMARY KEY,
    nombre VARCHAR (150) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

CREATE TABLE departamento (
	codigo INTEGER PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    presupuesto DECIMAL(10, 2),
    codigo_centro INTEGER NOT NULL,
    FOREIGN KEY (codigo_centro) REFERENCES centro (codigo)
);

CREATE TABLE empleado (
	codigo INTEGER PRIMARY KEY,
    NIF CHAR(9) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100) NOT NULL,
    sueldo DECIMAL(10,2) NOT NULL,
    codigo_departamento INTEGER,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);



CREATE TABLE genero (
	id_genero INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE pelicula (
	id_pelicula INTEGER PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_genero INTEGER,
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
);


INSERT INTO centro VALUES 
    (1, 'Sede Central', 'C/Pedro Jover, 14'),
    (2, 'Filial 1', 'C/Relampaguito, 18'),
    (3, 'Filial 51', 'Markovia');

INSERT INTO departamento VALUES
    (1, 'Desarrollo', 120000, 1),
    (2, 'Sistemas', 150000, 1),
    (3, 'Recursos Humanos', 280000, 2),
    (4, 'Asuntos reservados', 99999999, 3),
    (5, 'Ventas', 230000, 1),
    (6, 'Atención al público', 20000, 1),
    (7, 'Exteriores', 430000, 2),
    (8, 'Prospección', 321000, 3),
    (9, 'Contabilidad', 231000, 1),
    (10, 'Inversiones', 312000, 2);
    
    
INSERT INTO empleado VALUES
	(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 25000, 1),
	(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 32000,2),
	(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 19000, 3),
	(4, '65803241L', 'Amancio', 'Ortega', 'Gaona', 100000, NULL),
	(5, '89921431D', 'Soledad', 'Villamil', 'Pèrez', 33000, 3),
	(6, '67832152Z', 'Mirella', 'Pascual', 'García', 19500, 2),
	(7, '67234982M', 'Rafael', 'Guillén', 'Vicente', 27000, 1),
	(8, '65434531H', 'Manuel', 'Méndez', 'Lozano', 14000, 2),
	(9, '78612387P', 'Virginia', 'Díaz', 'Rodríguez', 32000, 3),
	(10, '23145667F', 'Carlos', 'Irwin', 'Estévez', 29000, 2),
	(11, '43123212G', 'María', 'Fernández de Cámara', 'Pita', 38000, 1);
    
    
INSERT INTO genero VALUES
    (1, 'Bélico'),
    (2, 'Comedia'),
    (3, 'Ciencia-Ficción');
    
INSERT INTO pelicula VALUES 
    (1, 'Salvar al soldado Ryan', 1),
    (2, 'Blade Runner', 3),
    (3, 'Aliens', 3),
    (4, 'Cube', NULL);
    

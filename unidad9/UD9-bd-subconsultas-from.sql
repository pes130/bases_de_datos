SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS unidad9_anexo;
CREATE DATABASE unidad9_anexo CHARACTER SET utf8mb4;

USE unidad9_anexo;

CREATE TABLE alumno (    
    id INT UNSIGNED PRIMARY KEY,    
    nombre VARCHAR(100) NOT NULL,    
    apellido1 VARCHAR(100) NOT NULL,    
    apellido2 VARCHAR(100),    
    fecha_nacimiento DATE NOT NULL,    
    es_repetidor ENUM('sí', 'no') DEFAULT 'no',    
    telefono VARCHAR(9)
);

CREATE TABLE ciclo (
	id INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    codigo VARCHAR(10) NOT NULL
);

CREATE TABLE modulo (
	id INT UNSIGNED PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ects INT NOT NULL,
    curso ENUM('1', '2') NOT NULL,
    ciclo_id INT UNSIGNED,
    FOREIGN KEY(ciclo_id) REFERENCES ciclo(id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE curso_academico (
	id INT UNSIGNED PRIMARY KEY,
    anyo_inicio INT NOT NULL,
    anyo_fin INT NOT NULL
);

CREATE TABLE matricula (
	id INT UNSIGNED PRIMARY KEY,
    id_alumno INT UNSIGNED,
    id_modulo INT UNSIGNED,
    id_curso INT UNSIGNED,
    FOREIGN KEY (id_alumno) REFERENCES alumno (id)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (id_modulo) REFERENCES modulo (id)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT,
	FOREIGN KEY (id_curso) REFERENCES curso_academico (id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE instituto (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

-- Inserciones de alumnos
INSERT INTO alumno VALUES(1, 'María', 'Sánchez', 'Pérez', '1990/12/01', 'no', NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega', '1998/04/02', 'no', 618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea', '1988/01/03', 'no', NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega', '1993/06/13', 'sí', 678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López', '1995/11/24', 'no', 692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez', '1991/03/28', 'sí', NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández', 'Ramírez', '1996/09/17', 'no', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega', '1994/05/20', 'sí', 612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez', 'Hernández', '1999/07/08', 'no', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz', '1998/02/03', 'no', NULL);

INSERT INTO ciclo VALUES (1, 'Sistemas microinformáticos y redes', 'SMR');
INSERT INTO ciclo VALUES (2, 'Administración de Sistemas Informáticos y Redes', 'ASIR');
INSERT INTO ciclo VALUES (3, 'Desarrollo de Aplicaciones Multiplataforma', 'DAM');
INSERT INTO ciclo VALUES (4, 'Desarrollo de Aplicaciones Web', 'DAW');

INSERT INTO modulo VALUES(1, 'BD', 'Bases de Datos', 128, '1', 4);
INSERT INTO modulo VALUES(2, 'LMSGI', 'Lenguajes de marcas y sistemas de gestión de información', 128, '1', 4);
INSERT INTO modulo VALUES(3, 'ED', 'Entornos de Desarrollo', 128, '1', 4);
INSERT INTO modulo VALUES(4, 'PRO', 'Programación', 128, '1', 4);

INSERT INTO curso_academico VALUES (1, 2017, 2018);
INSERT INTO curso_academico VALUES (2, 2018, 2019);
INSERT INTO curso_academico VALUES (3, 2019, 2020);

INSERT INTO matricula VALUES
	(1, 1, 1, 3),
    (2, 1, 2, 3),
    (3, 1, 3, 3),
    (4, 2, 1, 3),
    (5, 2, 2, 3),
    (6, 2, 3, 3),
    (7, 3, 1, 3),
    (8, 3, 2, 3),
    (9, 3, 3, 3),
    (10, 4, 1, 2),
    (11, 4, 2, 2),
    (12, 4, 3, 2),
    (13, 5, 1, 2),
    (14, 5, 2, 2),
    (15, 5, 3, 2),
    (16, 6, 1, 2),
    (17, 6, 2, 2),
    (18, 6, 3, 2),
    (19, 1, 4, 3),
    (20, 2, 4, 3),
    (21, 3, 4, 3);


SET FOREIGN_KEY_CHECKS = 1;
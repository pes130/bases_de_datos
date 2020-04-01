DROP DATABASE IF EXISTS unidad11tx;
CREATE DATABASE unidad11tx CHARACTER SET utf8mb4;

USE unidad11tx;

CREATE TABLE cliente (
	id INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    puntos INT UNSIGNED DEFAULT 0
);

CREATE TABLE producto (
	id INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(8, 2) NOT NULL,
    stock INT UNSIGNED DEFAULT 0
);

CREATE TABLE pedido (
	id INT UNSIGNED PRIMARY KEY,
    fecha DATETIME,
    cliente_id INT UNSIGNED,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE detalle_pedido (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cantidad INT UNSIGNED DEFAULT 0,
    precio_unitario DECIMAL(8, 2) NOT NULL,
    pedido_id INT UNSIGNED,
    producto_id INT UNSIGNED,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE registro_contable (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME,
    tipo ENUM('ingreo', 'gasto'),
    total DECIMAL(8, 2) NOT NULL
);

INSERT INTO cliente VALUES 
	(1, 'Troy', 'Barlow', 0),
	(2, 'Conrad', 'Vig', 0),
    (3, 'Walter', 'Wogeman', 0),
    (4, 'Chief', 'Elgin', 0),
    (5, 'Archie', 'Gates', 0);
    
INSERT INTO producto VALUES 
	(1, 'Mermelada de fresa', 2, 100),
    (2, 'Mermelada de naranja', 2.3, 100),
    (3, 'Mermelada de arándonos', 2.5, 100),
    (4, 'Mermelada de tomate', 1.8, 100);
	
    
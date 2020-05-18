DROP DATABASE IF EXISTS tiendaPython;
CREATE DATABASE tiendaPython CHARACTER SET utf8mb4;

USE tiendaPython;

CREATE TABLE fabricante (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL,
    codigo_fabricante INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(NULL, 'Asus');
INSERT INTO fabricante VALUES(NULL, 'Lenovo');
INSERT INTO fabricante VALUES(NULL, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(NULL, 'Samsung');
INSERT INTO fabricante VALUES(NULL, 'Seagate');
INSERT INTO fabricante VALUES(NULL, 'Crucial');
INSERT INTO fabricante VALUES(NULL, 'Gigabyte');
INSERT INTO fabricante VALUES(NULL, 'Huawei');
INSERT INTO fabricante VALUES(NULL, 'Xiaomi');


INSERT INTO producto VALUES(NULL, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(NULL, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(NULL, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(NULL, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(NULL, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(NULL, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(NULL, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(NULL, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(NULL, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(NULL, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(NULL, 'Impresora HP Laserjet Pro M26nw', 180, 3);
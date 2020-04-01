use unidad11tx;
/**********************
* Transacción exitosa *
***********************/

START TRANSACTION;
-- Insertamos el pedido
INSERT INTO pedido
	VALUES (1, now(), 1);
    
-- Insertamos los detalles del producto
INSERT INTO detalle_pedido VALUES 
	(DEFAULT, 2, 2.0, 1, 1),
    (DEFAULT, 1, 2.3, 1, 2);
    
-- Actualizamos los puntos del cliente
UPDATE cliente
SET puntos = puntos + 20
WHERE id = 1;

-- Añadimos registro contable
INSERT INTO registro_contable
VALUES (default, now(), 'ingreso', 6.3);
    
-- Aceptamos la transacción
COMMIT;

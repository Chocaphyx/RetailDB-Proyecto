-- Funciones 
-- Funcion para obtener el stock de un producto por tiendas
CREATE OR REPLACE FUNCTION stock_total_producto(p_id_producto INT)
RETURNS INT AS $$
DECLARE
    total_stock INT;
BEGIN
    SELECT SUM(stock_actual)
    INTO total_stock
    FROM inventario_tienda
    WHERE id_producto = p_id_producto;

    RETURN COALESCE(total_stock, 0);
END;
$$ LANGUAGE plpgsql;
SELECT stock_total_producto(2);
select*FROM inventario_tienda



-- Obtener la cantidad de ventas de un cliente
CREATE OR REPLACE FUNCTION ventas_cliente(p_id_cliente INT)
RETURNS INT AS $$
DECLARE
    total_ventas INT;
BEGIN
    SELECT COUNT(*)
    INTO total_ventas
    FROM ventas
    WHERE cliente_id = p_id_cliente;

    RETURN COALESCE(total_ventas, 0);
END;
$$ LANGUAGE plpgsql;
SELECT ventas_cliente(1);





-- Procedimientos almacenados
-- Cambiar estado de un producto false o true
CREATE OR REPLACE PROCEDURE cambiar_estado_producto(p_id_producto INT, p_estado BOOLEAN)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE productos
    SET estado = p_estado
    WHERE id_producto = p_id_producto;
END;
$$;
CALL cambiar_estado_producto(2, true);  
select * from productos



-- Registrar un movimiento en el inventario
CREATE OR REPLACE PROCEDURE registrar_movimiento(
    p_id_producto INT,
    p_cantidad INT,
    p_tipo_movimiento VARCHAR,
    p_usuario_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO movimientos_inventario (tipo_movimiento, id_producto, cantidad, usuario_id)
    VALUES (p_tipo_movimiento, p_id_producto, p_cantidad, p_usuario_id);

    -- Validar si el tipo de movimiento es ingreso o egreso
    IF p_tipo_movimiento = 'ingreso' THEN
        UPDATE inventario_tienda
        SET stock_actual = stock_actual + p_cantidad
        WHERE id_producto = p_id_producto;
    ELSIF p_tipo_movimiento = 'egreso' THEN
        UPDATE inventario_tienda
        SET stock_actual = stock_actual - p_cantidad
        WHERE id_producto = p_id_producto;
    END IF;
END;
$$;
CALL registrar_movimiento(1, 10, 'ingreso', 2);
SELECT * FROM inventario_tienda


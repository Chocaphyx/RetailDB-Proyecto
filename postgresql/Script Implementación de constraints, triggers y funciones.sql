-- Constraints
-- Asegura que el precio de venta siempre sea mayor al de compra
ALTER TABLE productos
ADD CONSTRAINT chk_precios CHECK (precio_venta > precio_compra);

-- El stock no puede ser negativo
ALTER TABLE inventario_tienda
ADD CONSTRAINT chk_stock CHECK (stock_actual >= 0 AND stock_reservado >= 0);





-- FUNCIONES
-- Calcular el total de una venta
CREATE OR REPLACE FUNCTION calcular_total_venta(p_id_venta INT)
RETURNS MONEY AS $$
DECLARE
    total MONEY;
BEGIN
    SELECT SUM(subtotal) INTO total
    FROM detalle_venta
    WHERE id_venta = p_id_venta;

    UPDATE ventas
    SET total = COALESCE(total, 0)
    WHERE id_venta = p_id_venta;

    RETURN total;
END;
$$ LANGUAGE plpgsql;
SELECT calcular_total_venta(1);

-- Verificar stock antes de una venta
CREATE OR REPLACE FUNCTION verificar_stock(p_id_producto INT, p_cantidad INT)
RETURNS BOOLEAN AS $$
DECLARE
    disponible INT;
BEGIN
    SELECT stock_actual INTO disponible
    FROM inventario_tienda
    WHERE id_producto = p_id_producto
    LIMIT 1;

    IF disponible IS NULL OR disponible < p_cantidad THEN
        RETURN FALSE; -- no hay stock suficiente
    END IF;
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;
SELECT verificar_stock(1, 5); 




-- Triggers
-- Actualizar stock después de una venta
CREATE OR REPLACE FUNCTION actualizar_stock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE inventario_tienda
    SET stock_actual = stock_actual - NEW.cantidad,
        ultima_actualizacion = CURRENT_TIMESTAMP
    WHERE id_producto = NEW.id_producto
      AND id_tienda = (SELECT tienda_id FROM ventas WHERE id_venta = NEW.id_venta);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_actualizar_stock
AFTER INSERT ON detalle_venta
FOR EACH ROW
EXECUTE FUNCTION actualizar_stock();
SELECT stock_actual FROM inventario_tienda WHERE id_producto = 1 AND id_tienda = 1;
-- Insertar un producto en la venta
-- Supongamos que la venta 1 ya tiene el producto 1
UPDATE detalle_venta
SET cantidad = cantidad + 2  -- agregamos 2 más
WHERE id_venta = 1 AND id_producto = 1;
select * from detalle_venta


-- Registrar cambios de precio en la auditoría
CREATE OR REPLACE FUNCTION auditar_precios()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.precio_venta <> OLD.precio_venta THEN
        INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, usuario_id)
        VALUES (OLD.id_producto, OLD.precio_venta, NEW.precio_venta, 1); 
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_auditar_precios
AFTER UPDATE OF precio_venta ON productos
FOR EACH ROW
EXECUTE FUNCTION auditar_precios();
SELECT * FROM auditoria_precios;
-- Cambiar el precio de un producto
UPDATE productos
SET precio_venta = 3600.00
WHERE id_producto = 1;
-- Verificar
SELECT * FROM auditoria_precios WHERE id_producto = 1;



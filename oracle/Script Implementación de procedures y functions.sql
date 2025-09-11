CREATE OR REPLACE PROCEDURE registrar_cliente (
    p_nombre      VARCHAR2,
    p_apellidos   VARCHAR2,
    p_dni         CHAR,
    p_email       VARCHAR2,
    p_telefono    VARCHAR2
) AS
BEGIN
    INSERT INTO clientes (nombre, apellidos, dni, email, telefono, fecha_registro)
    VALUES (p_nombre, p_apellidos, p_dni, p_email, p_telefono, SYSDATE);
END;
/
-- Probamos el procedimiento:
BEGIN
    registrar_cliente(
        p_nombre    => 'Kenji',
        p_apellidos => 'Choca',
        p_dni       => '12345678',
        p_email     => 'kenji@example.com',
        p_telefono  => '987654321'
    );
END;
/
select * from clientes





-- Función que devuelve el stock disponible de un producto
CREATE OR REPLACE FUNCTION obtener_stock (p_id_producto NUMBER)
RETURN NUMBER IS
    v_stock NUMBER;
BEGIN
    SELECT stock_actual - stock_reservado
    INTO v_stock
    FROM inventario_tienda
    WHERE id_producto = p_id_producto
    FETCH FIRST 1 ROWS ONLY;

    RETURN v_stock;
END;
/
-- Probamos la función:
SELECT obtener_stock(1) AS stock_disponible
FROM dual;
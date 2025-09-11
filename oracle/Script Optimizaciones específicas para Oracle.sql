-- Índice compuesto para búsquedas rápidas en inventario:
-- Su función principal es mejorar el rendimiento de las consultas al acelerar la 
-- recuperación de datos cuando se filtran o ordenan utilizando combinación de esas columnas en la cláusula WHERE o ORDER BY
CREATE INDEX idx_inventario_tienda_producto 
ON inventario_tienda (id_tienda, id_producto);

-- Índice Bitmap para columna con pocos valores (ejemplo estado = 1 o 0):
-- aceleran las consultas para tablas con pocos valores distintos (baja cardinalidad) 
-- y en entornos de almacén de datos, mediante el uso de mapas de bits que representan la presencia de un valor de fila mediante un bit activado o desactivado
CREATE BITMAP INDEX idx_producto_estado 
ON productos (estado);



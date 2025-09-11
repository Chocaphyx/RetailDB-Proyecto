--Top 10 productos más vendidos por tienda
SELECT p.nombre, SUM(dv.cantidad) AS total_vendido, t.nombre AS tienda
FROM detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto
JOIN ventas v ON dv.id_venta = v.id_venta
JOIN tiendas t ON v.tienda_id = t.id_tienda
GROUP BY p.nombre, t.nombre
ORDER BY total_vendido DESC
LIMIT 10;

--Reporte de ventas mensuales por empleado
SELECT e.nombre, EXTRACT(MONTH FROM v.fecha_venta) AS mes, SUM(v.total) AS total_ventas
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id_empleado
GROUP BY e.nombre, mes
ORDER BY mes;

--Consulta para obtener el total de ventas por tienda
SELECT 
    t.nombre AS tienda,
    SUM(v.total) AS total_ventas
FROM 
    ventas v
JOIN 
    tiendas t ON v.tienda_id = t.id_tienda
GROUP BY 
    t.nombre;


--Análisis de rentabilidad por categoría de producto
SELECT c.nombre AS categoria, 
       SUM(p.precio_venta - p.precio_compra) AS rentabilidad
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre;


--Historial de movimientos de un producto específico
SELECT m.tipo_movimiento, m.cantidad, m.fecha, e.nombre AS empleado
FROM movimientos_inventario m
JOIN empleados e ON m.usuario_id = e.id_empleado
WHERE m.id_producto = 1  
ORDER BY m.fecha;


--Ranking de clientes por volumen de compras
SELECT c.nombre, c.apellidos, SUM(v.total) AS total_compras
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id_cliente
GROUP BY c.nombre, c.apellidos
ORDER BY total_compras DESC
LIMIT 10;


--Proyección de restock basada en ventas históricas
SELECT p.nombre, SUM(dv.cantidad) AS total_vendido, (p.stock_minimo - SUM(dv.cantidad)) AS proyeccion_restock
FROM detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto
GROUP BY p.nombre, p.stock_minimo
ORDER BY proyeccion_restock DESC;


--Análisis de performance de empleados por tienda
SELECT t.nombre AS tienda, e.nombre, COUNT(v.id_venta) AS ventas_realizadas
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id_empleado
JOIN tiendas t ON v.tienda_id = t.id_tienda
GROUP BY t.nombre, e.nombre
ORDER BY ventas_realizadas DESC;


--Reporte de productos sin movimiento en últimos 90 días
SELECT p.nombre
FROM productos p
LEFT JOIN movimientos_inventario m ON p.id_producto = m.id_producto
WHERE m.fecha IS NULL OR m.fecha < NOW() - INTERVAL '90 days';




-- Creación de usuarios
-- Usuario administrador 
CREATE ROLE admin_techstore LOGIN PASSWORD 'admin123';
-- Usuario para ventas
CREATE ROLE vendedor_techstore LOGIN PASSWORD 'vendedor123';
-- Usuario para inventario
CREATE ROLE inventario_techstore LOGIN PASSWORD 'inventario123';
-- Usuario de solo lectura para reportes
CREATE ROLE reporte_techstore LOGIN PASSWORD 'reporte123'

-- Asignamos permisos al admin
GRANT ALL PRIVILEGES ON DATABASE techstore TO admin_techstore;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_techstore;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_techstore;

-- Asignamos permisos al vendedor
GRANT SELECT ON productos, clientes, tiendas TO vendedor_techstore;
GRANT INSERT, SELECT ON ventas, detalle_venta TO vendedor_techstore;

-- Asignamos permisos al usuario de inventario
GRANT SELECT, UPDATE ON productos, inventario_tienda TO inventario_techstore;
GRANT INSERT, SELECT ON movimientos_inventario TO inventario_techstore;

-- Asignamos permisos al usuario de reporte
GRANT SELECT ON ALL TABLES IN SCHEMA PUBLIC TO reporte_techstore


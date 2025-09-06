INSERT INTO categorias (nombre, descripcion, estado) VALUES
('Laptops', 'Computadoras portátiles de diversas marcas', TRUE),
('Smartphones', 'Teléfonos inteligentes Android e iOS', TRUE),
('Tablets', 'Tablets y dispositivos híbridos', TRUE),
('Accesorios', 'Fundas, cargadores, cables y más', TRUE),
('Monitores', 'Pantallas LED, IPS y gaming', TRUE),
('Almacenamiento', 'Discos duros, SSD y memorias USB', TRUE),
('Periféricos', 'Teclados, mouse, audífonos', TRUE),
('Impresoras', 'Impresoras y multifuncionales', TRUE),
('Redes', 'Routers, switches y repetidores WiFi', TRUE),
('Software', 'Licencias y suscripciones digitales', TRUE);

INSERT INTO productos (nombre, descripcion, id_categoria, precio_compra, precio_venta, stock_minimo, estado) VALUES
('Laptop Lenovo ThinkPad X1', 'Laptop empresarial con procesador Intel i7', 1, 3500.00, 4500.00, 5, TRUE),
('Laptop HP Pavilion 15', 'Laptop para estudiantes con Ryzen 5', 1, 2800.00, 3500.00, 5, TRUE),
('Laptop Dell XPS 13', 'Laptop ultrabook premium', 1, 4000.00, 5200.00, 5, TRUE),
('iPhone 14 Pro Max', 'Smartphone Apple última generación', 2, 4500.00, 5500.00, 10, TRUE),
('Samsung Galaxy S23', 'Smartphone gama alta Samsung', 2, 3800.00, 4800.00, 8, TRUE),
('Xiaomi Redmi Note 12', 'Smartphone gama media Xiaomi', 2, 800.00, 1200.00, 15, TRUE),
('iPad Air 5', 'Tablet Apple 10.9 pulgadas', 3, 2200.00, 3000.00, 6, TRUE),
('Samsung Galaxy Tab S8', 'Tablet Android con S-Pen', 3, 1800.00, 2600.00, 6, TRUE),
('Kindle Paperwhite', 'E-reader con luz frontal', 3, 400.00, 600.00, 10, TRUE),
('Cargador USB-C 65W', 'Cargador universal para laptops y móviles', 4, 80.00, 150.00, 20, TRUE),
('Cable HDMI 2m', 'Cable de alta velocidad para video 4K', 4, 20.00, 45.00, 30, TRUE),
('Mouse Logitech G502', 'Mouse gamer con RGB', 7, 120.00, 220.00, 15, TRUE),
('Teclado Mecánico HyperX', 'Teclado gamer con switches rojos', 7, 180.00, 300.00, 15, TRUE),
('Auriculares Sony WH-1000XM5', 'Audífonos con cancelación de ruido', 7, 800.00, 1200.00, 10, TRUE),
('SSD Kingston 1TB', 'Unidad de estado sólido NVMe', 6, 250.00, 420.00, 10, TRUE),
('HDD Seagate 2TB', 'Disco duro externo portátil', 6, 180.00, 300.00, 10, TRUE),
('Monitor LG UltraGear 27"', 'Monitor gamer 144Hz', 5, 900.00, 1300.00, 5, TRUE),
('Monitor Samsung Odyssey 32"', 'Monitor curvo QHD', 5, 1200.00, 1700.00, 5, TRUE),
('Router TP-Link AX1800', 'Router WiFi 6 de alta velocidad', 9, 300.00, 500.00, 10, TRUE),
('Switch Cisco 24P', 'Switch administrable 24 puertos', 9, 2000.00, 3000.00, 2, TRUE),
('Impresora HP DeskJet 2720', 'Impresora multifuncional', 8, 400.00, 650.00, 6, TRUE),
('Impresora Epson EcoTank', 'Impresora de tanques de tinta', 8, 900.00, 1400.00, 6, TRUE),
('Windows 11 Pro', 'Licencia original', 10, 300.00, 600.00, 50, TRUE),
('Office 365', 'Suscripción anual', 10, 200.00, 400.00, 50, TRUE),
('Antivirus Kaspersky', 'Licencia por 1 año', 10, 80.00, 150.00, 50, TRUE),
('Laptop Acer Nitro 5', 'Laptop gamer Ryzen 7 + RTX 3060', 1, 3500.00, 4800.00, 5, TRUE),
('Smartwatch Apple Watch 8', 'Reloj inteligente Apple', 2, 1500.00, 2200.00, 10, TRUE),
('Smartwatch Samsung Galaxy Watch 5', 'Reloj inteligente Samsung', 2, 1200.00, 1900.00, 10, TRUE),
('Tablet Huawei MatePad', 'Tablet Android con pantalla 2K', 3, 1000.00, 1600.00, 6, TRUE),
('SSD Samsung EVO 2TB', 'Unidad de estado sólido rápida', 6, 500.00, 800.00, 10, TRUE);

INSERT INTO proveedores (nombre, contacto, telefono, email, direccion) VALUES
('Lenovo Perú', 'Carlos Ramírez', '987654321', 'carlos@lenovo.com', 'Av. Javier Prado 123, Lima'),
('HP Perú', 'María López', '912345678', 'maria@hp.com', 'Av. La Marina 456, Lima'),
('Dell Perú', 'Jorge Pérez', '923456789', 'jorge@dell.com', 'Av. Angamos 789, Lima'),
('Apple Perú', 'Ana Torres', '934567890', 'ana@apple.com', 'Av. Primavera 101, Lima'),
('Samsung Perú', 'Luis Fernández', '945678901', 'luis@samsung.com', 'Av. Universitaria 234, Lima'),
('Xiaomi Perú', 'Pedro Morales', '956789012', 'pedro@xiaomi.com', 'Av. Brasil 567, Lima'),
('Kingston Perú', 'Sofía García', '967890123', 'sofia@kingston.com', 'Av. Arequipa 890, Lima'),
('Epson Perú', 'Raúl Medina', '978901234', 'raul@epson.com', 'Av. Grau 345, Arequipa'),
('Cisco Perú', 'Elena Vargas', '989012345', 'elena@cisco.com', 'Av. Salaverry 678, Lima'),
('Microsoft Perú', 'Fernando Castro', '990123456', 'fernando@microsoft.com', 'Av. Larco 987, Trujillo');

INSERT INTO productos_proveedores (id_producto, id_proveedor) VALUES
(1, 1), (1, 2),
(2, 1), (2, 3),
(3, 2), (3, 4),
(4, 2), (4, 5),
(5, 3), (5, 6),
(6, 7), (6, 8),
(7, 9), (7, 10),
(8, 3), (8, 7),
(9, 4), (9, 8),
(10, 5), (10, 6),
(11, 2), (11, 7),
(12, 1), (12, 10),
(13, 6), (13, 9),
(14, 3), (14, 8),
(15, 4), (15, 9);

INSERT INTO tiendas (nombre, direccion, ciudad, telefono) VALUES
('TechStore Lima Centro', 'Av. Abancay 1234', 'Lima', '998133000'),
('TechStore San Isidro', 'Av. Javier Prado 567', 'Lima', '923124567'),
('TechStore Miraflores', 'Av. Larco 890', 'Lima', '932124567'),
('TechStore La Molina', 'Av. La Molina 456', 'Lima', '973123456'),
('TechStore San Miguel', 'Av. Universitaria 234', 'Lima', '982111111'),
('TechStore Surco', 'Av. Benavides 678', 'Lima', '988333444'),
('TechStore Callao', 'Av. Colonial 123', 'Lima', '966487465')

INSERT INTO inventario_tienda (id_tienda, id_producto, stock_actual, stock_reservado) VALUES
(1, 1, 20, 2),
(1, 2, 15, 1),
(1, 3, 30, 5),
(1, 4, 25, 3),
(1, 5, 18, 2),
(1, 6, 40, 4),
(1, 7, 50, 6),
(1, 8, 35, 2),
(1, 9, 22, 1),
(1, 10, 27, 3),

(2, 1, 10, 1),
(2, 2, 12, 2),
(2, 3, 20, 2),
(2, 4, 18, 1),
(2, 5, 14, 2),
(2, 6, 30, 3),
(2, 7, 40, 5),
(2, 8, 25, 2),
(2, 9, 15, 1),
(2, 10, 20, 2);

INSERT INTO clientes (nombre, apellidos, dni, email, telefono, fecha_registro) VALUES
('Carlos', 'Ramírez López', '12345678', 'carlos.ramirez@example.com', '987654321', '2025-01-15'),
('María', 'Fernández Ruiz', '87654321', 'maria.fernandez@example.com', '912345678', '2025-02-20'),
('José', 'Torres Huamán', '45678912', 'jose.torres@example.com', '998877665', '2025-03-10'),
('Lucía', 'Castillo Paredes', '78912345', 'lucia.castillo@example.com', '987112233', '2025-04-05'),
('Andrés', 'Mendoza Quispe', '11223344', 'andres.mendoza@example.com', '955667788', '2025-05-02');

INSERT INTO empleados (nombre, apellidos, dni, cargo, tienda_id, fecha_ingreso) VALUES
('Juan', 'Pérez García', '44556677', 'Vendedor', 1, '2024-05-01'),
('Sofía', 'Martínez Díaz', '55667788', 'Administrador', 2, '2023-11-10'),
('Diego', 'Gómez Torres', '66778899', 'Soporte Técnico', 3, '2024-01-20'),
('Ana', 'Reyes Vargas', '77889900', 'Cajera', 1, '2024-07-15'),
('Luis', 'Flores Ramos', '88990011', 'Gerente', 4, '2021-09-30');

INSERT INTO ventas (fecha_venta, cliente_id, empleado_id, tienda_id, total, estado) VALUES
('2024-06-10 10:30:00', 1, 1, 1, 3500.00, 'PAGADA'),
('2024-06-12 15:45:00', 2, 2, 2, 2400.00, 'PAGADA'),
('2024-06-15 18:20:00', 3, 3, 3, 1500.00, 'ANULADA'),
('2024-06-18 11:10:00', 4, 4, 1, 500.00, 'PAGADA'),
('2024-06-20 16:00:00', 5, 5, 4, 8200.00, 'PENDIENTE');

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 3500.00),
(2, 2, 2, 1200.00),
(3, 3, 1, 1500.00),
(4, 5, 5, 100.00),
(5, 4, 4, 2050.00);

INSERT INTO movimientos_inventario (tipo_movimiento, id_producto, cantidad, usuario_id) VALUES
('ENTRADA', 1, 50, 1),
('SALIDA', 2, 10, 2),
('ENTRADA', 3, 30, 3),
('SALIDA', 5, 5, 4),
('ENTRADA', 4, 20, 5);

INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, usuario_id) VALUES
(1, 3300.00, 3500.00, 1),
(2, 1100.00, 1200.00, 2),
(3, 1400.00, 1500.00, 3),
(4, 2000.00, 2050.00, 4),
(5, 90.00, 100.00, 5);





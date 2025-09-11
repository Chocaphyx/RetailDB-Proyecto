-- Tabla de ventas particionada por rango de fechas:
-- Su función es dividir las tablas, índices u otros objetos en fragmentos más pequeños y manejables llamados particiones, que son subtablas independientes con sus propias características de almacenamiento. 
-- Esta técnica mejora el rendimiento al permitir operaciones dirigidas a subconjuntos de datos, 
-- simplifica la administración de grandes volúmenes de información y aumenta la disponibilidad al permitir el mantenimiento a nivel de partición en lugar de afectar la tabla completa. 
CREATE TABLE ventas_particionadas (
    id_venta      NUMBER PRIMARY KEY,
    fecha_venta   DATE NOT NULL,
    cliente_id    NUMBER,
    empleado_id   NUMBER,
    tienda_id     NUMBER,
    total         NUMBER(10,2),
    estado        VARCHAR2(20)
)
PARTITION BY RANGE (fecha_venta)
(
    PARTITION ventas_2023 VALUES LESS THAN (TO_DATE('01-01-2024','DD-MM-YYYY')),
    PARTITION ventas_2024 VALUES LESS THAN (TO_DATE('01-01-2025','DD-MM-YYYY')),
    PARTITION ventas_2025 VALUES LESS THAN (TO_DATE('01-01-2026','DD-MM-YYYY'))
);
-- Vemos las particiones:
SELECT table_name, partitioning_type, partition_count
FROM user_part_tables
WHERE table_name = 'VENTAS_PARTICIONADAS';

-- Este registro irá a la partición 'ventas_2024'
INSERT INTO ventas_particionadas (id_venta, fecha_venta, cliente_id, total)
VALUES (2, TO_DATE('20-JUN-2024', 'DD-MON-YYYY'), 12, 750);
select * from clientes
-- Verificamos:
SELECT * FROM ventas_particionadas PARTITION (ventas_2024);

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    estado BOOLEAN DEFAULT TRUE
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    id_categoria INT NOT NULL REFERENCES categorias(id_categoria),
    precio_compra MONEY NOT NULL,
    precio_venta MONEY NOT NULL,
    stock_minimo INT DEFAULT 0,
    estado BOOLEAN DEFAULT TRUE
);

CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(200)
);

-- Relación muchos a muchos entre productos y proveedores
CREATE TABLE productos_proveedores (
    id_producto INT NOT NULL REFERENCES productos(id_producto),
    id_proveedor INT NOT NULL REFERENCES proveedores(id_proveedor),
    PRIMARY KEY (id_producto, id_proveedor)
);

CREATE TABLE tiendas (
    id_tienda SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    ciudad VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE inventario_tienda (
    id_tienda INT NOT NULL REFERENCES tiendas(id_tienda),
    id_producto INT NOT NULL REFERENCES productos(id_producto),
    stock_actual INT DEFAULT 0,
    stock_reservado INT DEFAULT 0,
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_tienda, id_producto)
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni CHAR(8) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni CHAR(8) UNIQUE NOT NULL,
    cargo VARCHAR(50),
    tienda_id INT NOT NULL REFERENCES tiendas(id_tienda),
    fecha_ingreso DATE DEFAULT CURRENT_DATE
);

-- Ahora gerente se controla desde empleados 
ALTER TABLE tiendas
    ADD COLUMN gerente_id INT,
    ADD CONSTRAINT fk_gerente FOREIGN KEY (gerente_id) REFERENCES empleados(id_empleado);

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cliente_id INT REFERENCES clientes(id_cliente),
    empleado_id INT REFERENCES empleados(id_empleado),
    tienda_id INT REFERENCES tiendas(id_tienda),
    total MONEY DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'PENDIENTE'
);

CREATE TABLE detalle_venta (
    id_venta INT NOT NULL REFERENCES ventas(id_venta) ON DELETE CASCADE,
    id_producto INT NOT NULL REFERENCES productos(id_producto),
    cantidad INT NOT NULL,
    precio_unitario MONEY NOT NULL,
    subtotal MONEY GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    PRIMARY KEY (id_venta, id_producto)
);

CREATE TABLE movimientos_inventario (
    id_movimiento SERIAL PRIMARY KEY,
    tipo_movimiento VARCHAR(50) NOT NULL, 
    id_producto INT NOT NULL REFERENCES productos(id_producto),
    cantidad INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL REFERENCES empleados(id_empleado)
);

CREATE TABLE auditoria_precios (
    id_auditoria SERIAL PRIMARY KEY,
    id_producto INT NOT NULL REFERENCES productos(id_producto),
    precio_anterior MONEY NOT NULL,
    precio_nuevo MONEY NOT NULL,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL REFERENCES empleados(id_empleado)
);

-- =====================================================
-- SECCIÓN 1: DROP TABLES
-- =====================================================
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
-- =====================================================
-- SECCIÓN 2: CREATE TABLES
-- =====================================================
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    activo BIT DEFAULT 1,
    CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria) 
        REFERENCES categorias(id_categoria)
);
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    fecha_venta DATE NOT NULL,
    CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) 
        REFERENCES clientes(id_cliente),
    CONSTRAINT fk_ventas_productos FOREIGN KEY (id_producto) 
        REFERENCES productos(id_producto)
);
-- =====================================================
-- SECCIÓN 3: INSERT DATA
-- =====================================================
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
(1, 'Audio', 'Auriculares, parlantes y micrófonos'),
(2, 'Computación', 'Notebooks, teclados y accesorios'),
(3, 'Smartphones', 'Celulares y smartwatches');
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
(1, 'Agustina Gómez', 'agustina@example.com', 'Buenos Aires', '2024-01-15'),
(2, 'Carlos Ruiz', 'carlos@example.com', 'Córdoba', '2024-02-10'),
(3, 'Mariana Lopez', 'mariana@example.com', 'Rosario', '2024-03-01');
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
(101, 'Auriculares Bluetooth Pro', 1, 85000.00, 25, 1),
(102, 'Teclado Mecánico RGB', 2, 62000.00, 15, 1),
(103, 'Notebook 15 pulgadas', 2, 750000.00, 8, 1),
(104, 'Smartwatch Deportivo', 3, 110000.00, 12, 1);
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, total, fecha_venta) VALUES
(1, 1, 101, 1, 85000.00, 85000.00, '2024-03-10'),
(2, 2, 102, 2, 62000.00, 124000.00, '2024-03-12'),
(3, 1, 104, 1, 110000.00, 110000.00, '2024-03-15'),
(4, 3, 103, 1, 750000.00, 750000.00, '2024-03-18');
-- =====================================================
-- SECCIÓN 4: VALIDACIÓN
-- =====================================================
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
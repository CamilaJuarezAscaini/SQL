CREATE SCHEMA mayorista2;
USE mayorista2;

-- CREACION DE TABLAS

CREATE TABLE empleados (
	id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE facturas (
	id_factura INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    total INT NOT NULL,
    id_cliente INT,
    id_empleado INT
);

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    dni VARCHAR (20) NOT NULL,
    telefono VARCHAR (20) NOT NULL
);

CREATE TABLE detalle_facturas (
	id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_factura INT,
    id_producto INT,
    cantidad INT NOT NULL,
    total INT NOT NULL
);


CREATE TABLE proveedores (
	id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (40) NOT NULL,
    telefono VARCHAR (20) NOT NULL,
    cuit VARCHAR (30) NOT NULL
);

CREATE TABLE productos (
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR (30) NOT NULL,
    costo NUMERIC NOT NULL,
    precio NUMERIC NOT NULL,
    stock INT NOT NULL,
    marca VARCHAR (40) NOT NULL,
    id_proveedor INT NOT NULL
);

CREATE TABLE auditoria_productos (
	id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    accion VARCHAR (15),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    costo DECIMAL (10,2)
);


-- CREACION DE RELACIONES

ALTER TABLE facturas
ADD CONSTRAINT fk_facturas_empleados
FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado);

ALTER TABLE facturas
ADD CONSTRAINT fk_facturas_clientes
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente);

ALTER TABLE detalle_facturas
ADD CONSTRAINT fk_detalle_facturas
FOREIGN KEY (id_factura) REFERENCES facturas (id_factura);

ALTER TABLE detalle_facturas
ADD CONSTRAINT fk_detalle_productos
FOREIGN KEY (id_producto) REFERENCES productos (id_producto);

ALTER TABLE productos
ADD CONSTRAINT fk_productos_proveedores
FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor);

ALTER TABLE detalle_facturas
ADD estado VARCHAR(15);

ALTER TABLE auditoria_productos
ADD CONSTRAINT fk_productos_auditoria
FOREIGN KEY (id_producto) REFERENCES productos (id_producto);

-- INSERCION DE DATOS EN LAS TABLAS

INSERT INTO empleados (nombre, telefono)
VALUES ('Diana Corbelan', '1133094477'),
	('Brian Perelto', '1545647765'),
    ('Jennifer Gonzales', '1121616750'),
    ('Zoe Huk', '1145678309');
    
    
INSERT INTO clientes (nombre, dni, telefono)
VALUES ('Leonardo Bogado', '27854677', '1567432389'),
	('Juan Pablo Perez', '33456788', '1132457899'),
    ('Manuel Martinez', '39888763', '1125645577'),
    ('Alejandra Garcia', '42675400', '1126547812'),
    ('Laura Barberon', '30678487', '1567637643');
    

INSERT INTO proveedores (nombre, telefono, cuit)
VALUES ('Modo barista', '43093766', '30238476331'),
	('cab', '1176654780', '30387675441'),
    ('Barista Space', '45658733', '31376566281'),
    ('Tienda del Barista', '1134847678', '30576287661');


INSERT INTO productos (descripcion, costo, precio, stock, marca, id_proveedor)
VALUES ('molino manual muelas ceramica', 50500, 64500, 15, 'Modo barista', 1),
	('balanza electronica', 60000, 70500, 12, 'Timermax', 1),
    ('balanza touch pro', 85360, 110000, 10, 'Timermax', 1),
    ('Jarra vidrio server', 49999, 60200, 25, 'Kalita', 1),
    ('Syrup vainilla', 10000, 14000, 100, 'Fusion', 2),
    ('Syrup avellana', 10000, 14000, 120, 'Fusion', 2),
    ('Salsa chocolate', 11000, 15000, 120, 'Fusion', 2),
    ('Balanza electronica', 200000, 260000, 20, 'Hario', 2),
    ('Pitcher tornasolada 660ml', 90000, 100000, 35, 'Barista Gear', 3),
    ('Pitcher titanio 350ml', 30000, 40000, 37, 'Barista Space', 3),
    ('Pitcher teflon negro 350ml', 35000, 45500, 40, 'Barista Space', 3),
    ('Aeropress', 86600, 110000, 24, 'Aeropress', 4),
    ('Chemex 3 tazas', 80000, 90000, 34,  'Chemex', 4),
    ('Chemex 6 tazas', 85000, 96000, 33, 'Chemex', 4),
	('kit v60', 80000, 91000, 33, 'Hario', 4);


    
INSERT INTO facturas (fecha, total, id_cliente, id_empleado)
VALUES ('2024-01-02', 132000, 1, 1),
	('2024-01-02', 91000, 2, 1),
    ('2024-01-02', 180000, 3, 3),
    ('2024-01-03', 174500, 4, 2),
    ('2024-01-03', 387000, 5, 4),
    ('2024-01-04', 110000, 5, 3),
	('2024-01-04', 140000, 2, 4),
    ('2024-01-05', 60200, 3, 1),
    ('2024-01-06', 356000, 4, 3),
    ('2024-01-06', 168000, 1, 2),
    ('2024-02-01', 45500, 2, 1),
	('2024-02-03', 70500, 5, 2),
    ('2024-02-03', 91000, 1, 1),
    ('2024-02-10', 64500, 2, 3);


INSERT INTO detalle_facturas (id_factura, id_producto, cantidad, total, estado)
VALUES (1, 6, 3, 42000, 'finalizado'),
	(1, 7, 6, 90000, 'finalizado'),
    (2, 15, 1, 91000, 'finalizado'),
    (3, 13, 2, 180000, 'finalizado'),
    (4, 1, 1, 64500, 'finalizado'),
    (4, 12, 1, 110000, 'finalizado'),
    (5, 12, 1, 11000, 'en proceso'),
    (5, 13, 1, 90000, 'en proceso'),
    (5, 14, 1, 96000, 'en proceso'),
    (5, 15, 1, 91000, 'en proceso'),
    (6, 3, 1, 110000, 'finalizado'),
	(7, 9, 1, 100000, 'finalizado'),
    (7, 10, 1, 40000, 'finalizado'),
    (8, 4, 1, 60200, 'finalizado'),
    (9, 14, 1, 96000, 'en proceso'),
    (9, 8, 1, 260000, 'en proceso'),
    (10, 5, 12, 168000, 'finalizado'),
    (11, 11, 1, 45500, 'finalizado'),
	(12, 2, 1, 70500, 'en proceso'),
    (13, 15, 1, 91000, 'finalizado'),
    (14, 1, 1, 64500, 'finalizado');
    
-- CREACION DE VISTAS

-- ventas por empleados del mes en curso
CREATE OR REPLACE VIEW vw_ventas_empleados AS
SELECT e.id_empleado, e.nombre, f.fecha, f.total
FROM empleados AS e JOIN facturas AS f ON (e.id_empleado = f.id_empleado)
WHERE MONTH(f.fecha) = MONTH(CURRENT_DATE());

-- empleado que mas vendió en el mes
CREATE OR REPLACE VIEW vw_empleado_mes AS
SELECT e.nombre, SUM(f.total) AS total_ventas
FROM empleados AS e JOIN facturas f ON e.id_empleado = f.id_empleado
WHERE MONTH(f.fecha) = MONTH(CURRENT_DATE())
GROUP BY e.id_empleado
LIMIT 1;

-- producto mas vendido del mes
CREATE OR REPLACE VIEW vw_producto_mas_vendido AS
SELECT p.descripcion, SUM(df.cantidad) AS cantidad, SUM(df.total) AS total
FROM productos AS p JOIN detalle_facturas AS df ON p.id_producto = df.id_producto
JOIN facturas AS f ON df.id_factura = f.id_factura
WHERE MONTH(f.fecha) = MONTH(CURRENT_DATE())
GROUP BY p.descripcion, df.total
ORDER BY df.total DESC
LIMIT 5;

-- producto menos vendido
CREATE OR REPLACE VIEW vw_producto_menos_vendido AS
SELECT p.descripcion, SUM(df.cantidad) AS cantidad, SUM(df.total) AS total
FROM productos AS p JOIN detalle_facturas AS df ON p.id_producto = df.id_producto
GROUP BY p.descripcion, df.total
ORDER BY df.total ASC
LIMIT 5;

--  clientes que mas compran
CREATE OR REPLACE VIEW vw_clientes_frecuentes AS
SELECT c.nombre, SUM(f.total) AS total_gastado
FROM clientes AS c JOIN facturas AS f ON c.id_cliente = f.id_cliente
GROUP BY c.nombre
ORDER BY total_gastado DESC
LIMIT 3;


-- CREACION DE FUNCIONES

-- funcion para ver el estado en el que se encuentra una orden
DELIMITER $$
CREATE FUNCTION f_estado_orden (id_orden_param INT) RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
  DECLARE estado_orden VARCHAR(255);

  SELECT estado
  INTO estado_orden
  FROM detalle_facturas
  WHERE id_factura = id_orden_param;
  
  RETURN estado_orden;
END;
$$


-- funcion para obtener el stock de un producto
DELIMITER $$
CREATE FUNCTION f_stock_producto (id_producto_param INT) RETURNS INT
READS SQL DATA
BEGIN
  DECLARE stock_producto INT;

  SELECT stock
  INTO stock_producto
  FROM productos
  WHERE id_producto = id_producto_param;
  
  RETURN stock_producto;
END;
$$


-- CREACION DE STORED PROCEDURE

-- actualizacion del estado de una orden
DELIMITER $$
CREATE PROCEDURE sp_actualizar_estado(
  IN id_factura_param INT,
  IN estado_orden_param VARCHAR(30)
)
BEGIN
  UPDATE detalle_facturas SET Estado = estado_orden_param WHERE id_factura = id_factura_param;
END;
$$

-- ventas en determinado periodo de tiempo
DELIMITER $$
CREATE PROCEDURE sp_ventas_periodo(IN inicio DATE, IN fin DATE)
BEGIN
  SELECT
	f.fecha,
    p.descripcion,
    SUM(df.cantidad) AS cantidad_unidades,
    SUM(df.cantidad * p.precio) AS total
  FROM productos AS p
  JOIN detalle_facturas AS df ON p.id_producto = df.id_producto
  JOIN facturas AS f ON df.id_factura = f.id_factura
  WHERE f.fecha BETWEEN inicio AND fin
  GROUP BY f.fecha, p.descripcion;
END;
$$

-- CREACION DE TRIGGERS

-- actualizacion de stock
CREATE TRIGGER tra_stock
AFTER INSERT ON detalle_facturas
FOR EACH ROW
UPDATE Productos
SET stock = stock - NEW.cantidad
WHERE id_producto = NEW.id_producto;

-- auditorias update
CREATE TRIGGER tra_auditoria_producto_update
AFTER UPDATE ON productos
FOR EACH ROW
INSERT INTO auditoria_productos (id_producto, accion, fecha, costo)
VALUES (NEW.id_producto, 'UPDATE', now(), OLD.costo);

-- auditorias insert
CREATE TRIGGER tra_auditoria_producto_insert
AFTER INSERT ON productos
FOR EACH ROW
INSERT INTO auditoria_productos (id_producto, accion, fecha)
VALUES (NEW.id_producto, 'INSERT', now());


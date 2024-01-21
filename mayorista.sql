CREATE SCHEMA proyecto;

use proyecto;

-- creacion de tablas
CREATE TABLE empleados(
id_empleado INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(40) NOT NULL, 
telefono VARCHAR(10) NOT NULL 
);

CREATE TABLE ventas(
id_venta INT PRIMARY KEY AUTO_INCREMENT,
fecha DATE NOT NULL,
total NUMERIC NOT NULL,
id_empleado INT
);

CREATE TABLE clientes (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(40) NOT NULL,
dni VARCHAR (10),
telefono VARCHAR (10) NOT NULL
);

CREATE TABLE detalle_productos (
id_producto INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR (30) NOT NULL,
costo NUMERIC NOT NULL,
precio NUMERIC NOT NULL,
stock INT NOT NULL,
id_proveedor INT NOT NULL
);


CREATE TABLE productos (
id_producto INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR (30) NOT NULL,
marca VARCHAR (20) NOT NULL
);


CREATE TABLE proveedores (
id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (40) NOT NULL,
cuit VARCHAR (15),
telefono VARCHAR (10) NOT NULL
);


-- creacion de relaciones
ALTER TABLE ventas
ADD CONSTRAINT fk_ventas_empleados
FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado);

ALTER TABLE ventas
ADD id_cliente INT;
ALTER TABLE ventas
ADD CONSTRAINT fk_ventas_clientes
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente);

ALTER TABLE productos
ADD CONSTRAINT fk_productos_detalle
FOREIGN KEY (id_producto) REFERENCES detalle_productos (id_producto);

ALTER TABLE detalle_productos
ADD CONSTRAINT fk_detalle_proveedores
FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor);

ALTER TABLE ventas
ADD CONSTRAINT fk_ventas_clientes
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente);
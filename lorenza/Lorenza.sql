--LorenzaDB

CREATE TABLE Productos (
	ID_producto INT PRIMARY KEY,
	nombre VARCHAR(50),
	descripcion VARCHAR(255),
	precio_costo INT,
	precio_venta INT,
	categoria VARCHAR(50),
	peso FLOAT,
	imagen BYTEA
);

CREATE TABLE Clientes (
	ID_cliente INT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	rut VARCHAR(50),
	direccion VARCHAR(100),
	telefono INT,
	correo VARCHAR(50)
);

CREATE TABLE Proveedores (
	ID_proveedor INT PRIMARY KEY,
	nombre VARCHAR(50),
	rut VARCHAR(50)
);

CREATE TABLE Ventas (
	ID_venta INT PRIMARY KEY,
	ID_cliente INT,
	total INT,
	fecha_Emision DATE,
	plazo_factura DATE,
	FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente)
);

CREATE TABLE Detalle_ventas (
	ID_detalle_venta INT PRIMARY KEY,
	ID_venta INT,
	ID_producto INT,
	cantidad INT,
	precio_unidad INT,
	descripcion VARCHAR(50),
	FOREIGN KEY (ID_venta) REFERENCES Ventas(ID_venta),
	FOREIGN KEY (ID_producto) REFERENCES Productos(ID_producto)
);

CREATE TABLE Compras (
	ID_compra INT PRIMARY KEY,
	ID_proveedor INT,
	total INT,
	fecha_compra DATE,
	FOREIGN KEY (ID_proveedor) REFERENCES Proveedores(ID_proveedor)
);

CREATE TABLE Detalle_compras (
	ID_detalle_compra INT PRIMARY KEY,
	ID_compra INT,
	cantidad INT,
	precio_compra INT,
	detalle VARCHAR(200),
	ID_producto INT,
	FOREIGN KEY (ID_compra) REFERENCES Compras(ID_compra),
	FOREIGN KEY (ID_producto) REFERENCES Productos(ID_producto)
);

CREATE TABLE Inventario (
	ID_inventario INT PRIMARY KEY,
	ID_producto INT,
	stock_inicial INT,
	stock_final INT,
	FOREIGN KEY (ID_producto) REFERENCES Productos(ID_producto)
);

CREATE TABLE Detalle_inventario (
	ID_detalle_inventario INT PRIMARY KEY,
	ID_producto INT,
	ID_venta INT,
	ID_compra INT,
	fecha_vencimiento DATE,
	cantidad INT,
	tipo_movimiento VARCHAR(50),
	lote INT,
	FOREIGN KEY (ID_venta) REFERENCES Ventas(ID_venta),
	FOREIGN KEY (ID_compra) REFERENCES Compras(ID_compra)
);


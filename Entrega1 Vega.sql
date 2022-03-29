CREATE SCHEMA IF NOT EXISTS ModeloRestaurante;
USE ModeloRestaurante;
CREATE TABLE IF NOT EXISTS Cliente(
	id_cliente INT NOT NULL PRIMARY KEY,
		nombre VARCHAR(255) NOT NULL,
		documento INT NOT NULL,
		telefono INT)
	ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS Mozos(
	id_mozo INT NOT NULL PRIMARY KEY,
		nombre VARCHAR(255) NOT NULL,
		documento INT NOT NULL,
		direccion VARCHAR(255),
		telefono INT,
		email VARCHAR(255),
		comision INT NOT NULL)
	ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS Pedido(
	id_pedido INT NOT NULL PRIMARY KEY,
		mesa INT NOT NULL,
		fecha TIME NOT NULL,
		id_cliente INT NOT NULL,
		id_mozo INT NOT NULL,
		personas INT NOT NULL,
		comentarios VARCHAR(255),
	FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente),
	FOREIGN KEY(id_mozo) REFERENCES Mozos(id_mozo))
	ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS Menu(
	id_plato INT NOT NULL PRIMARY KEY,
		plato VARCHAR(255) NOT NULL,
		porciones INT NOT NULL,
		precio INT NOT NULL)
	ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS Detalle(
	id_detalle INT NOT NULL PRIMARY KEY,
		id_pedido INT NOT NULL,
		id_plato INT NOT NULL,
		cantidad INT NOT NULL,
	FOREIGN KEY(id_pedido) REFERENCES Pedido(id_pedido),
	FOREIGN KEY(id_plato) REFERENCES Menu(id_plato))
	ENGINE = InnoDB;	
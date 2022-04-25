-- -----------------------------------------------------
-- Creación de la BASE.
-- -----------------------------------------------------

-- DROP SCHEMA ModeloRestaurante;
CREATE SCHEMA IF NOT EXISTS ModeloRestaurante;
USE ModeloRestaurante;

-- -----------------------------------------------------
-- Creación de las TABLAS.
-- -----------------------------------------------------

-- --------Tabla CLIENTE ---------
CREATE TABLE IF NOT EXISTS Cliente(
	id_cliente INT NOT NULL PRIMARY KEY,
		nombre VARCHAR(255) NOT NULL,
		documento INT NOT NULL,
		telefono INT)
	ENGINE = InnoDB;
    
-- -------Tabla MOZOS -----------    
CREATE TABLE IF NOT EXISTS Mozos(
	id_mozo INT NOT NULL PRIMARY KEY,
		nombre VARCHAR(255) NOT NULL,
		documento INT NOT NULL,
		direccion VARCHAR(255),
		telefono INT,
		email VARCHAR(255),
		comision INT NOT NULL)
	ENGINE = InnoDB;
    
-- -------Tabla PEDIDO -----------      
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
    
-- -------Tabla MENÚ -----------      
CREATE TABLE IF NOT EXISTS Menu(
	id_plato INT NOT NULL PRIMARY KEY,
		plato VARCHAR(255) NOT NULL,
		porciones INT NOT NULL,
		precio INT NOT NULL)
	ENGINE = InnoDB;
    
-- -------Tabla DETALLE ---------      
CREATE TABLE IF NOT EXISTS Detalle(
	id_detalle INT NOT NULL PRIMARY KEY,
		id_pedido INT NOT NULL,
		id_plato INT NOT NULL,
		cantidad INT NOT NULL,
	FOREIGN KEY(id_pedido) REFERENCES Pedido(id_pedido),
	FOREIGN KEY(id_plato) REFERENCES Menu(id_plato))
	ENGINE = InnoDB;
    
-- -----------------------------------------------------
-- Inserción de datos
-- -----------------------------------------------------

INSERT INTO Cliente (id_cliente,nombre,documento,telefono)
VALUES (1,'Juan Perez',1234567,095123456), 
	(2,'Lucia Rodriguez',5356789,093467934),
	(3,'Jose Garcia',4568945,098486393),
	(4,'Natalia Benitez',3458694,097934584),
	(5,'Pedro Fernandez',2435456,092356954);

INSERT INTO Mozos (id_mozo,nombre,documento,direccion,telefono,email,comision)
VALUES (31,'Maria Garcia',3456789,'Libertad 123',091345678,'mariagarcia@orueba.com',10),
	(32,'Santiago Jimenez',3456788,'Masini 5678',095675352,'santjim@orueba.com',15),
	(33,'Fernanda Vazquez',5678975,'Marti 767',097457474,'vazquezfernanda@orueba.com',10),
	(34,'Sandra Martinez',1246645,'Benito Blanco 4343',096788433,'sanmar56@orueba.com',20),
	(35,'Martin Gimenez',2456785,'San Jose 3456',093557568,'tinchogim09@orueba.com',10);

INSERT INTO Pedido (id_pedido,mesa,fecha,id_cliente,id_mozo,personas,comentarios)
VALUES (51,4,'2022-04-10 21:10:00',1,32,2,'muy bueno'),
	(52,2,'2022-04-10 21:10:00',2,33,3,'aceptable'),
	(53,3,'2022-04-10 21:10:00',3,34,5,'excelente'),
	(54,4,'2022-04-11 21:10:00',4,34,1,'comida fria'),
	(55,5,'2022-04-11 21:10:00',5,31,2,'rico'),
	(56,2,'2022-04-11 21:10:00',2,33,4,'aceptable'),
	(57,3,'2022-04-12 21:10:00',3,31,5,'excelente'),
	(58,4,'2022-04-12 21:10:00',4,34,1,'buena'),
	(59,5,'2022-04-12 21:10:00',5,31,2,'rico'),
	(60,2,'2022-04-15 21:10:00',2,32,4,'aceptable'),
	(61,3,'2022-04-15 21:10:00',3,34,5,'demasiada demora'),
	(62,4,'2022-04-15 21:10:00',4,35,1,'comida fria'),
	(63,5,'2022-04-17 21:10:00',5,31,3,'bueno'),
	(64,2,'2022-04-17 21:10:00',2,32,3,'correcto'),
	(65,3,'2022-04-17 21:10:00',3,34,2,'excelente');
	
INSERT INTO Menu (id_plato,plato,porciones,precio)
VALUES (351,'Milanesa con pure',20,500),
	(352,'Tallarines',30,600),
	(353,'Chivito',50,750),
	(354,'Salmon con papas fritas',40,800),
	(355,'Ensalada',20,300);

INSERT INTO Detalle (id_detalle,id_pedido,id_plato,cantidad)
VALUES (23,51,351,2),
	(24,52,352,3),
	(25,53,353,4),
	(26,54,354,1),
	(27,55,355,5),
    (28,56,351,2),
	(29,57,352,3),
	(30,58,353,4),
	(31,59,354,1),
	(32,60,355,5),
	(33,61,351,2),
	(34,62,352,3),
	(35,63,353,4),
	(36,64,354,1),
	(37,65,355,5);

-- --------------------------------------
-- Creación de Vistas
-- --------------------------------------

-- -------Vista COMISIONES ALTAS---------
CREATE OR REPLACE VIEW comisiones_altas AS
	(SELECT id_mozo, nombre, comision 
	FROM Mozos
	WHERE comision > 10
	ORDER BY comision DESC);

-- -------Vista PLATOS VENDIDOS---------
CREATE OR REPLACE VIEW platos_vendidos AS
	(SELECT plato, precio, sum(cantidad) AS cantidad_plato, sum(cantidad)*precio AS total
	FROM Menu m JOIN Detalle d ON (m.id_plato = d.id_plato)
	GROUP BY 1);

-- -------Vista COMISIONES VENTAS---------
CREATE OR REPLACE VIEW comisiones_ventas AS
	(SELECT r.id_mozo, nombre, p.id_pedido, m.id_plato, plato, sum(d.cantidad) AS cantidad_plato, precio, comision, TRUNCATE(sum(d.cantidad)*precio*(comision/100),2) AS comision_venta
	FROM Mozos r
	INNER JOIN Pedido p ON (r.id_mozo = p.id_mozo)
	INNER JOIN Detalle d ON (p.id_pedido = d.id_pedido)
	INNER JOIN Menu m ON (m.id_plato = d.id_plato)
	GROUP BY 1,2,3,4,5);

-- -------Vista CLIENTES PRINCIPALES---------
CREATE OR REPLACE VIEW clientes_principales AS
	(SELECT 
	  c.id_cliente,
	  nombre,
	  sum(d.cantidad) AS cantidad_plato, 
	  TRUNCATE(sum(d.cantidad*m.precio),2) AS cliente_compra
	FROM Cliente c
	  INNER JOIN Pedido p ON (c.id_cliente = p.id_cliente)
	  INNER JOIN Detalle d ON (p.id_pedido = d.id_pedido)
	  INNER JOIN Menu m ON (m.id_plato = d.id_plato)
	GROUP BY 1,2
	ORDER BY cliente_compra DESC
	LIMIT 3);

-- -------Vista PRECIOS PLATOS---------
CREATE OR REPLACE VIEW precios_platos AS
	(SELECT plato, precio 
	FROM Menu
	ORDER BY precio DESC);
	
-- -------------------------------------------
-- Verificación de la creación de vistas
-- -------------------------------------------

SELECT * FROM comisiones_altas;
SELECT * FROM platos_vendidos;
SELECT * FROM comisiones_ventas;
SELECT * FROM clientes_principales;
SELECT * FROM precios_platos;

-- -------------------------------------------
-- Creación de Funciones
-- -------------------------------------------

-- ---------------Función TOTAL PEDIDO---------------
DROP FUNCTION IF EXISTS total_pedido;
DELIMITER $$
CREATE FUNCTION total_pedido(pedido INT) RETURNS FLOAT
READS SQL DATA
BEGIN
	-- Paso 1. Declaramos una variable local
    DECLARE resultado FLOAT DEFAULT 0;

	-- Paso 2. Multiplicamos la cantidad de platos por el precio de cada uno
    SET resultado = (
    	SELECT sum(d.cantidad*precio) AS total
		FROM Pedido p
			INNER JOIN Detalle d ON (p.id_pedido = d.id_pedido)
			INNER JOIN Menu m ON (m.id_plato = d.id_plato)
		WHERE p.id_pedido = pedido);

	-- Paso 3. Devolvemos el resultado		
	RETURN (resultado);
END$$
DELIMITER ;

-- ---------------Función CONSUMO POR PLATO---------------
DROP FUNCTION IF EXISTS consumo_plato;
DELIMITER $$
CREATE FUNCTION consumo_plato(nombre_plato VARCHAR(50)) RETURNS INT
READS SQL DATA
BEGIN
  -- Paso 1. Declaramos una variable local
  DECLARE total INT;

  -- Paso 2. Contamos los platos
  SET total = (
    SELECT sum(d.cantidad) 
    FROM Detalle d
    	INNER JOIN Menu m ON (m.id_plato = d.id_plato)
    WHERE plato = nombre_plato);

  -- Paso 3. Devolvemos el resultado
  RETURN total;
END
$$

DELIMITER ;

-- -------------------------------------------
-- Verificación de las funciones
-- -------------------------------------------

SELECT total_pedido (53) AS total_pedido;
SELECT consumo_plato('Tallarines');

-- -------------------------------------------
-- Creación de Stored Procedures
-- -------------------------------------------

-- ----------SP ORDENAR TABLA----------
DROP PROCEDURE IF EXISTS ordenar_tabla;
DELIMITER $$
CREATE PROCEDURE ordenar_tabla(IN tabla VARCHAR(20), IN campo VARCHAR(20), IN es_asc BOOLEAN)
BEGIN
  -- Paso 1. Definimos una variable con la cláusula ORDER BY
	IF campo <> '' THEN
  		IF es_asc = TRUE THEN
  			SET @tabla_order = concat('ModeloRestaurante.', tabla, ' ORDER BY ', campo, ' ASC');
		ELSE
			SET @tabla_order = concat('ModeloRestaurante.', tabla, ' ORDER BY ', campo, ' DESC');
		END IF;
	ELSE
		SET @tabla_order = concat('ModeloRestaurante.', tabla);
	END IF;
		
  -- Paso 2. Se concatena la sentencia SQL con el ordenamiento
	SET @clausula = concat('SELECT * FROM ', @tabla_order);
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END
$$

DELIMITER ;

-- --------SP INSERTAR REGISTRO--------
DROP PROCEDURE IF EXISTS insertar_registro;
DELIMITER $$
CREATE PROCEDURE insertar_registro(IN id_registro INT, IN nombre_registro VARCHAR(255), IN documento_registro INT, telefono_registro INT)
BEGIN
  -- Paso 1. Definimos una variable con el registro
	SET @registro = concat(id_registro,",'",nombre_registro,"',",documento_registro,",",telefono_registro,")");
 		
  -- Paso 2. Se concatena la sentencia SQL con el registro
	SET @clausula = concat('INSERT INTO Cliente (id_cliente,nombre,documento,telefono) VALUES (', @registro);
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END
$$

DELIMITER ;

-- -------------------------------------------
-- Verificación de las funciones
-- -------------------------------------------

call ordenar_tabla("cliente", "nombre", FALSE);
call ordenar_tabla("menu", "precio", TRUE);
call ordenar_tabla("detalle","","");
call insertar_registro(6,"Pedro Perez",45789321,093492939);
call insertar_registro(7,"Juana Lopez",36834537,093447394);
call insertar_registro(8,"Lucia Gomez",23345451,099883743);

-- -------------------------------------------
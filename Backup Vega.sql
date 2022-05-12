
-- -----------------------------------------------------
-- Backup de la base de datos
-- -----------------------------------------------------

-- Se realiza un backup de todas las tablas.

# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.31)
# Base de datos: ModeloRestaurante
# Tiempo de Generación: 2022-05-12 22:55:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla Cliente
# ------------------------------------------------------------

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;

INSERT INTO `Cliente` (`id_cliente`, `nombre`, `documento`, `telefono`)
VALUES
	(1,'Juan Perez',1234567,95123456),
	(2,'Lucia Rodriguez',5356789,93467934),
	(3,'Jose Garcia',4568945,98486393),
	(4,'Natalia Benitez',3458694,97934584),
	(5,'Pedro Fernandez',2435456,92356954);

/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla clientes_principales
# ------------------------------------------------------------



# Volcado de tabla comisiones_altas
# ------------------------------------------------------------



# Volcado de tabla comisiones_ventas
# ------------------------------------------------------------



# Volcado de tabla Detalle
# ------------------------------------------------------------

LOCK TABLES `Detalle` WRITE;
/*!40000 ALTER TABLE `Detalle` DISABLE KEYS */;

INSERT INTO `Detalle` (`id_detalle`, `id_pedido`, `id_plato`, `cantidad`)
VALUES
	(23,51,351,2),
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
	(37,65,355,5),
	(44,51,351,2),
	(45,51,351,3);

/*!40000 ALTER TABLE `Detalle` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla log_change_price
# ------------------------------------------------------------

LOCK TABLES `log_change_price` WRITE;
/*!40000 ALTER TABLE `log_change_price` DISABLE KEYS */;

INSERT INTO `log_change_price` (`log_id`, `usuario`, `fecha`, `hora`, `precio_viejo`, `precio_nuevo`)
VALUES
	(1,'root@localhost','2022-05-11','18:25:24',500,550);

/*!40000 ALTER TABLE `log_change_price` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla log_delete_pedido
# ------------------------------------------------------------

LOCK TABLES `log_delete_pedido` WRITE;
/*!40000 ALTER TABLE `log_delete_pedido` DISABLE KEYS */;

INSERT INTO `log_delete_pedido` (`log_id`, `usuario`, `fecha`, `hora`, `nuevo_registro`)
VALUES
	(1,'root@localhost','2022-05-11','18:25:25','66_3_21:10:00_3_33_3_muy bueno');

/*!40000 ALTER TABLE `log_delete_pedido` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla log_insert_pedido
# ------------------------------------------------------------

LOCK TABLES `log_insert_pedido` WRITE;
/*!40000 ALTER TABLE `log_insert_pedido` DISABLE KEYS */;

INSERT INTO `log_insert_pedido` (`log_id`, `usuario`, `fecha`, `hora`, `nuevo_registro`)
VALUES
	(1,'root@localhost','2022-05-11','18:25:25','66_3_21:10:00_3_33_3');

/*!40000 ALTER TABLE `log_insert_pedido` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla Menu
# ------------------------------------------------------------

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;

INSERT INTO `Menu` (`id_plato`, `plato`, `porciones`, `precio`)
VALUES
	(351,'Milanesa con pure',5,550),
	(352,'Tallarines',30,600),
	(353,'Chivito',50,750),
	(354,'Salmon con papas fritas',40,800),
	(355,'Ensalada',20,300);

/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla Mozos
# ------------------------------------------------------------

LOCK TABLES `Mozos` WRITE;
/*!40000 ALTER TABLE `Mozos` DISABLE KEYS */;

INSERT INTO `Mozos` (`id_mozo`, `nombre`, `documento`, `direccion`, `telefono`, `email`, `comision`)
VALUES
	(31,'Maria Garcia',3456789,'Libertad 123',91345678,'mariagarcia@orueba.com',10),
	(32,'Santiago Jimenez',3456788,'Masini 5678',95675352,'santjim@orueba.com',15),
	(33,'Fernanda Vazquez',5678975,'Marti 767',97457474,'vazquezfernanda@orueba.com',10),
	(34,'Sandra Martinez',1246645,'Benito Blanco 4343',96788433,'sanmar56@orueba.com',20),
	(35,'Martin Gimenez',2456785,'San Jose 3456',93557568,'tinchogim09@orueba.com',10);

/*!40000 ALTER TABLE `Mozos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla Pedido
# ------------------------------------------------------------

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;

INSERT INTO `Pedido` (`id_pedido`, `mesa`, `fecha`, `id_cliente`, `id_mozo`, `personas`, `comentarios`)
VALUES
	(51,4,'21:10:00',1,32,2,'muy bueno'),
	(52,2,'21:10:00',2,33,3,'aceptable'),
	(53,3,'21:10:00',3,34,5,'excelente'),
	(54,4,'21:10:00',4,34,1,'comida fria'),
	(55,5,'21:10:00',5,31,2,'rico'),
	(56,2,'21:10:00',2,33,4,'aceptable'),
	(57,3,'21:10:00',3,31,5,'excelente'),
	(58,4,'21:10:00',4,34,1,'buena'),
	(59,5,'21:10:00',5,31,2,'rico'),
	(60,2,'21:10:00',2,32,4,'aceptable'),
	(61,3,'21:10:00',3,34,5,'demasiada demora'),
	(62,4,'21:10:00',4,35,1,'comida fria'),
	(63,5,'21:10:00',5,31,3,'bueno'),
	(64,2,'21:10:00',2,32,3,'correcto'),
	(65,3,'21:10:00',3,34,2,'excelente');

/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla platos_vendidos
# ------------------------------------------------------------



# Volcado de tabla precios_platos
# ------------------------------------------------------------





# Replace placeholder table for comisiones_altas with correct view syntax
# ------------------------------------------------------------

DROP TABLE `comisiones_altas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comisiones_altas` AS (select `mozos`.`id_mozo` AS `id_mozo`,`mozos`.`nombre` AS `nombre`,`mozos`.`comision` AS `comision` from `mozos` where (`mozos`.`comision` > 10) order by `mozos`.`comision` desc);


# Replace placeholder table for clientes_principales with correct view syntax
# ------------------------------------------------------------

DROP TABLE `clientes_principales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clientes_principales` AS (select `c`.`id_cliente` AS `id_cliente`,`c`.`nombre` AS `nombre`,sum(`d`.`cantidad`) AS `cantidad_plato`,truncate(sum((`d`.`cantidad` * `m`.`precio`)),2) AS `cliente_compra` from (((`cliente` `c` join `pedido` `p` on((`c`.`id_cliente` = `p`.`id_cliente`))) join `detalle` `d` on((`p`.`id_pedido` = `d`.`id_pedido`))) join `menu` `m` on((`m`.`id_plato` = `d`.`id_plato`))) group by 1,2 order by `cliente_compra` desc limit 3);


# Replace placeholder table for comisiones_ventas with correct view syntax
# ------------------------------------------------------------

DROP TABLE `comisiones_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comisiones_ventas` AS (select `r`.`id_mozo` AS `id_mozo`,`r`.`nombre` AS `nombre`,`p`.`id_pedido` AS `id_pedido`,`m`.`id_plato` AS `id_plato`,`m`.`plato` AS `plato`,sum(`d`.`cantidad`) AS `cantidad_plato`,`m`.`precio` AS `precio`,`r`.`comision` AS `comision`,truncate(((sum(`d`.`cantidad`) * `m`.`precio`) * (`r`.`comision` / 100)),2) AS `comision_venta` from (((`mozos` `r` join `pedido` `p` on((`r`.`id_mozo` = `p`.`id_mozo`))) join `detalle` `d` on((`p`.`id_pedido` = `d`.`id_pedido`))) join `menu` `m` on((`m`.`id_plato` = `d`.`id_plato`))) group by 1,2,3,4,5);


# Replace placeholder table for platos_vendidos with correct view syntax
# ------------------------------------------------------------

DROP TABLE `platos_vendidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `platos_vendidos` AS (select `m`.`plato` AS `plato`,`m`.`precio` AS `precio`,sum(`d`.`cantidad`) AS `cantidad_plato`,(sum(`d`.`cantidad`) * `m`.`precio`) AS `total` from (`menu` `m` join `detalle` `d` on((`m`.`id_plato` = `d`.`id_plato`))) group by 1);


# Replace placeholder table for precios_platos with correct view syntax
# ------------------------------------------------------------

DROP TABLE `precios_platos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `precios_platos` AS (select `menu`.`plato` AS `plato`,`menu`.`precio` AS `precio` from `menu` order by `menu`.`precio` desc);

--
-- Dumping routines (PROCEDURE) for database 'ModeloRestaurante'
--
DELIMITER ;;

DELIMITER ;

--
-- Dumping routines (FUNCTION) for database 'ModeloRestaurante'
--
DELIMITER ;;

DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

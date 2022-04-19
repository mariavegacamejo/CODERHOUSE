CREATE OR REPLACE VIEW comisiones_altas AS
	(SELECT id_mozo, nombre, comision 
	FROM Mozos
	WHERE comision > 10
	ORDER BY comision DESC);

CREATE OR REPLACE VIEW platos_vendidos AS
	(SELECT plato, precio, sum(cantidad) AS cantidad_plato, sum(cantidad)*precio AS total
	FROM Menu m JOIN Detalle d ON (m.id_plato = d.id_plato)
	GROUP BY 1);

CREATE OR REPLACE VIEW comisiones_ventas AS
	(SELECT r.id_mozo, nombre, p.id_pedido, m.id_plato, plato, sum(d.cantidad) AS cantidad_plato, precio, comision, TRUNCATE(sum(d.cantidad)*precio*(comision/100),2) AS comision_venta
	FROM Mozos r
	INNER JOIN Pedido p ON (r.id_mozo = p.id_mozo)
	INNER JOIN Detalle d ON (p.id_pedido = d.id_pedido)
	INNER JOIN Menu m ON (m.id_plato = d.id_plato)
	GROUP BY 1,2,3,4,5);

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

CREATE OR REPLACE VIEW precios_platos AS
	(SELECT plato, precio 
	FROM Menu
	ORDER BY precio DESC);
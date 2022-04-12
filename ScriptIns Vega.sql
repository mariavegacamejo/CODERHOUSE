INSERT INTO Cliente (id_cliente,nombre,documento,telefono)
VALUES (1,'Juan Perez',1234567,095123456);

INSERT INTO Mozos (id_mozo,nombre,documento,direccion,telefono,email,comision)
VALUES (3,'Maria Garcia',3456789,'Libertad 123',091345678,'mariagarcia@orueba.com',10);

INSERT INTO Pedido (id_pedido,mesa,fecha,id_cliente,id_mozo,personas,comentarios)
VALUES (5,4,'2022-04-10 21:10:00',1,3,2,'muy bueno');

INSERT INTO Menu (id_plato,plato,porciones,precio)
VALUES (35,'Milanesa con pure',20,500);

INSERT INTO Detalle (id_detalle,id_pedido,id_plato,cantidad)
VALUES (23,5,35,2);
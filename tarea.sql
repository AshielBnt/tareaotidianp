Select * from clientes where NOMBRE = 'Juan gonzalez';
/*Obtén todos los clientes cuyo nombre sea "Juan Pérez".*/



select * from productos WHERE precio <> 100;
/*Muestra todos los productos cuyo precio no sea igual a 100.*/


SELECT * FROM pedidos WHERE Total > 500;
/*Encuentra todos los pedidos cuyo total sea mayor a 500.*/


SELECT * FROM productos WHERE Stock < 20; 
/*Encuentra todos los productos con menos de 20 unidades en stock.*/


SELECT * FROM clientes WHERE FECHAREGISTRO > '2024-01-01';
/*Muestra todos los clientes registrados después del 1 de enero de 2024.*/


SELECT * FROM productos WHERE Precio BETWEEN 100 AND 500;
/*Obtén todos los productos con un precio entre 100 y 500.*/


SELECT * FROM pedidos WHERE Total NOT BETWEEN 200 AND 1000;
/*Encuentra todos los pedidos cuyo total no esté entre 200 y 1000*/


SELECT * FROM clientes WHERE ID_Cliente IN (1, 3, 5);
/*Muestra todos los clientes cuyo ID_Cliente sea 1, 3, o 5*/


SELECT * FROM productos WHERE ID_PRODUCTO NOT IN (2, 4);
/*Encuentra todos los productos cuyo ID_Producto no sea 2 ni 4.*/


SELECT * FROM pedidos WHERE YEAR(Fecha_Pedido) = 2024;
/*Muestra todos los pedidos realizados en el año 2024*/


SELECT clientes , pedidos FROM clientes
LEFT JOIN pedidos ON clientes.ID_Clientes = pedidos.ID_Clientes;
/*Muestra todos los clientes y sus pedidos.*/

SELECT productos.*, productos.Nombre AS Nombre_Producto, pp.Cantidad FROM pedidos
JOIN pedidos_productos  ON p.ID_Pedido = pedidos.ID_Pedido
JOIN productos productos ON productos.ID_Producto = productos.ID_PRODUCTO;
 /*Obtén todos los pedidos junto con los nombres de los productos y la cantidad de cada producto en esos pedidos.*/
 
 
SELECT c.NOMBRE, (p.ID_Pedido) AS Total_Pedidos FROM clientes 
LEFT JOIN pedidos  ON clientes.ID_Cliente = pedidos.ID_Cliente
GROUP BY clientes.ID_Cliente;
/*Muestra el nombre de cada cliente y el número total de pedidos que ha realizado. **(usar COUNT, LEFT JOIN,*/


SELECT clientes.NOMBRE, SUM(pedidos.Total) AS Total_Gastado
FROM clientes 
LEFT JOIN pedidos  ON clientes.ID_Cliente = pedido.ID_Cliente
GROUP BY cclientes.ID_Cliente;
/*Encuentra el nombre del cliente y el total gastado por cada uno. **(usar SUM, GROUP BY)*/


SELECT clientes.NOMBRE, pedidos.Total/*Encuentra todos los productos que nunca han sido vendidos. **(usar NOT IN con doble SELECT)*/
FROM clientes 
JOIN pedidos  ON clientes.ID_Cliente = pedidos.ID_Cliente
WHERE pedidos.Fecha_Pedido > '2024-02-01';
/*Encuentra todos los productos que nunca han sido vendidos. **(usar NOT IN con doble SELECT)*/


SELECT * FROM productos 
WHERE ID_PRODUCTO NOT IN (SELECT ID_Producto FROM pedidos_productos);
/*Muestra el nombre del cliente que ha realizado el pedido más caro. **(usar ORDER BY, DESC, LIMIT)*/


SELECT clientes.NOMBRE 
FROM clientes 
JOIN pedidos  ON clientes.ID_Cliente = pedidos.ID_Cliente
ORDER BY pedidos.Total 
/*Encuentra el nombre de cada producto y la cantidad total vendida de ese producto. **(usar SUM, GROUP BY)*/







SELECT clientes.NOMBRE, direcciones.Calle, direcciones.Ciudad, direcciones.Estado, direcciones.Codigo_postal, direcciones.Pais, pedidos.* 
FROM clientes c¡
JOIN Direcciones  ON clientes.ID_Direccion = direcciones.ID_Direccion
LEFT JOIN pedidos  ON clientes.ID_Cliente = pedidos.ID_Cliente;
/*Muestra el nombre y dirección de todos los clientes junto con sus pedidos realizados.*/


SELECT * FROM productos WHERE Nombre LIKE '%Sony%'; 
/*Muestra todos los productos cuyo nombre contiene la palabra "Sony".*/

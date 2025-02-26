CREATE TABLE clientes(email varchar(50), nombre varchar, telefono varchar(16), empresa varchar(50), prioridad smallint check(prioridad >=1 and prioridad <=10));
INSERT INTO clientes Values ('juan@gmail', 'Juan', 1234567, 'coffecompany', 5);
INSERT INTO clientes Values ('diana@gmail','Diana', 1234007, 'arrozcoompany', 3);
INSERT INTO clientes Values ('andrea@gmail', 'Andrea', 12345567, 'azucarcompany', 2);
INSERT INTO clientes Values ('luis@gmail', 'luis', 1938367, 'salcompany', 7);
INSERT INTO clientes Values ('carlos@gmail', 'carlos', 1232313, 'panelacompany', 8);
INSERT INTO clientes Values ('cata@gmail', 'cata', 2434534, 'ropacompany', 9);
INSERT INTO clientes Values ('simon@gmail', 'simon', 89924267, 'juguetescompany', 1);
INSERT INTO clientes Values ('lorena@gmail', 'lorena', 98904567, 'paletascompany', 10);
INSERT INTO clientes Values ('mateo@gmail', 'mateo', 9883937, 'calabazascompany', 4);

SELECT * FROM clientes;
SELECT * FROM clientes 
ORDER BY prioridad DESC LIMIT 3;

SELECT * FROM clientes
WHERE prioridad >= 5;
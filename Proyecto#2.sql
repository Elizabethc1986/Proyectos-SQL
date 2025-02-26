CREATE TABLE usuarios(
 email VARCHAR(255),
 nombre TEXT,
 apellido TEXT,
 rol VARCHAR(255),
usuario_id bigint
 );
-- SELECT * FROM usuarios;
INSERT INTO usuarios (usuario_id, email, nombre, apellido, rol) 
VALUES (1, 'juana@gmail.com', 'Juana', 'de arco', 'Administrador');

INSERT INTO usuarios (usuario_id, email, nombre, apellido, rol) 
VALUES (2, 'jose@gmail.com', 'Jose', 'marcos', 'Administrador');

INSERT INTO usuarios (usuario_id, email, nombre, apellido, rol) 
VALUES (3, 'antonia@gmail.com', 'Antonia', 'bedoya', 'usuario');

INSERT INTO usuarios (usuario_id, email, nombre, apellido, rol) 
VALUES (3, 'antonia@gmail.com', 'Antonia', 'bedoya', 'usuario');

INSERT INTO usuarios (usuario_id, email, nombre, apellido, rol) 
VALUES (5, 'camila@gmail.com', 'Camila', 'arango', 'usuario');

-- SELECT * FROM usuarios;


CREATE TABLE posts(
 titulo VARCHAR(255),
 contenido TEXT,
 fecha_creacion timestamp,
 fecha_actualizacion timestamp,
 destacado boolean,
 usuario_id bigint,
post_id bigint
 );
-- SELECT * FROM posts;

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id, post_id) 
VALUES ('Belleza', 'Como maquillarse', '2024-01-01', '2024-11-01', TRUE, 1, 1);

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id, post_id) 
VALUES ('Deporte', 'Fitness', '2024-02-02', '2024-11-15', TRUE, 2, 2);

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id, post_id) 
VALUES ('Cocina', 'Recetas', '2024-03-03', '2024-10-15', FALSE, 3, 3);

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id, post_id) 
VALUES ('Idiomas', 'Ingles', '2024-04-03', '2024-10-31', FALSE, 3, 4);

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id, post_id) 
VALUES ('Moda', 'Ropa', '2024-05-03', '2024-06-30', FALSE,NULL , 5 );

-- SELECT * FROM posts;

CREATE TABLE comentarios(
Contenido TEXT,
fecha_creacion timestamp,
usuario_id bigint,
post_id bigint);

-- SELECT * FROM comentarios;

INSERT INTO comentarios (contenido,  fecha_creacion, usuario_id, post_id) 
VALUES ('Es muy educativo en la forma de maquillarse', '2024-11-28',1,1 );
INSERT INTO comentarios (contenido,  fecha_creacion, usuario_id, post_id) 
VALUES ('Se nota la experiencia en maquillaje', '2024-11-28',2,1 );
INSERT INTO comentarios (contenido,  fecha_creacion, usuario_id, post_id) 
VALUES ('deberian hacer mas contenido', '2024-11-28',3,1 );
INSERT INTO comentarios (contenido,  fecha_creacion, usuario_id, post_id) 
VALUES ('Me veo mejor', '2024-11-28',1,2);
INSERT INTO comentarios (contenido,  fecha_creacion, usuario_id, post_id) 
VALUES ('Me gusta las recomendaciones ejercicio', '2024-11-28', 2, 2);

-- SELECT * FROM comentarios;

1)

SELECT DISTINCT usuarios.nombre, usuarios.email, posts.titulo, posts.contenido
FROM usuarios
INNER JOIN posts ON usuarios.usuario_id = posts.usuario_id;

2)

SELECT usuarios.usuario_id, posts.contenido, posts.titulo FROM 
usuarios
inner join
posts on usuarios.usuario_id = posts.usuario_id
WHERE usuarios.rol= 'Administrador';

3)
SELECT 
    usuarios.usuario_id, 
    usuarios.email, 
    COUNT(DISTINCT posts.post_id) AS cantidad_posts
FROM 
    usuarios
LEFT JOIN
    posts ON usuarios.usuario_id = posts.usuario_id
GROUP BY 
    usuarios.usuario_id, usuarios.email
ORDER BY 
    cantidad_posts DESC;

4)
SELECT usuarios.email
FROM 
    usuarios
INNER JOIN 
    posts ON usuarios.usuario_id = posts.usuario_id
GROUP BY 
    usuarios.usuario_id, usuarios.email
ORDER BY 
    COUNT(posts.post_id) DESC
LIMIT 1;

5)
SELECT 
    usuarios.usuario_id, 
    usuarios.email, 
    MAX(posts.fecha_creacion) AS fecha_ultimo_post
FROM 
    usuarios
JOIN 
    posts ON usuarios.usuario_id = posts.usuario_id
GROUP BY 
    usuarios.usuario_id, usuarios.email;

6) 
SELECT 
    posts.titulo, 
    posts.contenido
FROM 
    posts
JOIN 
    comentarios ON posts.post_id = comentarios.post_id
GROUP BY 
    posts.post_id, posts.titulo, posts.contenido
ORDER BY 
    COUNT(comentarios.usuario_id) DESC
LIMIT 1;

7)
SELECT DISTINCT
    posts.titulo, 
    posts.contenido AS contenido_post, 
    comentarios.contenido AS contenido_comentario, 
    usuarios.email
FROM 
    posts
JOIN 
    comentarios ON posts.post_id = comentarios.post_id
JOIN 
    usuarios ON comentarios.usuario_id = usuarios.usuario_id;

8)
SELECT 
    usuarios.email
FROM 
    usuarios
LEFT JOIN 
    comentarios ON usuarios.usuario_id = comentarios.usuario_id
GROUP BY 
    usuarios.usuario_id, usuarios.email
HAVING 
    COUNT(comentarios.usuario_id) = 0;
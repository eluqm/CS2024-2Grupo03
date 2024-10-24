-- ---------------------- Database: intercambio_libros v3.0 ---------------------------
/*
CREATE DATABASE IF NOT EXISTS intercambio_libros 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- drop database intercambio_libros;

USE intercambio_libros;
*/
-- ---------------------------------------------------------------------------------
-- -----------  Tabla usuario

CREATE TABLE usuario (
    id_usuario  integer UNSIGNED,
    nombre      varchar(100),
    apellidos   varchar(100),
    email       varchar(100),
    password    varchar(500) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE usuario
  ADD PRIMARY KEY (id_usuario),
  ADD UNIQUE KEY (email);

CREATE OR REPLACE SEQUENCE usuario_secuencia 
INCREMENT BY 1
MINVALUE = 1
START WITH 1;

CREATE OR REPLACE PROCEDURE insertar_usuario( 
	IN  IN_nombres 		varchar(100), 
	IN 	IN_apellidos 	varchar(100),
	IN  IN_email		varchar(100),
	IN  IN_password 	varchar(500)
)
BEGIN
	DECLARE v_id_usuario integer UNSIGNED;
	SELECT nextval( usuario_secuencia ) into v_id_usuario;
	INSERT INTO usuario ( id_usuario, nombre, apellidos, email, password ) 
	VALUES
		( v_id_usuario, IN_nombres, IN_apellidos, IN_email, IN_password );
END;

CREATE OR REPLACE PROCEDURE todos_usuarios( )
BEGIN 
	SELECT * FROM usuario;
END;

CREATE OR REPLACE PROCEDURE existe_email_usuario(
	IN	IN_email 		varchar(100)
)
BEGIN 
	DECLARE v_total integer;
	DECLARE v_encontrado bool;

	SELECT count(*) INTO v_total
	FROM usuario u 
	where u.email = IN_email;

	IF( v_total = 0 ) THEN
		SET v_encontrado = false;
	ELSE
		SET v_encontrado = true;
	END IF;

	SELECT v_encontrado;
END;

CREATE OR REPLACE PROCEDURE get_usuario_por_email(
	IN	IN_email 	varchar(100)
)
BEGIN 
	SELECT * 
	FROM usuario
	WHERE email = IN_email;
END;

-- -------------- Tabla genero --------------------------------------------
-- -------------------------------------------------------------------

CREATE TABLE genero(
    id_genero  integer UNSIGNED,
    nombre     varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE genero
  	ADD PRIMARY KEY (id_genero);
 
CREATE OR REPLACE SEQUENCE genero_secuencia 
INCREMENT BY 1
MINVALUE = 1
START WITH 1;

CREATE OR REPLACE PROCEDURE insertar_genero(
	IN	IN_nombre 	varchar(100)
)
BEGIN
	DECLARE v_id_genero integer UNSIGNED;
	select nextval(genero_secuencia) into v_id_genero;
	INSERT INTO genero( id_genero, nombre ) 
	VALUES ( v_id_genero, IN_nombre );
END;

CREATE OR REPLACE PROCEDURE listar_generos( )
BEGIN 
	SELECT * FROM genero;
END;

-- -------------- Tabla autor ----------------------------------------
 
CREATE TABLE autor(
    id_autor    integer UNSIGNED,
    nombre      varchar(100),
    apellidos   varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE autor
  	ADD PRIMARY KEY (id_autor);
 
CREATE OR REPLACE SEQUENCE autor_secuencia 
INCREMENT BY 1
MINVALUE = 1
START WITH 1;

CREATE OR REPLACE PROCEDURE insertar_autor(
	IN	IN_nombre 		varchar(100), 
	IN  IN_apellidos 	varchar(100)
)
BEGIN 
	DECLARE v_id_autor integer UNSIGNED;
	SELECT nextval(autor_secuencia) into v_id_autor;
	INSERT INTO autor( id_autor, nombre, apellidos ) 
	VALUES ( v_id_autor, IN_nombre, IN_apellidos );
END;

CREATE OR REPLACE PROCEDURE buscar_autor_por_nombre(
	IN	IN_nombre 		varchar(100)
)
BEGIN 
	SELECT * 
	FROM autor
	WHERE nombre like CONCAT("%", IN_nombre, "%");
END;

CREATE OR REPLACE PROCEDURE buscar_autor_por_apellido(
	IN	IN_apellido		varchar(100)
)
BEGIN 
	SELECT * 
	FROM autor
	WHERE apellidos like CONCAT("%", IN_apellido, "%");
END;

-- -------------- Tabla editorial -----------------------------

CREATE TABLE editorial(
    id_editorial    integer UNSIGNED,
    nombre          varchar(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE editorial
  	ADD PRIMARY KEY (id_editorial);
 
CREATE OR REPLACE SEQUENCE editorial_secuencia 
INCREMENT BY 1
MINVALUE = 1
START WITH 1;
 
CREATE OR REPLACE PROCEDURE insertar_editorial(
	IN	IN_nombre		varchar(100)
)
BEGIN 
	DECLARE v_id_editorial integer UNSIGNED;
	SELECT nextval(editorial_secuencia) into v_id_editorial;
	INSERT INTO editorial( id_editorial, nombre ) 
	VALUES ( v_id_editorial, IN_nombre );
END;

CREATE OR REPLACE PROCEDURE listar_editoriales( )
BEGIN 
	SELECT * FROM editorial;
END;

CREATE OR REPLACE PROCEDURE buscar_editorial(
	IN	IN_nombre		varchar(100)
)
BEGIN 
	SELECT * 
	FROM editorial
	WHERE nombre like CONCAT("%", IN_nombre, "%");
END;

 -- --------------- Tabla libro -----------------------------------

CREATE TABLE libro(
    id_libro        integer UNSIGNED,
    titulo          varchar(300),
    detalle         varchar(500),
    url_imagen		varchar(1000),
    id_editorial    integer UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE libro
  ADD PRIMARY KEY (id_libro);
 
ALTER TABLE libro 
	ADD CONSTRAINT fk_editorial 
	FOREIGN KEY (id_editorial) 
	REFERENCES editorial (id_editorial);

CREATE OR REPLACE SEQUENCE libro_secuencia 
INCREMENT BY 1
MINVALUE = 1
START WITH 1;

CREATE OR REPLACE PROCEDURE insertar_libro(
	IN IN_titulo		varchar(300),
	IN IN_detalle		varchar(500),
	IN IN_url_imagen 	varchar(1000),
	IN IN_id_editorial	integer UNSIGNED  
)
BEGIN 
	DECLARE v_id_libro integer UNSIGNED;
	SELECT nextval(libro_secuencia) into v_id_libro;
	INSERT INTO libro( id_libro, titulo, detalle, url_imagen, id_editorial ) 
	VALUES ( v_id_libro, IN_titulo, IN_detalle, IN_url_imagen, IN_id_editorial );
END;

CREATE OR REPLACE PROCEDURE listar_libros( )
BEGIN 
	SELECT * FROM libro;
END;
	
-- --------------- Tabla libro_autor --------------------------------

CREATE TABLE libro_autor(
    id_libro    integer UNSIGNED,
    id_autor    integer UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE libro_autor 
	ADD CONSTRAINT FK_libro_autor
    FOREIGN KEY (id_autor) 
   	REFERENCES autor (id_autor);
   
ALTER TABLE libro_autor
	ADD CONSTRAINT FK_autor_libro
    FOREIGN KEY (id_libro) 
    REFERENCES libro (id_libro);
   
CREATE OR REPLACE PROCEDURE insertar_autor_libro(
	IN IN_id_libro	integer UNSIGNED,
	IN IN_id_autor	integer UNSIGNED  
)
BEGIN 
	INSERT INTO libro_autor( id_libro, id_autor ) 
	VALUES ( IN_id_libro, IN_id_autor );
END;

-- --------------- Tabla libro_genero -------------------------------

CREATE TABLE libro_genero(
    id_libro    integer UNSIGNED,
    id_genero    integer UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE libro_genero
    ADD CONSTRAINT FK_libro_genero
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro);
   
ALTER TABLE libro_genero
    ADD CONSTRAINT FK_genero_libro
    FOREIGN KEY (id_genero) REFERENCES genero (id_genero)
 
CREATE OR REPLACE PROCEDURE insertar_genero_libro(
	IN IN_id_libro	integer UNSIGNED,
	IN IN_id_genero	integer UNSIGNED  
)
BEGIN 
	INSERT INTO libro_genero( id_libro, id_genero ) 
	VALUES ( IN_id_libro, IN_id_genero );
END;

SELECT * FROM libro_genero;

-- --------------- Tabla perfil -------------------------------
    
CREATE TABLE perfil(
    id_perfil   integer UNSIGNED,
    id_usuario  integer UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE perfil
  	ADD PRIMARY KEY (id_perfil),
	ADD UNIQUE KEY (id_usuario);
 
ALTER TABLE perfil 
	ADD CONSTRAINT FK_perfil_usuario
    FOREIGN KEY (id_usuario) 
   	REFERENCES usuario (id_usuario);

CREATE OR REPLACE SEQUENCE perfil_secuencia 
INCREMENT BY 1
MINVALUE = 1
START WITH 1;

CREATE OR REPLACE PROCEDURE crear_perfil_usuario(
	IN IN_id_usuario	integer UNSIGNED  
)
BEGIN 
	DECLARE v_id_perfil integer UNSIGNED;
	SELECT nextval(perfil_secuencia) into v_id_perfil;
	INSERT INTO perfil( id_perfil, id_usuario ) 
	VALUES ( v_id_perfil, IN_id_usuario );
END;

CREATE TABLE lista_deseos(
    id_perfil   integer UNSIGNED,
    id_libro    integer UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE lista_deseos
	ADD CONSTRAINT FK_perfil_lista
    FOREIGN KEY (id_perfil) REFERENCES perfil (id_perfil);
   
ALTER TABLE lista_deseos
    ADD CONSTRAINT FK_libro_lista
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro)
    
CREATE OR REPLACE PROCEDURE agregar_libro_lista(
	IN IN_id_usuario	integer UNSIGNED,
	IN IN_id_libro		integer UNSIGNED 
)
BEGIN 
	DECLARE v_id_perfil integer UNSIGNED;

	SELECT 	id_perfil
	INTO 	v_id_perfil
	FROM 	perfil
	WHERE 	id_usuario = IN_id_usuario;
	
	INSERT INTO lista_deseos( id_perfil, id_libro ) 
	VALUES ( v_id_perfil, IN_id_libro );
END;

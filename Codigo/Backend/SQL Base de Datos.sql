----------------------- SQL Base de Datos v2 --------------------------
-----------------------------------------------------------------------

-- ---------------------- Database: `intercambio_libros` ---------------------------
--
CREATE DATABASE IF NOT EXISTS intercambio_libros 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE intercambio_libros;

-- ---------------------------------------------------------------------------------
-- -----------  Tabla usuario

CREATE TABLE usuario (
    id_usuario  integer,
    nombre      varchar(100),
    apellidos   varchar(100),
    email       varchar(100),
    password    varchar(500) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE usuario
  ADD PRIMARY KEY (id_usuario),
  ADD UNIQUE KEY (email);

ALTER TABLE usuario
  MODIFY id_usuario integer UNSIGNED NOT NULL AUTO_INCREMENT;
  
INSERT INTO usuario (nombre, apellidos, email, password) VALUES
("Diego", "Humpiri", "diego@mail.com", "123456"),
("Esthephany", "Choquehuanca", "esthephany@mail.com", "123456");

CREATE OR REPLACE PROCEDURE insertar_usuario( 
	IN  IN_nombres 		varchar(100), 
	IN 	IN_apellidos 	varchar(100),
	IN  IN_email		varchar(100),
	IN  IN_password 	varchar(500)
)
BEGIN 
	INSERT INTO usuario (nombre, apellidos, email, password) VALUES
	( IN_nombres, IN_apellidos, IN_email, IN_password );
END;

call insertar_usuario( "Pepe", "Silva", "psilva@mail.com", "123456");

CREATE OR REPLACE PROCEDURE todos_usuarios( 
)
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
-- ------------------------------------------------------------------------

CREATE TABLE genero(
    id_genero  integer,
    nombre     varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE genero
  ADD PRIMARY KEY (id_genero);
 
ALTER TABLE genero
  MODIFY id_genero integer UNSIGNED NOT NULL AUTO_INCREMENT;
  
CREATE OR REPLACE PROCEDURE insertar_genero(
	IN	IN_nombre 	varchar(100)
)
BEGIN 
	INSERT INTO genero( nombre ) 
	VALUES ( IN_nombre );
END;

call insertar_genero("Cuento");

CREATE OR REPLACE PROCEDURE listar_generos( )
BEGIN 
	SELECT * FROM genero;
END;

call listar_generos();

-- ----------------------- Tabla autor -----------------------------
 
CREATE TABLE autor(
    id_autor    integer,
    nombre      varchar(100),
    apellidos   varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE autor
  ADD PRIMARY KEY (id_autor);
 
ALTER TABLE autor
  MODIFY id_autor integer UNSIGNED NOT NULL AUTO_INCREMENT;
 
CREATE OR REPLACE PROCEDURE insertar_autor(
	IN	IN_nombre 		varchar(100), 
	IN  IN_apellidos 	varchar(100)
)
BEGIN 
	INSERT INTO autor( nombre, apellidos ) 
	VALUES ( IN_nombre, IN_apellidos );
END;

call insertar_autor("Mario", "Vargas Llosa"); 

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

-- -------------- Tabla editorial --------------------

CREATE TABLE editorial(
    id_editorial    integer,
    nombre          varchar(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE editorial
  ADD PRIMARY KEY (id_editorial);
 
ALTER TABLE editorial
  MODIFY id_editorial integer UNSIGNED NOT NULL AUTO_INCREMENT;
 
CREATE OR REPLACE PROCEDURE insertar_editorial(
	IN	IN_nombre		varchar(100)
)
BEGIN 
	INSERT INTO editorial( nombre ) 
	VALUES ( IN_nombre );
END;

call insertar_editorial("Santillana");

CREATE OR REPLACE PROCEDURE listar_editoriales( )
BEGIN 
	SELECT * FROM editorial;
END;

 -- --------------- Tabla libro  -------------------------------------

CREATE TABLE libro(
    id_libro        integer,
    titulo          varchar(300),
    detalle         varchar(500),
    url_imagen		varchar(1000),
    id_editorial    integer UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE libro
  ADD PRIMARY KEY (id_libro);
 
ALTER TABLE libro
  MODIFY id_libro integer UNSIGNED NOT NULL AUTO_INCREMENT;
 
ALTER TABLE libro 
	ADD CONSTRAINT fk_ed 
	FOREIGN KEY (id_editorial) 
	REFERENCES editorial (id_editorial);

CREATE OR REPLACE PROCEDURE insertar_libro(
	IN IN_titulo		varchar(300),
	IN IN_detalle		varchar(500),
	IN IN_url_imagen 	varchar(1000),
	IN IN_id_editorial		integer UNSIGNED  
)
BEGIN 
	INSERT INTO libro( titulo, detalle, url_imagen, id_editorial ) 
	VALUES ( IN_titulo, IN_detalle, IN_url_imagen, IN_id_editorial );
END;

CALL insertar_libro("La Casa Verde", 
"La casa verde (1966) es la segunda novela del escritor peruano Mario Vargas Llosa. La novela se caracteriza por la asimilación de las nuevas técnicas narrativas de autores europeos y estadounidenses desarrolladas a lo largo de la primera mitad del siglo XX. La obra fue acreedora del Premio Rómulo Gallegos.", 
"some url",  1 ); 

CREATE OR REPLACE PROCEDURE listar_libros( )
BEGIN 
	SELECT * FROM libro;
END;
	
-- --------------- Tabla libro_autor

CREATE TABLE libro_autor(
    id_libro    integer UNSIGNED,
    id_autor    integer UNSIGNED,
    CONSTRAINT 'FK_libro_autor'
        FOREIGN KEY (id_autor) REFERENCES autor (id_autor),
    CONSTRAINT 'FK_autor_libro'
        FOREIGN KEY (id_libro) REFERENCES autor (id_libro)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

----------------- Tabla libro_genero 

CREATE TABLE libro_genero(
    id_libro    integer UNSIGNED,
    id_genero    integer UNSIGNED,
    CONSTRAINT 'FK_libro_genero'
        FOREIGN KEY (id_libro) REFERENCES libro (id_libro),
    CONSTRAINT 'FK_genero_libro'
        FOREIGN KEY (id_genero) REFERENCES genero (id_genero)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -------------- Tabla lugar_intercambio

CREATE TABLE lugar_intercambio(
    id_lugar_intercambio    integer,
    nombre                  varchar(100),
    direccion               varchar(200),
    referencia              varchar(300),
    latitud                 decimal(8,6),
    longitud                decimal(9,6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE lugar_intercambio
  ADD PRIMARY KEY (id_lugar_intercambio);
 
ALTER TABLE lugar_intercambio
  MODIFY id_lugar_intercambio int UNSIGNED NOT NULL AUTO_INCREMENT;
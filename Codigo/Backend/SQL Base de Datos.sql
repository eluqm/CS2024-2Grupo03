-- SQL Base de Datos v1 ---------

CREATE DATABASE intercambiolibros
    WITH
    OWNER = libros
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

\c intercambiolibros

CREATE TABLE usuario
(
    id_usuario  integer GENERATED BY DEFAULT AS IDENTITY,
    nombre      varchar(100),
    apellidos   varchar(100),
    email       varchar(100),
    password    varchar(500) 
);

CREATE TABLE genero(
    id_genero  integer GENERATED BY DEFAULT AS IDENTITY,
    nombre     varchar(100)
);

CREATE TABLE autor(
    id_autor    integer GENERATED BY DEFAULT AS IDENTITY,
    nombre      varchar(100),
    apellidos   varchar(100)
);

CREATE TABLE editorial(
    id_editorial    integer GENERATED BY DEFAULT AS IDENTITY,
    nombre          varchar(200)
);

CREATE TABLE lugar_intercambio(
    id_lugar_intercambio    integer GENERATED BY DEFAULT AS IDENTITY,
    nombre                  varchar(100),
    direccion               varchar(200),
    referencia              varchar(300),
    latitud                 decimal(8,6),
    longitud                decimal(9,6)
);

CREATE TABLE libro(
    id_libro        integer GENERATED BY DEFAULT AS IDENTITY,
    titulo          varchar(300),
    detalle         varchar(500),
    id_editorial    integer,
    CONSTRAINT 'FK_libro_editorial'
        FOREIGN KEY (id_editorial) REFERENCES editorial (id_editorial)
);

CREATE TABLE libro_autor(
    id_libro    integer,
    id_autor    integer,
    CONSTRAINT 'FK_libro_autor'
        FOREIGN KEY (id_autor) REFERENCES autor (id_autor),
    CONSTRAINT 'FK_autor_libro'
        FOREIGN KEY (id_libro) REFERENCES autor (id_libro)
);

CREATE TABLE libro_genero(
    id_libro    integer,
    id_genero    integer,
    CONSTRAINT 'FK_libro_genero'
        FOREIGN KEY (id_libro) REFERENCES libro (id_libro),
    CONSTRAINT 'FK_genero_libro'
        FOREIGN KEY (id_genero) REFERENCES genero (id_genero)
);

CREATE TABLE perfil(
    id_perfil   integer GENERATED BY DEFAULT AS IDENTITY,
    id_usuario  integer,
    CONSTRAINT 'FK_perfil_usuario'
        FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE lista_deseos(
    id_perfil   integer,
    id_libro    integer,
    CONSTRAINT 'FK_perfil_libros'
        FOREIGN KEY (id_perfil) REFERENCES perfil (id_perfil),
    CONSTRAINT 'FK_libros_perfil'
        FOREIGN KEY (id_libro) REFERENCES libro (id_libro)
);

CREATE TABLE solicitud_intercambio(
    id_solicitudd           integer GENERATED BY DEFAULT AS IDENTITY,
    fecha                   timestamp,
    apectado                boolean,
    id_usuario              integer,
    id_lugar_intercambio    integer,
    id_libro                integer
);
CREATE TABLE lista_deseos(
    id_perfil  integer GENERATED BY DEFAULT AS IDENTITY,
);
CREATE TABLE lista_deseos(
    id_perfil  integer GENERATED BY DEFAULT AS IDENTITY,
);
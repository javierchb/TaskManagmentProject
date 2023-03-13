/**
** Base de datos: SQL Server
** Creador: Javier Ignacio Aldunate Mengual
** Fecha creación: 12/03/2023
** Fecha de modificación: 00/00/0000
** Ambientes:
** >> Local
**/
create table tb_estado_tarea(
    id_estado_tarea INTEGER NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);
create table tb_complejidad_tarea(
    id_complejidad_tarea INTEGER NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);
create table tb_tipo_tarea(
    id_tipo_tarea INTEGER NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);
create table tg_usuario(
    id_usuario INTEGER NOT NULL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100) NOT NULL,
    nombre_usuario VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    fono VARCHAR(100) NOT NULL,
    contrasenha VARCHAR(255) NOT NULL
);
create table tg_grupo_tarea(
    id_grupo_tarea INTEGER NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    id_estado_tarea_grupo INTEGER NOT NULL,
    FOREIGN KEY (id_estado_tarea_grupo) REFERENCES tb_estado_tarea(id_estado_tarea)
);

create table tg_tarea(
    id_tarea INTEGER NOT NULL PRIMARY KEY
)

/**
** Base de datos: SQL Server
** Nombre base de datos: db_dev_gestion_tareas
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
    id_estado_tarea INTEGER NOT NULL,
    FOREIGN KEY (id_estado_tarea) REFERENCES tb_estado_tarea(id_estado_tarea)
);
create table tg_tarea(
    id_tarea INTEGER NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    observacion VARCHAR(255) NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_hasta DATETIME NOT NULL,
    fecha_termino DATETIME NOT NULL
);
create table tc_tarea_hijo(
    id_tarea_hijo INTEGER NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);
create table tc_tarea_nieto(
    id_tarea_nieto INTEGER NOT NULL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);
create table tr_tarea_tarea_hijo(
    id_tarea INTEGER NOT NULL,
    id_tarea_hijo INTEGER NOT NULL,
    FOREIGN KEY (id_tarea) REFERENCES tg_tarea(id_tarea),
    FOREIGN KEY (id_tarea_hijo) REFERENCES tc_tarea_hijo(id_tarea_hijo)
);

alter table tr_tarea_tarea_hijo
add constraint pk_tarea_tarea_hijo primary key (id_tarea, id_tarea_hijo);

create table tr_tarea_hijo_tarea_nieto(
    id_tarea_hijo INTEGER NOT NULL,
    id_tarea_nieto INTEGER NOT NULL,
    FOREIGN KEY (id_tarea_hijo) REFERENCES tc_tarea_hijo(id_tarea_hijo),
    FOREIGN KEY (id_tarea_nieto) REFERENCES tc_tarea_nieto(id_tarea_nieto)
);

alter table tr_tarea_hijo_tarea_nieto
add constraint pk_tarea_hijo_tarea_nieto primary key (id_tarea_hijo, id_tarea_nieto);

create table tb_periodicidad_tarea(
    id_periodo_tarea INTEGER NOT NULL PRIMARY KEY,
    periodo CHAR(1) NOT NULL
);

-- alter table a tablas tarea, tarea hijo y tarea nieto.
-- tg_tarea
alter table tg_tarea
add periodo_dias VARCHAR(25);
-- tc_tarea_hijo
alter table tc_tarea_hijo
add id_periodo_tarea INTEGER NOT NULL;

alter table tc_tarea_hijo
add constraint fk_periodo_tarea_hijo
foreign key (id_periodo_tarea) references tb_periodicidad_tarea(id_periodo_tarea);

alter table tc_tarea_hijo
add periodo_dias VARCHAR(25);
-- tc_tarea_nieto
alter table tc_tarea_nieto
add periodo_dias VARCHAR(25);
-- Insert tablas básicas
insert into tb_periodicidad_tarea(id_periodo_tarea, periodo) values (1,'1');
insert into tb_periodicidad_tarea(id_periodo_tarea, periodo) values (2,'2');
insert into tb_periodicidad_tarea(id_periodo_tarea, periodo) values (3,'3');
insert into tb_periodicidad_tarea(id_periodo_tarea, periodo) values (4,'4');
insert into tb_periodicidad_tarea(id_periodo_tarea, periodo) values (5,'5');
insert into tb_periodicidad_tarea(id_periodo_tarea, periodo) values (6,'6');
insert into tb_periodicidad_tarea(id_periodo_tarea, periodo) values (7,'7');
-- Insert tarea
insert into tg_tarea(id_tarea, descripcion, observacion, fecha_inicio, fecha_hasta, fecha_termino) values (1, 'Tareas', 'Mantener orden & ordenar pieza', '2023-01-28','2024-01-28', '2024-01-28');
-- Insert tarea hijo
insert into tc_tarea_hijo(id_tarea_hijo, descripcion, id_periodo_tarea) values (1, 'Pieza principal', 3);
insert into tc_tarea_hijo(id_tarea_hijo, descripcion, id_periodo_tarea) values (2, 'Pieza trabajo', 3);
insert into tc_tarea_hijo(id_tarea_hijo, descripcion, id_periodo_tarea) values (3, 'Baño', 3);
insert into tc_tarea_hijo(id_tarea_hijo, descripcion, id_periodo_tarea) values (4, 'Cocina', 3);
insert into tc_tarea_hijo(id_tarea_hijo, descripcion, id_periodo_tarea) values (5, 'Living', 3);
-- Insert tarea nieto
insert into tc_tarea_nieto(id_tarea_nieto, descripcion) values(1, 'Limpiar escritorio');
insert into tc_tarea_nieto(id_tarea_nieto, descripcion) values(2, 'Aspirar piso');
insert into tc_tarea_nieto(id_tarea_nieto, descripcion) values(3, 'Limpiar accesorios (Teclado, mouse, mousepad, etc)');
insert into tc_tarea_nieto(id_tarea_nieto, descripcion) values(4, 'Ordenar escritorio');
-- Insert relacion tarea - tarea hijo
insert into tr_tarea_tarea_hijo(id_tarea, id_tarea_hijo) values (1,1);
insert into tr_tarea_tarea_hijo(id_tarea, id_tarea_hijo) values (1,2);
insert into tr_tarea_tarea_hijo(id_tarea, id_tarea_hijo) values (1,3);
insert into tr_tarea_tarea_hijo(id_tarea, id_tarea_hijo) values (1,4);
-- Insert relacion tarea hijo - tarea nieto
insert into tr_tarea_hijo_tarea_nieto (id_tarea_hijo, id_tarea_nieto) values (1, 1);
insert into tr_tarea_hijo_tarea_nieto (id_tarea_hijo, id_tarea_nieto) values (1, 2);
insert into tr_tarea_hijo_tarea_nieto (id_tarea_hijo, id_tarea_nieto) values (1, 3);
insert into tr_tarea_hijo_tarea_nieto (id_tarea_hijo, id_tarea_nieto) values (1, 4);
-- Insert usuario
insert into tg_usuario(id_usuario, nombres, apellido_paterno, apellido_materno, nombre_usuario, correo, fono, contrasenha)
values (1, 'Javier Ignacio', 'Aldunate', 'Mengual', 'Javierchb', 'javierig.am@gmai.com', '+569 3393 2697', 'admin123');
-- Drop constraint llaves foraneas y columnas tg_tarea
/**
alter table nombreTabla
drop constraint nombreConstraint;
alter table nombreTabla
drop column nombreColumna;
**/
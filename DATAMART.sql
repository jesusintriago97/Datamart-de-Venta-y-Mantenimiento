/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     9/6/2022 10:35:07                            */
/*==============================================================*/


drop table if exists DIM_EMPLEADO;

drop table if exists DIM_MANTENIMIENTO;

drop table if exists DIM_TIEMPO;

drop table if exists HECH_SATISFACCION;

/*==============================================================*/
/* Table: DIM_EMPLEADO                                          */
/*==============================================================*/
create table DIM_EMPLEADO
(
   ID_EMPLEADO          int not null,
   NOM_EMPLEADO         varchar(40),
   primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: DIM_MANTENIMIENTO                                     */
/*==============================================================*/
create table DIM_MANTENIMIENTO
(
   ID_MANTENIMIENTO     int not null,
   COSTO_MANT           float,
   COND_MANT            varchar(50),
   primary key (ID_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: DIM_TIEMPO                                            */
/*==============================================================*/
create table DIM_TIEMPO
(
   ID_TIEMPO            date not null,
   ANIO                 int not null,
   MES                  int,
   primary key (ID_TIEMPO)
);

/*==============================================================*/
/* Table: HECH_SATISFACCION                                     */
/*==============================================================*/
create table HECH_SATISFACCION
(
   ID_MANTENIMIENTO     int not null,
   ID_EMPLEADO          int not null,
   ID_TIEMPO            date not null,
   HECHO                varchar(20),
   primary key (ID_MANTENIMIENTO, ID_EMPLEADO, ID_TIEMPO)
);

alter table HECH_SATISFACCION add constraint FK_D_EMPLEADO_HECHO foreign key (ID_EMPLEADO)
      references DIM_EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table HECH_SATISFACCION add constraint FK_D_MANT_SATISF foreign key (ID_MANTENIMIENTO)
      references DIM_MANTENIMIENTO (ID_MANTENIMIENTO) on delete restrict on update restrict;

alter table HECH_SATISFACCION add constraint FK_D_TIEMPO_HECHO foreign key (ID_TIEMPO)
      references DIM_TIEMPO (ID_TIEMPO) on delete restrict on update restrict;


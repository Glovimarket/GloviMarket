create database glovimarket;
use glovimarket;
create table adm(
    id_adm varchar(20) not null,
    primer_nombre_adm varchar (20)not null,
    segundo_nombre_adm varchar (20) null,
    primer_apellido_adm varchar (20) not null,
    segundo_apellido_adm varchar (20) null,
    telefono_adm varchar(12)not null,
    direccion_adm varchar(40)not null,
    email_adm varchar (50)not null,
    contraseña_adm varchar (20)not null,
    primary key (id_adm)
);

create table categoria_producto(
    id_categoria int (5)not null,
    nombre_categoria varchar(50)not null,
    primary key (id_categoria)
);

create table producto(
    id_producto int(5)not null,
    nombre_producto varchar(20)not null,
    id_categoria_fk int (5)not null,
    existencia varchar(3)not null,
    valor_unitario varchar(20)not null,
    descripcion varchar (40)not null,
    id_adm_fk varchar (20) null,
    primary key (id_producto)
);

create table cliente(
    id_cliente varchar(20) not null,
    primer_nombre_cli varchar (20)not null,
    segundo_nombre_cli varchar (20)null,
    primer_apellido_cli varchar (20)not null,
    segundo_apellido_cli varchar (20) null,
    telefono_cli varchar(12)not null,
    dirccion_cli varchar (40) not null,
    email_cli varchar(50)not null,
    contraseña_cli varchar(20)not null,
    primary key (id_cliente)
);

create table vendedor(
    id_vendedor varchar(20) not null,
    primer_nombre_vend varchar (20)not null,
    segundo_nombre_vend varchar (20) null,
    primer_apellido_vend varchar (20)not null,
    segundo_apellido_vend varchar (20) null,
    telefono_vend varchar(12)not null,
    direccion_vend varchar(40)not null,
    email_vend varchar(50)not null,
    contraseña_vend varchar(20)not null,
    primary key (id_vendedor)
);

create table factura(
    id_factura int(5)not null auto_increment,
    id_cliente_fk varchar(20) not null,
    id_producto_fk int(5)not null,
    id_vendedor_fk varchar(20) not null,
    fecha date not null,
    cantidad int(4)not null,
    valor_unitario_fk varchar(20)not null,
    valor_total int(10)not null,
    primary key (id_factura)
);

 alter table producto add
    constraint relacion_producto_categoria_producto
    foreign key (id_categoria_fk)
    references categoria_producto (id_categoria);

 alter table producto add
    constraint relacion_producto_admin
    foreign key (id_adm_fk)
    references adm (id_adm);

 alter table factura add
    constraint relacion_factura_cliente
    foreign key (id_cliente_fk)
    references cliente (id_cliente);

alter table factura add
    constraint relacion_factura_producto
    foreign key (id_producto_fk)
    references producto (id_producto);

alter table factura add
    constraint relacion_factura_vendedor
    foreign key (id_vendedor_fk)
    references vendedor (id_vendedor);

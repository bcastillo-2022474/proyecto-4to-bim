/*
	Joao Castillo
    2022135
    14/07/2023
*/

drop
    database if exists DBJavaEEVentas2022135;
create
    database DBJavaEEVentas2022135;

use
    DBJavaEEVentas2022135;

create table Cliente
(
    codigoCliente    int          not null auto_increment,
    DPICliente       varchar(15)  not null,
    nombresCliente   varchar(200) not null,
    direccionCliente varchar(150) not null,
    estado           varchar(1)   not null,
    primary key PK_codigoCliente (codigoCliente)
);

create table Empleado
(
    codigoEmpleado   int          not null auto_increment,
    DPIEmpleado      varchar(15)  not null,
    nombresEmpleado  varchar(200) not null,
    telefonoEmpleado varchar(8),
    estado           varchar(1)   not null,
    usuario          varchar(15)  not null,
    primary key PK_codigoEmpleado (codigoEmpleado)
);

create table Producto
(
    codigoProducto int          not null auto_increment,
    nombreProducto varchar(200) not null,
    precio         double       not null,
    stock          int          not null,
    estado         varchar(1)   not null,
    primary key PK_codigoProducto (codigoProducto)
);

create table Venta
(
    codigoVenta    int         not null auto_increment,
    numeroSerie    varchar(55) not null,
    fechaVenta     date        not null,
    monto          double      not null,
    estado         varchar(1)  not null,
    codigoCliente  int         not null,
    codigoEmpleado int         not null,
    primary key PK_codigoVenta (codigoVenta),
    constraint FK_Venta_Cliente foreign key (codigoCliente)
        references Cliente (codigoCliente),
    constraint FK_Venta_Empleado foreign key (codigoEmpleado)
        references Empleado (codigoEmpleado)
);

create table DetalleVenta
(
    codigoDetalleVenta int    not null auto_increment,
    codigoProducto     int    not null,
    cantidad           int    not null,
    precioVenta        double not null,
    codigoVenta        int    not null,
    primary key PK_codigoDetalleVenta (codigoDetalleVenta),
    constraint FK_DetalleVenta_Producto foreign key (codigoProducto)
        references Producto (codigoProducto),
    constraint FK_DetalleVenta_Venta foreign key (codigoVenta)
        references Venta (codigoVenta)
);

insert into Cliente (DPICliente, nombresCliente, direccionCliente, estado)
values ('1579420230101', 'Pedro Armas', 'Mixco, Guatemala', '1');
insert into Cliente (DPICliente, nombresCliente, direccionCliente, estado)
values ('1579123450108', 'Luis Olmedo', 'Guatemala, Guatemala', '1');
insert into Cliente (DPICliente, nombresCliente, direccionCliente, estado)
values ('1579987450102', 'Jorge Tala', 'Sacatepequez, Guatemala', '1');
insert into Cliente (DPICliente, nombresCliente, direccionCliente, estado)
values ('1579257410107', 'Mario Rodriguez', 'Villa Nueva, Guatemala', '1');


insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario)
values ('1234', 'Joao Castillo', '50110425', '1', 'jcastillo');
insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario)
values ('1579663520108', 'Pedro Hernandez', '54879632', '1', 'phernandez01');
insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario)
values ('1579457820107', 'Rony Godinez', '43210509', '1', 'rgod15');
insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario)
values ('1579558740106', 'Palermo Suarez', '24587963', '1', 'psuarez25');
insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario)
values ('1579663520108', 'Luisa Aragon', '36251478', '1', 'laragon40');



insert into Producto (nombreProducto, precio, stock, estado)
values ('Teclado Durabrand', 105.00, 25, '1');
insert into Producto (nombreProducto, precio, stock, estado)
values ('Mouse inhalambrico Microfost', 74.50, 15, '1');
insert into Producto (nombreProducto, precio, stock, estado)
values ('Laptop Acer Nitro 5', 9850.00, 5, '1');
insert into Producto (nombreProducto, precio, stock, estado)
values ('Monitor Haier 32"', 1225.80, 60, '1');


select *
from Cliente;
select *
from Producto;

select *
from Empleado;
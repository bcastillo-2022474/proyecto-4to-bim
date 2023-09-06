drop database if exists DB2022_474;
create database DB2022_474;

use DB2022_474;

create table Client
(
    id      int auto_increment,
    DPI     varchar(15)  not null,
    names   varchar(50)  not null,
    address varchar(150) not null,
    # state varchar(1) not null,

    primary key (id)
);

create table Employee
(
    id           int auto_increment,
    DPI          varchar(15)  not null,
    names        varchar(50)  not null,
    phone_number varchar(8)   not null,
    address      varchar(150) not null,
    # state varchar(1) not null,
    username     varchar(50)  not null,
    img_path     varchar(150) not null,

    primary key (id)
);

create table Product
(
    id           int auto_increment,
    product_name varchar(200)   not null,
    price        decimal(10, 2) not null,
    stock        int            not null,
    # state varchar(1) not null,

    primary key (id)
);

create table Sale
(
    id            int auto_increment,
    serial_number varchar(55)    not null,
    date_sale     date           not null,
    total         decimal(10, 2) not null,
    # state varchar(1) not null,

    _client_id    int            not null,
    _employee_id  int            not null,

    primary key (id),
    foreign key (_client_id) references Client (id),
    foreign key (_employee_id) references Employee (id)
);

create table SaleDetails
(
    id          int auto_increment,
    quantity    int            not null,
    subtotal    decimal(10, 2) not null,

    _product_id int            not null,
    _sale_id    int            not null,

    primary key (id),
    foreign key (_product_id) references Product (id),
    foreign key (_sale_id) references Sale (id)
);

insert into Client(DPI, names, address)
values ('123456789123456', 'Pedro Armas', 'Mixco, Guatemala'),
       ('321654987312654', 'Juan Perez', 'Guatemala, Guatemala'),
       ('741852963852741', 'Maria Lopez', 'Villa Nueva, Guatemala');

insert into Employee(DPI, names, phone_number, address, username, img_path)
values ('1234', 'Joao Castillo', '54328553', 'Guatemala, Mixco', 'jcastillo', ''),
       ('4321', 'Juan Perez', '14785364', 'Villa Nueva', 'jperez', ''),
       ('5678', 'Maria Lopez', '15697534', 'Antigua Guatemala','mlopez', ''),
       ('1234', 'Luis Monterroso', '74196355', 'Amatitlan', 'lmonterroso', '');

insert into Product(product_name, price, stock)
values ('Teclado Durabrand', 105.00, 25),
       ('Mouse inhalambrico Microfost', 74.50, 15),
       ('Laptop Acer Nitro 5', 9850.00, 5),
       ('Monitor Samsung 24"', 1250.00, 10),
       ('Impresora HP', 750.00, 10),
       ('Disco Duro 1TB', 450.00, 7),
       ('Memoria RAM 8GB', 350.00, 10),
       ('Memoria RAM 16GB', 550.00, 32),
       ('Memoria RAM 32GB', 750.00, 4),
       ('Memoria RAM 64GB', 1250.00, 8);

select * from Client;
select * from Employee;
select * from Product;

select * from Employee where DPI = '1234' and username  = 'jcastillo';
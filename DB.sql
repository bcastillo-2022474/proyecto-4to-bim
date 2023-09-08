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
    id               int auto_increment,
    DPI              varchar(15)   not null,
    names            varchar(50)   not null,
    phone_number     varchar(8)    not null,
    address          varchar(150)  not null,
    # state varchar(1) not null,
    username         varchar(50)   not null,
    img_path         varchar(150)  not null,
    self_description varchar(3000) not null default 'No hay descripcion aun',

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
values ('1234', 'Joao Castillo', '54328553', 'Guatemala, Mixco', 'jcastillo', 'img/jcastillo.png'),
       ('1234', 'Alejandro Jimenez', '54328553', 'Guatemala, Mixco', 'jjimenez', 'img/jjimenez.png'),
       ('1234', 'Jonathan Domingo', '54328553', 'Guatemala, Mixco', 'jdomingo', 'img/jdomingo.png'),
       ('4321', 'Juan Perez', '14785364', 'Villa Nueva', 'jperez', ''),
       ('5678', 'Maria Lopez', '15697534', 'Antigua Guatemala', 'mlopez', ''),
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

select *
from Client;
select *
from Employee;
select *
from Product;

create table CarSales
(
    id          int auto_increment primary key,
    employee_id int not null,
    quantity    int not null,

    foreign key (employee_id) references Employee (id)
);

UPDATE Employee
set self_description =
        'Conozcan a Alejandro Jiménez, un talentoso y dedicado programador de 18 años con una pasión por la codificación que no conoce límites. Alejandro es un estudiante en la Universidad Kinal, donde está persiguiendo una carrera en ciencias de la computación y perfeccionando sus habilidades de programación para dar forma al futuro de la tecnología.

        La travesía de Alejandro en el mundo de la programación comenzó a una edad temprana. Desde niño, siempre estuvo fascinado por el funcionamiento interno de las computadoras y las infinitas posibilidades que ofrecen. Su curiosidad lo llevó a experimentar con el código, y rápidamente se dio cuenta de que tenía un talento innato. Desde entonces, ha estado en un viaje emocionante y gratificante de autodescubrimiento a través del mundo del desarrollo de software.

        Una de las cosas notables de Alejandro es su determinación inquebrantable. Aborda cada desafío de codificación con una mezcla de entusiasmo y tenacidad, decidido a encontrar soluciones innovadoras a problemas complejos. Su amor por resolver problemas es lo que lo impulsa a quedarse despierto hasta altas horas de la noche, codificando mientras saborea su taza de café favorita.

        La dedicación de Alejandro a su oficio solo es igualada por su personalidad cálida y amigable. Es conocido por su gran sentido del humor, siempre rápido con un comentario ingenioso o un chiste inteligente para alegrar la habitación. Sus amigos a menudo bromea que es un espectáculo de comedia ambulante. La risa de Alejandro es contagiosa, y tiene una habilidad extraordinaria para llevar alegría a quienes lo rodean.

        En su tiempo libre, Alejandro disfruta asistiendo a reuniones de programadores y hackatones, donde puede colaborar con otros programadores en proyectos emocionantes. Cree en el poder de la diversidad en la tecnología y apoya activamente iniciativas destinadas a hacer que el campo sea más inclusivo para todos. Es un firme defensor de los derechos LGBTQ+ y se enorgullece de quién es, fomentando un ambiente de aceptación y comprensión entre sus amigos y compañeros.

        La travesía de Alejandro como programador apenas comienza, y el futuro le depara posibilidades ilimitadas. Ya sea escribiendo líneas elegantes de código o compartiendo risas con amigos, Alejandro Jiménez es un brillante ejemplo de cómo la pasión, la dedicación y una perspectiva positiva pueden tener un impacto significativo tanto en el mundo de la tecnología como en las personas que lo rodean.'
where username = 'jjimenez';


UPDATE Employee
set self_description =
        '¡Hola! Soy João, un entusiasta programador que se siente completamente en su elemento en el emocionante mundo del desarrollo frontend. Me encanta fusionar mi creatividad con la lógica del código para crear interfaces visualmente atractivas y experiencias de usuario intuitivas. Cada línea de código que escribo es como un pincelazo en un lienzo digital.

    Cuando no estoy sumergido en el código y el diseño, me encontrarás inmerso en mi otra pasión: el fútbol. Desde patear el balón en el campo hasta seguir de cerca los partidos de mi equipo favorito, el fútbol es mi forma de desconectar y recargar energías para enfrentar nuevos desafíos tecnológicos.

    La determinación es lo que mejor me describe, tanto en mi carrera profesional como en el deporte. Siempre estoy listo para abrazar nuevas oportunidades en el desarrollo web, dispuesto a aprender y mantenerme al tanto de las últimas tendencias en el ámbito frontend. Mi capacidad para trabajar en equipo y mi pasión por la innovación me convierten en un activo valioso para cualquier proyecto en el que participe. ¡Vamos a crear algo grandioso!'
where username = 'jcastillo';

UPDATE Employee
set self_description =
        'Conozcan a Jonathan Domingo, un estudiante de casi 18 años que comparte aulas y pasillos en la Universidad Kinal. A pesar de su talento como programador, Jonathan tiene una personalidad peculiar que lo hace destacar de manera única.

    Jonathan es lo que algunos podrían llamar un "pecho frío" cuando se trata de partidos de fútbol. En los momentos cruciales de un partido importante, tiende a desaparecer misteriosamente del campo de juego. Sus amigos y compañeros de equipo lo llaman "pecho frio", ya que parece tener un talento especial para esfumarse cuando más se le necesita en el campo.

    Fuera del campo de fútbol, Jonathan también muestra una tendencia a no cumplir con las salidas planeadas con amigos. A veces, sus amigos lo esperan en vano en las reuniones o eventos, ya que a veces decide cancelar o simplemente no aparecer. Esta costumbre de "desaparición" ocasional ha llevado a que lo llamen cariñosamente "pecho frio".

    A pesar de estos rasgos peculiares, Jonathan es un estudiante de programación. Cuando se enfoca en su trabajo, puede destacar y lograr resultados notables. Su pasión por la codificación y su habilidad en el fútbol son dos aspectos muy diferentes de su vida, y cada uno de ellos lo muy importantes en su vida.'
where username = 'jdomingo';
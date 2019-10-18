use countries_cities;
create table countries (
    id INT auto_increment NOT NULL PRIMARY key,
    countrie varchar(150) unique
);
create table regions (
    _countrie_ INT auto_increment NOT NULL PRIMARY key,
    region varchar(150) NOT NULL
);

create table citys (
    _region_ INT auto_increment NOT NULL PRIMARY key,
    city varchar(150) NOT NULL,
    town varchar(150) unique,
    village varchar(150) unique
);

insert countries (countrie)
values ("Russia"), ("Ukraine"), ("Belarus");

insert regions (region)
values ("Kurskay"), ("Vinnytsia"), ("Brestay");

insert citys (city)
values ("Zheleznogorsk"), ("Kazatin"), ("Pinsk");

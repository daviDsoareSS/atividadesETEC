drop table usuarios;
drop table autores;
drop table usuarios;

create table livros(
    id serial primary key,
    titulo varchar(100) NOT NULL,
    autor_id integer NOT NULL REFERENCES autores(id)
);

create table autores(
    id serial primary key,
    nome varchar(100) NOT NULL
);

create table usuarios(
    id serial primary key,
    nome varchar(100) NOT NULL
);


insert into livros (titulo, autor_id) values ('Sete Ossos',1);
insert into livros (titulo, autor_id) values ('Dracula',2); 
insert into livros (titulo, autor_id) values ('O exorcista',3);
insert into autores (nome) values ('Amanda Strausz');
insert into autores (nome) values ('Bram Stoker');
insert into autores (nome) values ('William Peter Blatty');

select * from autores;
select * from usuarios;



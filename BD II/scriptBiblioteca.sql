drop table emprestimo;
drop table livros;
drop table usuarios;


drop table autores;

create table autores(
    id_autores serial,
    nome varchar(100) NOT NULL,
    PRIMARY KEY (id_autores)
);
create table livros(
    id_livro serial PRIMARY KEY ,
    titulo varchar(100) NOT NULL,
    id_autores integer NOT NULL REFERENCES autores(id_autores) ON UPDATE CASCADE
);
create table usuarios(
    id_usuario serial PRIMARY KEY,
    nome varchar(100) NOT NULL,
    idade int
);

create table emprestimo(
    codigo_livro serial NOT NULL REFERENCES livros(id_livro),
    id_emprestimo int PRIMARY KEY,
    data_empres date,
    data_devolu date,
    situacao_livro varchar(15),
    codigo_usuario serial NOT NULL,
    FOREIGN KEY (codigo_usuario) REFERENCES usuarios(id_usuario)
  
);

insert into usuarios (id_usuario , nome , idade) values (1,'David', 18);
insert into usuarios (id_usuario , nome , idade) values (2,'Gabriela', 20);
insert into usuarios (id_usuario , nome , idade) values (3,'Julia', 19);
insert into usuarios (id_usuario , nome , idade) values (4,'Joao', 14);
insert into usuarios (id_usuario , nome , idade) values (5,'Maria', 10);
insert into usuarios (id_usuario , nome , idade) values (6,'Guilherme', 23);
insert into usuarios (id_usuario , nome , idade) values (7,'Lucas', 46);
insert into usuarios (id_usuario , nome , idade) values (8,'Dani', 25);
insert into usuarios (id_usuario , nome , idade) values (9,'Brenda', 19);
insert into usuarios (id_usuario , nome , idade) values (10,'Camille', 35);

insert into autores (nome) values ('Rosa Amanda Strausz');
insert into autores (nome) values ('Cressida Cowell');
insert into autores (nome) values ('C. J. Tudor');
insert into autores (nome) values ('Charles Duhigg ');
insert into autores (nome) values ('Sun Tzu');
insert into autores (nome) values ('R.J Palacio');
insert into autores (nome) values ('Jose Mauro de Vasconcelos ');
insert into autores (nome) values ('Harper Lee');
insert into autores (nome) values ('Markus Zusak');
insert into autores (nome) values ('Douglas Adams');

insert into livros (id_autores, titulo, id_livro) values (1,'Sete Ossos',1);
insert into livros (id_autores, titulo, id_livro) values (2,'Como treinar o seu dragao',2);
insert into livros (id_autores, titulo, id_livro) values (3,'O Homem de Giz',3);
insert into livros (id_autores, titulo, id_livro) values (4,'O poder do habito',4);
insert into livros (id_autores, titulo, id_livro) values (5,'A arte da guerra',5);
insert into livros (id_autores, titulo, id_livro) values (6,'Extraordinario',6);
insert into livros (id_autores, titulo, id_livro) values (7,'O Meu Pe de Laranja Lima',7);
insert into livros (id_autores, titulo, id_livro) values (8,'O sol e para todos',8);
insert into livros (id_autores, titulo, id_livro) values (9,'A menina que roubava livros',9);
insert into livros (id_autores, titulo, id_livro) values (10,'O guia do mochileiro das galaxias',10);


insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (1,'2022-05-10','2022-06-05', 'DISPONIVEL');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (5,'2022-04-10','2022-05-15', 'EMPRESTADO');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (2,'2022-05-05','2022-05-25', 'DISPONIVEL');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (8,'2022-05-09','2022-06-01', 'EMPRESTADO');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (3,'2022-05-13','2022-06-20', 'EMPRESTADO');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (9,'2022-05-17','2022-06-30', 'DISPONIVEL');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (7,'2022-05-01','2022-06-01', 'EMPRESTADO');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (6,'2022-05-27','2022-07-02', 'EMPRESTADO');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (4,'2022-05-03','2022-05-20', 'DISPONIVEL');
insert into emprestimo (id_emprestimo, data_empres, data_devolu, situacao_livro ) values (10,'2022-05-07','2022-06-02', 'EMPRESTADO');
 

select * from livros;
select * from autores;
select * from usuarios;

select DISTINCT
emprestimo.id_emprestimo,
emprestimo.data_empres,
emprestimo.data_devolu,
emprestimo.codigo_livro,
emprestimo.situacao_livro,
usuarios.id_usuario,
usuarios.nome,
usuarios.idade

from emprestimo JOIN usuarios ON (usuarios.idade < 18)
 WHERE emprestimo.situacao_livro = 'EMPRESTADO'
 LIMIT 2
;

--Desafio SQL 1
-- O nome do banco é romullus
-- Qual DDL deve ser utilizado?
-- codifique a DDL:

create database romullus;
use romullus;
--Desafio SQL 2
-- Agora você precisa executar o seguinte comando: create database wsbrasil;
-- Como executar esse comando usando CREATE e DROP com uma condição? Se o banco existir drop e cria, ou se o banco não existe crie.
-- se não existe crie
--se existe drop e crie

--situação 1
--só criar o banco se não existir, se existir deixa

--Algoritmos
--É um conjunto de passos finitos para a realização de uma tarefa.
if not exists (select name from master.dbo.sysdatabases where name = 'wsbrasil')
	create database wsbrasil
else
	print 'banco já existe';


if not exists (select name from master.dbo.sysdatabases where name = 'Romullus')
	create database wsbrasil
else
	print 'banco já existe';


--Desafio sql 3
--Considerando o banco de dados Romullus e considerando o modelo físico derado pelo BRModelo, faça as adaptações para TSQL e implemente no SQL server o seu.


create table ContatoSite(
	id INT primary key identity (1,1),
	nome Varchar(80), --not null
	email Varchar(80), --not null
	mensagem TEXT, --not null
	dataHora Datetime, --not null
	fk_TipoContato_id INT
);

create table TipoContato(
	id INT primary key identity (1,1),
	nome Varchar(80) --not null
);

alter table ContatoSite add constraint FK_ContatoSite_2
	foreign key (fk_TipoContato_id)
	references TipoContato (id)
	on delete cascade;
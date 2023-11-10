use romullus;

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

drop table ContatoSite;

--O que � preciso para criar um algoritmo
--Objetivo do algoritmo: mostrar uma mensagem "Al� mundo!"
--Primeiro vamos declarar o procedimento.
--In�cio

--Fim
--Procedure � uma DDL (DataDefinition Language)
-- verifica se a procedure existe e a exclui, se existir
if object_id('AloMundo') is not null
	drop procedure AloMundo;
go

--cria procedure
create procedure Alomundo
as
begin
-- corpo da procedure
	print 'Alo Mundo!';
end;
go
exec AloMundo;

--cria nova procedure com vari�vel

CREATE PROCEDURE AloMundoComVariavel
AS
BEGIN
	--Declara��o da vari�vel
	DECLARE @mensagem VARCHAR(100);
	SET @mensagem = 'Al� Mundo!';
	--exibindo mensagem
	PRINT @mensagem;
END;
GO

exec AloMundoComVariavel;

/*
Um algoritmo deve realizar a soma de dois n�meros sendo o primeiro X e o segundo Y.
Qual o nome dessa stored procedure?

soma_dois_numeros

Quais vari�veis voc� pensa em declarar?

@x: n�mero inteiro
@y: n�mero inteiro

Quais os tipos dessas vari�veis?

@x: int
@y: int

Qual operador utilizar(+ - * /)?

+

Qual a sa�da de dados PRINT?

A soma de @x e @y � @soma

*/

if object_id('Soma') is not null
	drop procedure Soma;
go

create procedure Soma
as
begin
	declare @x INT
	declare @y INT
	declare @resultado INT

	set @x = 5
	set @y = 2
	set @resultado = @x + @y ;

	print 'O resultado da soma entre ' + CAST(@x AS VARCHAR) + ' e ' + CAST(@y AS VARCHAR) + ' � igual a ' + CAST(@resultado AS VARCHAR) + '.';
end;
go

exec Soma;

-- Vers�o do professor R�mulo do exerc�cio acima
Procedure de ontem:

CREATE PROCEDURE SomarNumeros 
    @X INT, 
    @Y INT
AS
BEGIN
    SELECT @X + @Y AS Soma;
END;

EXEC SomarNumeros @X = 10, @Y = 20;
--.........................................................................................................................

--09/11/2023
select * from ContatoSite;
Select * from TipoContato;

--n�o encontrei o im�vel
--n�o encontrei o vendedor
--quero vender
--critica
--sugest�es


if object_id('InserirDado', 'P') is not null
	drop procedure InserirDado;
go


--criando procedure
create procedure InserirDado
@nome varchar(80)
as -- inicia a procedure

begin -- in�cio do bloco da procedure
	insert into TipoContato(nome) values (@nome);
end; --fim do bloco dda procedure

--chamando a procedure
exec InserirDado @nome = 'N�o encontrei o im�vel';
exec InserirDado @nome = 'N�o encontrei o vendedor';
exec InserirDado @nome = 'Quero vender';
exec InserirDado @nome = 'Critica';
exec InserirDado @nome = 'Sugest�es';


if object_id('DeletaDado', 'P') is not null
	drop procedure DeletaDado;
go

create procedure DeletaDado
@id_tipo int
as
begin
	delete from TipoContato 
	where id = @id_tipo
end;

exec DeletaDado @id_tipo = 11;


insert into ContatoSite (nome, email, mensagem, dataHora,fk_TipoContato_id) values 
('Jo�o Silva', 'joao.silva@gmail.com', 'Gostaria de saber mais sobre seus produtos', '2023-11-09 09:35:00', 1),
('Maria Santos', 'maria.santos@hotmail.com', 'Quero fazer uma reclama��o sobre o atendimento', '2023-11-09 09:40:00', 2),
('Pedro Costa', 'pedro.costa@yahoo.com', 'Parab�ns pelo excelente trabalho', '2023-11-09 09:45:00', 3),
('Ana Lima', 'ana.lima@outlook.com', 'Preciso de um or�amento para um projeto', '2023-11-09 09:50:00', 4),
('Bruno Dias', 'bruno.dias@uol.com.br', 'Tenho uma d�vida sobre a forma de pagamento', '2023-11-09 09:55:00', 5),
('Carla Souza', 'carla.souza@bol.com.br', 'Quero cancelar minha compra', '2023-11-09 10:00:00', 1),
('Daniel Oliveira', 'daniel.oliveira@terra.com.br', 'Gostaria de fazer uma sugest�o de melhoria', '2023-11-09 10:05:00',2),
('Eduarda Rocha', 'eduarda.rocha@icloud.com', 'Quero elogiar o atendimento do vendedor', '2023-11-09 10:10:00',3),
('Fabio Martins', 'fabio.martins@globo.com', 'Preciso de ajuda para resolver um problema', '2023-11-09 10:15:00',4),
('Gabriela Alves', 'gabriela.alves@zoho.com', 'Quero fazer uma parceria com sua empresa', '2023-11-09 10:20:00',5);


if object_id('AlteraDado', 'P') is not null
	drop procedure AlteraDado;
go

create procedure AlteraDado
@id int,
@nome varchar(80),
@email varchar(80),
@mensagem text,
@fk int
as
begin
	update ContatoSite set
	nome = @nome,
	email = @email,
	mensagem = @mensagem,
	dataHora = getdate(),
	fk_TipoContato_id = @fk
	where id = @id
end;

exec AlteraDado @id = 2, @nome = 'Jos�', @email = 'josfilho@email.com', @mensagem = 'Quais as formas de pagamento', @fk = 1;
exec AlteraDado @id = 3, @nome = 'Maria Santos', @email = 'maria.santos@hotmail.com', @mensagem = 'Quero fazer uma reclama��o sobre o atendimento', @fk = 2;
exec AlteraDado @id = 4, @nome = 'Pedro Costa', @email = 'pedro.costa@yahoo.com', @mensagem = 'Parab�ns pelo excelente trabalho', @fk = 3;
exec AlteraDado @id = 5, @nome = 'Ana Lima', @email = 'ana.lima@outlook.com', @mensagem = 'Preciso de um or�amento para um projeto', @fk = 4;
exec AlteraDado @id = 6, @nome = 'Bruno Dias', @email = 'bruno.dias@uol.com.br', @mensagem = 'Tenho uma d�vida sobre a forma de pagamento', @fk = 5;
exec AlteraDado @id = 7, @nome = 'Carla Souza', @email = 'carla.souza@bol.com.br', @mensagem = 'Quero cancelar minha compra', @fk = 1;
exec AlteraDado @id = 8, @nome = 'Daniel Oliveira', @email = 'daniel.oliveira@terra.com.br', @mensagem = 'Gostaria de fazer uma sugest�o de melhoria', @fk = 2;
exec AlteraDado @id = 9, @nome = 'Eduarda Rocha', @email = 'eduarda.rocha@icloud.com', @mensagem = 'Quero elogiar o atendimento do vendedor', @fk = 3;
exec AlteraDado @id = 10, @nome = 'Fabio Martins', @email = 'fabio.martins@globo.com', @mensagem = 'Preciso de ajuda para resolver um problema', @fk = 4;
exec AlteraDado @id = 11, @nome = 'Fabio Martins', @email = 'gabriela.alves@zoho.com', @mensagem = 'Quero fazer uma parceria com sua empresa', @fk = 5;


if object_id('SelecionarCliente', 'P') is not null
	drop procedure SelecionarCliente;
go

create procedure SelecionarCliente
@id int,
@nome varchar(80),
@email varchar(80),
@mensagem text,
@fk int
as
begin
	select ContatoSite.nome 
	from ContatoSite
	join TipoContato on ContatoSite.fk_TipoContato_id = TipoContato.id
	where ContatoSite.id = @id;
end;

exec SelecionarCliente @id = 1, @nome = 'Nome', @email = 'email', @mensagem = 'mensagem', @fk = 2;


use romullus;

--O que é preciso para criar um algoritmo
--Objetivo do algoritmo: mostrar uma mensagem "Alô mundo!"
--Primeiro vamos declarar o procedimento.
--Início

--Fim
--Procedure é uma DDL (DataDefinition Language)
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

--cria nova procedure com variável

CREATE PROCEDURE AloMundoComVariavel
AS
BEGIN
	--Declaração da variável
	DECLARE @mensagem VARCHAR(100);
	SET @mensagem = 'Alô Mundo!';
	--exibindo mensagem
	PRINT @mensagem;
END;
GO

exec AloMundoComVariavel;

/*
Um algoritmo deve realizar a soma de dois números sendo o primeiro X e o segundo Y.
Qual o nome dessa stored procedure?

soma_dois_numeros

Quais variáveis você pensa em declarar?

@x: número inteiro
@y: número inteiro

Quais os tipos dessas variáveis?

@x: int
@y: int

Qual operador utilizar(+ - * /)?

+

Qual a saída de dados PRINT?

A soma de @x e @y é @soma

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

	print 'O resultado da soma entre ' + @x + ' e ' + @y + ' é igual a ' + @resultado;
end;
go

exec Soma;


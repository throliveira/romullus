use romullus;

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

	print 'O resultado da soma entre ' + @x + ' e ' + @y + ' � igual a ' + @resultado;
end;
go

exec Soma;


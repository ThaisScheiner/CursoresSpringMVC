create database fatec

use fatec
create table curso
(
    codigo    int          not null,
    nome      varchar(100) not null,
    duracao   int          not null
    primary key (codigo)
)

create table disciplina
(
    codigo        varchar(8)   not null,
    nome          varchar(100) not null,
    cargahoraria  int          not null
    primary key (codigo)
)

create table disciplina_curso
(
    codigodisciplina    varchar(8)   not null,
    codigocurso         int          not null
    primary key (codigodisciplina,codigocurso)
	
    constraint fk_disciplina_curso foreign key (codigocurso) references curso(codigo),
    constraint fk_disciplina_curso_disciplina foreign key (codigodisciplina) references disciplina(codigo)
)


insert into curso
    values
        (48,'análise e desenvolvimento de sistemas',2880),
        (51,'logistica',2880),
        (67,'polímeros',2880),
        (73,'comércio exterior',2600),
        (94,'gestão empresarial' ,2600)

insert into disciplina
    values
        ('alg001','algoritmos',80),
        ('adm001','administração',80),
        ('lhw010','laboratório de hardware',40),
        ('lpo001','pesquisa operacional',80),
        ('fis003','física i',80),
        ('fis007','físico química',80),
        ('cmx001','comércio exterior',80),
        ('mkt002','fundamentos de marketing',80),
        ('inf001','informática',40),
        ('asi001','sistemas de informação' ,80)

insert into disciplina_curso
    values
        ('alg001',48),
        ('adm001',48),
        ('adm001',51),
        ('adm001',73),
        ('adm001',94),
        ('lhw010',48),
        ('lpo001',51),
        ('fis003',67),
        ('fis007',67),
        ('cmx001',51),
        ('cmx001',73),
        ('mkt002',51),
        ('mkt002',94),
        ('inf001',51),
        ('inf001',73),
        ('asi001',48),
        ('asi001',94)
		

CREATE FUNCTION fn_info_disciplinas_cursos(@codigo INT)
RETURNS @tab TABLE
(
    codDisciplina       VARCHAR(8),
    nomeDisciplina    VARCHAR(70),
    cargaHorariaDisc  INT,
    nomeCurso         VARCHAR(70)
)
AS 
BEGIN
    DECLARE @nomeCurso VARCHAR(70),
            @codDisc  VARCHAR(8)
    SELECT 
        @nomeCurso = nome
    FROM curso
    WHERE codigo = @codigo

    DECLARE cur CURSOR 
        FOR 
        SELECT 
            codigodisciplina 
        FROM disciplina_curso
        WHERE codigoCurso = @codigo

    OPEN cur
    FETCH NEXT FROM cur INTO @codDisc
    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE
            @nomeDisc    VARCHAR(70),
            @cargaHoraDisc  INT

        SELECT
            @nomeDisc = nome 
            , @cargaHoraDisc = cargahoraria
        FROM disciplina
        WHERE codigo = @codDisc 

        INSERT INTO @tab 
            VALUES
                (@codDisc,@nomeDisc,@cargaHoraDisc,@nomeCurso)
        FETCH NEXT FROM cur INTO @codDisc
    END
    CLOSE cur
    DEALLOCATE cur
    RETURN
END

SELECT * FROM fn_info_disciplinas_cursos(48)
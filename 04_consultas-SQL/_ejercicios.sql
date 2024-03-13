-- EJERCICIOS 1:

    -- ...

-- EJERCICIOS 2:

-- Tareas y la diferencia entre las hs máxima y mínima de la misma.

SELECT 
	nombre_tarea,
	min_horas,
	max_horas,
	ABS(max_horas - min_horas) AS dif
FROM "04_Consultas_SQL".TAREA

-- Concatenar direcciones: la calle, la ciudad y la provincia separadas por comas (,).

SELECT CONCAT_WS(', ', calle, ciudad, provincia) AS direccion_formateada
FROM "04_Consultas_SQL".DIRECCION

-- EJERCICIO 3:

-- ¿Cuáles son los voluntarios nacidos antes de la década del ‘90?

select * from "04_Consultas_SQL".VOLUNTARIO
where fecha_nacimiento < '2023-04-01'

-- ¿Cuáles son los voluntarios con nombre Kriste?
-- ¿Cuáles son los voluntarios con apellido Cordero?
select * from "04_Consultas_SQL".VOLUNTARIO
where nombre = 'Kriste' -- apellido = 'Cordero'

-- EJERCICIO 4:

-- ¿Cuáles son los voluntarios nacidos entre 1988 y 1995?
select * from "04_Consultas_SQL".VOLUNTARIO
where fecha_nacimiento between '1988-01-01' and '1995-12-31' 

-- ¿Cuáles son los voluntarios con nombre David o con apellido Smith y que realicen la tarea SA_REP?
select * from "04_Consultas_SQL".VOLUNTARIO
where (
	nombre = 'Pedro' or
	apellido = 'Filyushkin' and
	id_tarea = '4'
)

-- OTROS:
/*
Seleccionar los voluntarios que son coordinados por los
voluntarios nro 83 y 9 que están trabajando para la institución
cuyo código es 50.
*/
select * from "04_Consultas_SQL".VOLUNTARIO
where (id_coordinador = 83 or id_coordinador = 50) and id_institucion = 81

/*
seleccionar los datos de los voluntarios que
corresponden a los 10 anteultimos voluntarios.
*/
select * from "04_Consultas_SQL".VOLUNTARIO
order by nro_voluntario desc
limit 10
offset 1

-- EJERCICIOS 5:

-- ¿Cuáles son los 10 voluntarios mayores?
select * from "04_Consultas_SQL".VOLUNTARIO
order by fecha_nacimiento
limit 10
-- En orden alfabético ¿quiénes son los 5 primeros voluntarios de la institución 80?
select * from "04_Consultas_SQL".VOLUNTARIO
where id_institucion = '81'
order by nombre asc

-- EJERCICIOS 6:

-- ¿Cuántos voluntarios realizan cada tarea?
select id_tarea, count(*) as cantidad_voluntarios from "04_Consultas_SQL".VOLUNTARIO
group by id_tarea
-- ¿Cuál es el promedio de horas aportadas por tarea?
select id_tarea, count(*) as cantidad_voluntarios, avg(horas_aportadas) as promedio_horas
from "04_Consultas_SQL".VOLUNTARIO
group by id_tarea

-- EJERCICIOS 7:
-- ¿Cuáles son las tareas que tienen más de 10 voluntarios?
select id_tarea, count(*) as cantidad_voluntarios
from "04_Consultas_SQL".VOLUNTARIO
group by id_tarea
having count(*) > 10
-- ¿Cuál es el promedio de horas aportadas por tarea
-- solo de aquellos voluntarios nacidos a partir del año 2000?
select id_tarea, avg(horas_aportadas) as promedio_horas, fecha_nacimiento
from "04_Consultas_SQL".VOLUNTARIO
group by id_tarea, fecha_nacimiento
having fecha_nacimiento > '2000-01-01'

-- EJERCICIOS 8:
/*
¿Cuáles son las tareas cuyo promedio de horas
aportadas por tarea de los voluntarios nacidos a partir
del año 1995 es superior al promedio general de dicho
grupo de voluntarios?
*/
select id_tarea, promedio_horas
from (
    select id_tarea, avg(horas_aportadas) as promedio_horas
    from "04_Consultas_SQL".VOLUNTARIO
    where fecha_nacimiento > '1995-01-01'
    group by id_tarea
) as t
where promedio_horas > (
    select avg(horas_aportadas)
    from "04_Consultas_SQL".VOLUNTARIO
    where fecha_nacimiento > '1995-01-01'
)


/*
    OTROS:
    Mostrar el nombre de la tarea
*/
select v.nombre, t.nombre_tarea
from (
	"04_Consultas_SQL".VOLUNTARIO v
	inner join "04_Consultas_SQL".TAREA t 
	on v.id_tarea = t.id_tarea
)

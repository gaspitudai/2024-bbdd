--. renombrar tabla
ALTER TABLE "04_Consultas_SQL".DIRECCION
RENAME TO DIRECCION_OLD;

-- setear PK
ALTER TABLE "04_Consultas_SQL".VOLUNTARIO
ADD PRIMARY KEY (nro_voluntario);

ALTER TABLE "04_Consultas_SQL".VOLUNTARIO
ADD CONSTRAINT id_tarea FOREIGN KEY (id_tarea)
REFERENCES "04_Consultas_SQL".TAREA (id_tarea);

ALTER TABLE "04_Consultas_SQL".VOLUNTARIO
ADD CONSTRAINT id_institucion FOREIGN KEY (id_institucion)
REFERENCES "04_Consultas_SQL".TAREA (id_tarea);


delete from table "04_Consultas_SQL".INSTITUCION
where id_institucion not in (
	select id_institucion
	from "04_Consultas_SQL".INSTITUCION
	order by id_institucion
	limit 20
)

insert into "04_Consultas_SQL".INSTITUCION
    (id_institucion, id_director, id_direccion)
values
    (1, 21, 59),
    (2, 84, 23),
    (3, 13, 19),
    (4, 5, 48),
    (5, 67, 37),
    (6, 2, 81),
    (7, 33, 76),
    (8, 99, 14),
    (9, 42, 70),
    (10, 78, 11),
    (11, 50, 65),
    (12, 3, 94),
    (13, 25, 63),
    (14, 61, 9),
    (15, 4, 32),
    (16, 14, 44),
    (17, 77, 6),
    (18, 26, 87),
    (19, 7, 55),
    (20, 91, 27),
    (21, 1, 85),
    (22, 43, 74),
    (23, 57, 31),
    (24, 28, 72),
    (25, 17, 46),
    (26, 68, 3),
    (27, 39, 16),
    (28, 19, 98),
    (29, 73, 69),
    (30, 6, 40),
    (31, 54, 82),
    (32, 15, 24),
    (33, 58, 41),
    (34, 12, 62),
    (35, 10, 95),
    (36, 88, 75),
    (37, 49, 5),
    (38, 94, 34),
    (39, 30, 60),
    (40, 70, 17),
    (41, 8, 78),
    (42, 72, 52),
    (43, 56, 2),
    (44, 89, 93),
    (45, 36, 71),
    (46, 22, 38),
    (47, 66, 10),
    (48, 40, 67),
    (49, 96, 25),
    (50, 97, 83),
    (51, 32, 50),
    (52, 23, 29),
    (53, 71, 53),
    (54, 90, 80),
    (55, 44, 12),
    (56, 29, 42),
    (57, 18, 57),
    (58, 48, 4),
    (59, 81, 79),
    (60, 80, 35),
    (61, 60, 90),
    (62, 51, 58),
    (63, 98, 88),
    (64, 35, 13),
    (65, 9, 54),
    (66, 65, 21),
    (67, 38, 43),
    (68, 76, 97),
    (69, 87, 1),
    (70, 92, 68),
    (71, 52, 45),
    (72, 16, 56),
    (73, 63, 20),
    (74, 86, 64),
    (75, 31, 96),
    (76, 85, 39),
    (77, 93, 77),
    (78, 83, 49),
    (79, 11, 8),
    (80, 24, 28),
    (81, 41, 47),
    (82, 37, 92),
    (83, 64, 33),
    (84, 45, 86),
    (85, 27, 91),
    (86, 34, 66),
    (87, 20, 18),
    (88, 55, 15),
    (89, 79, 22),
    (90, 46, 84),
    (91, 82, 36),
    (92, 75, 51),
    (93, 53, 7),
    (94, 95, 73),
    (95, 62, 89),
    (96, 74, 30),
    (97, 69, 26),
    (98, 47, 61),
    (99, 30, 76),
    (100, 1, 2);
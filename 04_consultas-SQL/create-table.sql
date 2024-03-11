CREATE TABLE IF NOT EXISTS VOLUNTARIO (
    nro_voluntario INT NOT NULL,
    nombre VARCHAR(25),
    apellido VARCHAR(20) NOT NULL,
    telefono VARCHAR(20),
    fecha_nacimiento DATE NOT NULL,
    id_tarea VARCHAR(10),
    horas_aportadas DECIMAL,
    porcentaje DECIMAL,
    id_institucion INT,
    id_coordinador INT
);

CREATE TABLE IF NOT EXISTS TAREA (
    id_tarea CHAR(10) NOT NULL,
    nombre_tarea VARCHAR(40) NOT NULL,
    min_horas INT,
    max_horas INT
);

CREATE TABLE IF NOT EXISTS HISTORICO (
    nro_voluntario INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fix DATE NOT NULL,
    id_tarea VARCHAR(10) NOT NULL,
    id_institucion INT
);

CREATE TABLE IF NOT EXISTS CONTINENTE (
    id_continente INT NOT NULL,
    nombre_continente VARCHAR
);

CREATE TABLE IF NOT EXISTS PAIS (
    id_pais CHAR NOT NULL,
    nombre_pais VARCHAR,
    id_continente INT NOT NULL
);

CREATE TABLE IF NOT EXISTS DIRECCION (
    id_direccion INT NOT NULL,
    calle VARCHAR(40) NOT NULL,
    codigo_postal VARCHAR(12),
    provincia VARCHAR(25),
    ciudad VARCHAR(30),
    id_pais CHAR(2)
);

CREATE TABLE IF NOT EXISTS INSTITUCION (
    id_institucion INT NOT NULL,
    nombre_institucion VARCHAR(60) NOT NULL,
    id_director INT,
    id_direccion INT
);
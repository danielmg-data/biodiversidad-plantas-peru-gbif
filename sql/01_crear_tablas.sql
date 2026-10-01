CREATE TABLE registros_por_anio (
    anio      INTEGER PRIMARY KEY,
    registros INTEGER
);

CREATE TABLE registros_por_familia (
    familia   TEXT PRIMARY KEY,
    registros INTEGER
);

CREATE TABLE registros_por_region (
    nombre    TEXT PRIMARY KEY,
    registros INTEGER
);

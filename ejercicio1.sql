-- 0. Limpiamos pruebas anteriores para poder ejecutar el script 1000 veces sin errores
DROP SCHEMA IF EXISTS persCiud CASCADE;
SET search_path to ejercicio1;
SET search_path to public;

-- B) DEFINICIÓN DEL ESQUEMA
CREATE SCHEMA persCiud;

-- 1.b) TABLA CIUDADES
CREATE TABLE persCiud.ciu1 (
    idCiu INT PRIMARY KEY,                 -- Integridad de Entidad
    nomCiu VARCHAR(100) NOT NULL,          -- No admite valores nulos
    cantHab INT DEFAULT 0                  -- Valor por defecto 0
);

-- 1.a) TABLA PERSONAS
CREATE TABLE persCiud.pers1 (
    cuil VARCHAR(15) PRIMARY KEY,          -- Integridad de Entidad
    nom VARCHAR(100),
    idCiu INT,
    edad INT,
    trabaja VARCHAR(2),
    -- Integridad Referencial
    CONSTRAINT fk_ciudad FOREIGN KEY (idCiu) 
        REFERENCES persCiud.ciu1(idCiu) 
        ON DELETE RESTRICT                 -- Eliminación: Restringir
        ON UPDATE CASCADE                  -- Modificación: Propagar
);

-- 2.c y 2.d) INSERCIÓN DE CIUDADES (Se insertan primero porque las personas las necesitan)
INSERT INTO persCiud.ciu1 VALUES (1, 'Buenos Aires', 3000000);
INSERT INTO persCiud.ciu1 VALUES (2, 'Rosario', null);

-- ATENCIÓN: El profesor puso este INSERT a propósito para que falle (nomCiu no puede ser nulo). 
-- Comentamos la línea que falla para que el script siga avanzando, ¡pero tenelo en cuenta!
-- INSERT INTO persCiud.ciu1 VALUES (3, null, 1400000); 

INSERT INTO persCiud.ciu1 VALUES (4, 'Mendoza', -800000);
INSERT INTO persCiud.ciu1 VALUES (3, 'San Juan', 822853);
-- UPDATE para sobreescribir la ciudad 4 como pide el punto 2.d
UPDATE persCiud.ciu1 SET cantHab = 2043540 WHERE idCiu = 4;

-- 2.a y 2.b) INSERCIÓN DE PERSONAS
INSERT INTO persCiud.pers1 VALUES ('20-11111111-1', 'Juan Perez', 1, 35, 'si');
INSERT INTO persCiud.pers1 VALUES ('27-22222222-2', 'Ana Gomez', 2, 28, 'no');
INSERT INTO persCiud.pers1 VALUES ('23-33333333-3', 'Carlos Diaz', 1, 40, 'si');
INSERT INTO persCiud.pers1 VALUES ('25-44444444-4', 'María Lopez', 3, 22, 'no');

-- Este INSERT también falla a propósito porque la ciudad 10 no existe en la tabla ciu1.
-- INSERT INTO persCiud.pers1 VALUES ('20-55555555-1', 'Juan Sanchez', 10, 35, 'si');

-- MOSTRAMOS CÓMO QUEDÓ TOD
SELECT * FROM persCiud.ciu1;
SELECT * FROM persCiud.pers1;

CREATE TABLE persCiud.ciu2 (
    idCiu INT PRIMARY KEY,              
    nomCiu VARCHAR(100) NOT NULL,       
    cantHab INT DEFAULT 0               
);

CREATE TABLE persCiud.pers2 (
    cuil VARCHAR(15) PRIMARY KEY,          
    nom VARCHAR(100),
    idCiu INT,
    edad INT,
    trabaja VARCHAR(2),
    CONSTRAINT fk_ciudad FOREIGN KEY (idCiu) 
        REFERENCES persCiud.ciu2(idCiu) 
        ON DELETE SET NULL                
        ON UPDATE RESTRICT              
);
INSERT INTO persCiud.ciu2 VALUES (1, 'Buenos Aires', 3000000);
INSERT INTO persCiud.ciu2 VALUES (2, 'Rosario', null);
INSERT INTO persCiud.ciu2 VALUES (4, 'Mendoza', -800000);
INSERT INTO persCiud.ciu2 VALUES (3, 'San Juan', 822853);
INSERT INTO persCiud.pers2 VALUES ('20-11111111-1', 'Juan Perez', 1, 35, 'si');
INSERT INTO persCiud.pers2 VALUES ('27-22222222-2', 'Ana Gomez', 2, 28, 'no');
INSERT INTO persCiud.pers2 VALUES ('23-33333333-3', 'Carlos Diaz', 1, 40, 'si');
INSERT INTO persCiud.pers2 VALUES ('25-44444444-4', 'María Lopez', 3, 22, 'no');
INSERT INTO persCiud.pers2 VALUES ('67-676767-67', 'ELIAS VALDEZ', 1, 35, 'si');

SELECT * FROM persCiud.ciu2;
SELECT * FROM persCiud.pers2;
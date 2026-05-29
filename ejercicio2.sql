CREATE  SCHEMA ejercicio2;
set search_path to ejercicio2;

CREATE TABLE ejercicio2.rubro (
    codAlmacen INTEGER PRIMARY KEY,
    nomRubro VARCHAR(50)
);

CREATE TABLE ejercicio2.producto (
    cod INTEGER PRIMARY KEY,
    nombre VARCHAR(40),
    rubro INTEGER,
    precioActual NUMERIC(10,2),
	condicionAlm VARCHAR (20),
    FOREIGN KEY (rubro) REFERENCES ejercicio2.rubro(codAlmacen)
);

CREATE TABLE ejercicio2.factura (
    nroF INTEGER PRIMARY KEY,
	cuil VARCHAR(20),
    fecha DATE
    -- El importe total no se almacena porque es derivado
);

CREATE TABLE ejercicio2.tiene (
    nroF INTEGER,
    cod INTEGER,
    cantVendida INTEGER,
    precioVend NUMERIC(10,2),
    PRIMARY KEY (nroF, cod),
    FOREIGN KEY (nroF) REFERENCES ejercicio2.factura(nroF),
    FOREIGN KEY (cod) REFERENCES ejercicio2.producto(cod)
);

INSERT INTO ejercicio2.rubro VALUES
(1,'Limpieza'),
(2,'Bebidas'),
(3,'Lácteo');

INSERT INTO ejercicio2.producto(cod,nombre,rubro,precioActual,condicionAlm)  VALUES
(1, 'Jabón Líquido',1, 3500, 'Lugar seco'),
(2, 'Coca cola 2l',2, 2800, 'Lugar seco'),
(3, 'Manaos Pomelo 2,5l',2,1900, 'Lugar fresco'),
(4, 'Seven Up 500ml',2,1150.5, 'Lugar fresco'),
(5, 'Crema de Leche La Serenísima 200cc',3, 2200, 'Lugar fresco'),
(6, 'Yogurt La Serenísima',3, 3000, 'Lugar fresco');


INSERT INTO ejercicio2.factura VALUES
(190, '20-11111111-1','2021-05-01'),
(300,'21-11111111-1','2023-09-01'),
(167, '20-11111111-1','2021-07-23'),
(400,'22-11111111-1','2023-12-21');


INSERT INTO ejercicio2.tiene VALUES
(190,1,2,1450.9),
(190,3,1,450),
(300,5,3,1200),
(300,6,1,3000),
(167,4,3,800),
(400,2,1,2800),
(400,4,2,2000);

select * from tiene;
select * from producto;
select * from rubro;
select * from factura;

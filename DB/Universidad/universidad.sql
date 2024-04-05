-- Creacion de tablas principales

CREATE TABLE carrera (clave_c INTEGER PRIMARY KEY AUTO_INCREMENT,
					  nom_c varchar(30),
					  durac_c INTEGER
);

CREATE TABLE materia (clave_m INTEGER PRIMARY KEY AUTO_INCREMENT,
					  nom_m varchar(30),
					  cred_m INTEGER
);

CREATE TABLE profesor(clave_p INTEGER PRIMARY KEY AUTO_INCREMENT,
					  nom_p varchar(30),
					  dir_p varchar(30),
					  tel_p varchar(30),
					  hor_p time
);

CREATE TABLE alumno (mat_alu INTEGER PRIMARY KEY AUTO_INCREMENT,
					 nom_alu varchar(30),
					 edad_alu INTEGER,
					 sem_alu INTEGER,
					 gen_alu varchar(30),
					 clave_c1 INTEGER,
					 FOREIGN KEY(clave_c1) REFERENCES carrera(clave_c)
);

-- Creacion de tablas alumno - profesores

CREATE TABLE alu_pro (mat_alu1 INTEGER,
					  clave_p1 INTEGER,
					  FOREIGN KEY(mat_alu1) REFERENCES alumno(mat_alu),
					  FOREIGN KEY(clave_p1) REFERENCES profesor(clave_p)
);

-- Creación de tabla materia - alumno

CREATE TABLE mat_alu(clave_m1 INTEGER,
					 mat_alu2 INTEGER,
					 FOREIGN KEY(clave_m1) REFERENCES materia(clave_m),
					 FOREIGN KEY(mat_alu2) REFERENCES alumno(mat_alu)
);

CREATE TABLE mat_pro(clave_m2 INTEGER,
					 clave_p2 INTEGER,
					 FOREIGN KEY(clave_m2) REFERENCES materia(clave_m),
					 FOREIGN KEY(clave_p2) REFERENCES profesor(clave_p)
);

-- Insertar datos a tabla carrera

INSERT INTO carrera(nom_c, durac_c) VALUES ("Derecho", 3);
INSERT INTO carrera(nom_c, durac_c) VALUES ("Diseño", 6);
INSERT INTO carrera(nom_c, durac_c) VALUES ("Ingeniería de Sistemas", 4);

-- Mirar el contenido de una tabla

SELECT * FROM carrera

-- Insertar datos en la tabla materias

INSERT INTO materia(nom_m, cred_m) VALUES ('Matemáticas', 25);
INSERT INTO materia(nom_m, cred_m) VALUES ('Español', 15);
INSERT INTO materia(nom_m, cred_m) VALUES ('Programación', 20);

-- Ver contenido de tabla materias

SELECT * FROM materia

-- Insertar contenido tabla profesores

INSERT INTO profesor(nom_p, dir_p, tel_p, hor_p) VALUES ('Clara Estella', 'Calle 28 # 20-10', '3128459637', '07:00');
INSERT INTO profesor(nom_p, dir_p, tel_p, hor_p) VALUES ('Roberto Diaz', 'Calle 30 # 10-15', '3127894523', '09:00');

-- Ver tabla profesor

SELECT * FROM profesor

-- Llenado de tabla alumnos

INSERT INTO alumno(nom_alu,edad_alu,sem_alu,gen_alu, clave_c1) VALUES ('Eduardo E. Enríquez R.',48,4,'Másculino', 3);
INSERT INTO alumno(nom_alu,edad_alu,sem_alu,gen_alu, clave_c1) VALUES ('Cristina Gallardo.',20,5,'Femenino', 1);
INSERT INTO alumno(nom_alu,edad_alu,sem_alu,gen_alu, clave_c1) VALUES ('Laura Montes',18,3,'Femenino', 2);

-- Ver tabla alumno

SELECT * from alumno

-- Insertar datos a la tabla correlacionales

INSERT INTO alu_pro(mat_alu1, clave_p1) VALUES (1, 1);
INSERT INTO alu_pro(mat_alu1, clave_p1) VALUES (2, 2);
INSERT INTO alu_pro(mat_alu1, clave_p1) VALUES (3, 2);
-- Ver contenido tabla

select * FROM alu_pro

-- Insertar datos para tabla materia - alumnos

INSERT INTO mat_alu(clave_m1, mat_alu2) VALUES (1, 3);
INSERT INTO mat_alu(clave_m1, mat_alu2) VALUES (2, 2);
INSERT INTO mat_alu(clave_m1, mat_alu2) VALUES (3, 1);

-- Ver contenido tablas

SELECT * FROM mat_alu

-- Insertar datos tabla profesor - materia

INSERT INTO mat_pro(clave_m2, clave_p2) VALUES (1, 1);
INSERT INTO mat_pro(clave_m2, clave_p2) VALUES (2, 2);
INSERT INTO mat_pro(clave_m2, clave_p2) VALUES (3, 1);

-- Ver datos tabla mat_pro

SELECT * FROM mat_pro

-- CONSULTAS--

SELECT clave_m, nom_m FROM materia

SELECT nom_alu, edad_alu, sem_alu FROM alumno

SELECT nom_alu, edad_alu, sem_alu, nom_c FROM alumno
INNER JOIN carrera ON alumno.clave_c1 = carrera.clave_c

-- carrera-alumno-alu_pro-profesor--

SELECT nom_alu, edad_alu, sem_alu, nom_c, nom_p FROM alumno
INNER JOIN carrera ON alumno.clave_c1 = carrera.clave_c
INNER JOIN alu_pro ON alu_pro.mat_alu1 = alumno.mat_alu
INNER JOIN profesor ON profesor.clave_p = alu_pro.clave_p1;

-- carrera-alumno-alu_pro-profesor-materia--
SELECT nom_alu, edad_alu, sem_alu, nom_c, nom_p, nom_m FROM alumno
INNER JOIN carrera ON alumno.clave_c1 = carrera.clave_c
INNER JOIN alu_pro ON alu_pro.mat_alu1 = alumno.mat_alu
INNER JOIN profesor ON profesor.clave_p = alu_pro.clave_p1
INNER JOIN materia ON materia.clave_m = alumno.mat_alu;


SELECT nom_alu, edad_alu, sem_alu, nom_c, nom_p, nom_m FROM alumno
INNER JOIN carrera ON alumno.clave_c1 = carrera.clave_c
INNER JOIN alu_pro ON alu_pro.mat_alu1 = alumno.mat_alu
INNER JOIN profesor ON profesor.clave_p = alu_pro.clave_p1
INNER JOIN materia ON materia.clave_m = alumno.mat_alu
WHERE edad_alu = 18;
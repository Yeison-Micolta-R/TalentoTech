CREATE TABLE libros (
    cod_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(30),
    genero VARCHAR(30),
    año_publicacion INT,
    editorial VARCHAR(50)
);


CREATE TABLE autores (
    cod_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(50),
    nacionalidad VARCHAR(30)
);


CREATE TABLE generos (
    cod_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre_genero VARCHAR(30)
);


CREATE TABLE editoriales (
    cod_editorial INT AUTO_INCREMENT PRIMARY KEY,
    nombre_editorial VARCHAR(50)
);

CREATE TABLE libros_autores (
    cod_libro1 INT,
    cod_autor1 INT,
    FOREIGN KEY (cod_libro1) REFERENCES libros(cod_libro),
    FOREIGN KEY (cod_autor1) REFERENCES Autores(cod_autor),
    PRIMARY KEY (cod_libro1, cod_autor1)
);


INSERT INTO Libros (titulo, autor, genero, año_publicacion, editorial)
VALUES
    ('Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', 1967, 'Editorial Sudamericana'),
    ('1984', 'George Orwell', 'Ciencia ficción', 1949, 'Secker & Warburg'),
    ('Orgullo y prejuicio', 'Jane Austen', 'Novela romántica', 1813, 'T. Egerton, Whitehall'),
    ('El Gran Gatsby', 'F. Scott Fitzgerald', 'Ficción contemporánea', 1925, 'Charles Scribner''s Sons'),
    ('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Novela clásica', 1605, 'Francisco de Robles');

INSERT INTO Autores (nombre_autor, nacionalidad)
VALUES
    ('Gabriel García Márquez', 'Colombiano'),
    ('George Orwell', 'Británico'),
    ('Jane Austen', 'Británica'),
    ('F. Scott Fitzgerald', 'Estadounidense'),
    ('Miguel de Cervantes', 'Español');

INSERT INTO Generos (nombre_genero)
VALUES
    ('Realismo mágico'),
    ('Ciencia ficción'),
    ('Novela romántica'),
    ('Ficción contemporánea'),
    ('Novela clásica');

INSERT INTO Editoriales (nombre_editorial)
VALUES
    ('Editorial Sudamericana'),
    ('Secker & Warburg'),
    ('T. Egerton, Whitehall'),
    ('Charles Scribner''s Sons'),
    ('Francisco de Robles');
    
INSERT INTO Libros_Autores (cod_libro1, cod_autor1)
VALUES
    (1, 1),
    (2, 2), 
    (3, 3),
    (4, 4), 
    (5, 5); 

SELECT * FROM autores;

SELECT titulo, nombre_autor FROM Libros
INNER JOIN libros_Autores ON Libros_Autores.cod_libro1 = libros.cod_libro
INNER JOIN autores ON Libros_Autores.cod_autor1 = autores.cod_autor;


SELECT nombre_autor, nombre_genero
FROM autores
INNER JOIN Libros_Autores ON Libros_Autores.cod_autor1 = autores.cod_autor
INNER JOIN Libros ON Libros_Autores.cod_libro1 = Libros.cod_libro
INNER JOIN Generos ON Libros.genero = generos.nombre_genero;
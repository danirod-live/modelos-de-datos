CREATE TABLE alumnos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL,
    apellidos VARCHAR(64) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    UNIQUE KEY alumnos_id (id)
);

CREATE TABLE profesores (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL,
    apellidos VARCHAR(64) NOT NULL,
    UNIQUE KEY profesores_id (id)
);

CREATE TABLE asignaturas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(64) NOT NULL,
    profesor INT NOT NULL,
    UNIQUE KEY asignaturas_id (id),
    FOREIGN KEY asignaturas_profesores (profesor) REFERENCES profesores (id)
);

CREATE TABLE matriculas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    alumno INT NOT NULL,
    asignatura INT NOT NULL,
    fecha YEAR NOT NULL,
    nota INT,
    UNIQUE KEY matriculas_id (id),
    FOREIGN KEY matriculas_alumnos (alumno) REFERENCES alumnos (id),
    FOREIGN KEY matriculas_asignaturas (asignatura) REFERENCES asignaturas (id)
);

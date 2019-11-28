CREATE DATABASE ClinicaRamos2
CREATE TABLE tblEspecialidad(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(255) NULL);



INSERT INTO tblEspecialidad VALUES ('Estetica Dental');
INSERT INTO tblEspecialidad VALUES ('Blanqueamiento dental');
INSERT INTO tblEspecialidad VALUES ('Ortodoncia');
INSERT INTO tblEspecialidad VALUES ('Rehabilitacion Oral');
INSERT INTO tblEspecialidad VALUES ('Implantologia');
INSERT INTO tblEspecialidad VALUES ('Endodoncia');

CREATE TABLE tblPaciente
(Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
DNI    VARCHAR(11) NOT NULL,
Nombres		VARCHAR(70) NULL,
ApellidoPaterno VARCHAR(50) NULL,
ApellidoMaterno VARCHAR(50) NULL,
Correo           VARCHAR(50) NULL,
Direccion        VARCHAR(50) NULL,
FechaNacimiento  DATE NULL,
Genero           CHAR(1) NULL);

INSERT INTO tblPaciente VALUES('62676743','Deirdre','Hendricks','Avila','eleifend@Aliquam.co.uk','Huancayo','11/02/1989','M')
INSERT INTO tblPaciente VALUES('82963954','Henry','Davenport','Scott','Fusce.aliquet.magna@blandit.org','Jauja','19/09/1993','M')
INSERT INTO tblPaciente VALUES('22325549','Nolan','Lowe','Lowe','odio@disparturient.co.uk','Concepcion','25/03/1997','F')
INSERT INTO tblPaciente VALUES('94367892','Amethyst','Monroe','Talley','sem.egestas@etmagnisdis.edu','Chilca','19/12/1994','F')
INSERT INTO tblPaciente VALUES('42406887','Cynthia','Hutchinson','Estrada','diam.luctus@sitamet.org','Tambo','08/07/1947','F')

Create Table tblEstado(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Nombre varchar (30))
INSERT INTO tblEstado VALUES ('Disponible'); 
INSERT INTO tblEstado VALUES ('No Disponible'); 

CREATE TABLE tblHorario(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Dias VARCHAR (30) NOT NULL,
HoraIngreso time  NOT NULL,
HoraSalida time  NOT NULL);

INSERT INTO tblHorario VALUES ('Lunes-Viernes','09:00:00','20:00:00');

CREATE TABLE tblMedico(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
DNI varchar (11),
Nombre varchar (50),
ApellidoPaterno varchar (50),
ApellidoMaterno varchar (50),
telefono varchar (11),
NombreEspecialidad int not null REFERENCES tblEspecialidad(Id),
IdHorario INT NOT NULL REFERENCES tblHorario(Id),
IdEstado INT NOT NULL REFERENCES tblEstado(Id));

INSERT INTO tblPaciente VALUES('62676743','Deirdre','Hendricks','Avila','eleifend@Aliquam.co.uk','Huancayo','11/02/1989','M')


CREATE TABLE tblUsuarios
(Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Correo VARCHAR(255) NOT NULL,
Password VARCHAR(255) NOT NULL,
Nombres VARCHAR(50) NOT NULL,
Apelllidos VARCHAR(50) NOT NULL,
DNI VARCHAR(11) NOT NULL,
FechaNacimiento DATE NULL,
Genero CHAR(1) NULL,
IdEspecialidad INT  NOT NULL	REFERENCES tblEspecialidad(Id));



CREATE TABLE tblCita(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Fecha DATE NOT NULL,
Hora TIME  NOT NULL,
observacion text NOT NULL,
Estado VARCHAR(50) NOT NULL,
IdPaciente INT  NOT NULL REFERENCES tblPaciente(Id),
IdUsuario INT NOT NULL REFERENCES tblUsuarios(Id),
IdMedico INT NOT NULL REFERENCES tblMedico(Id));





CREATE TABLE tblCitaDetalle(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Fecha DATE NOT NULL,
observacion text NOT NULL,
IdCita INT  NOT NULL REFERENCES tblCita(Id));


select * from tblMedico


    

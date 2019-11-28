CREATE DATABASE ClinicaRamos
CREATE TABLE tblEspecialidad(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(255) NULL);



INSERT INTO tblEspecialidad VALUES ('Estetica Dental');
INSERT INTO tblEspecialidad VALUES ('Blanqueamiento dental');
INSERT INTO tblEspecialidad VALUES ('Ortodoncia');
INSERT INTO tblEspecialidad VALUES ('Rehabilitacion Oral');
INSERT INTO tblEspecialidad VALUES ('Implantologia');
INSERT INTO tblEspecialidad VALUES ('Endodoncia');
select * from tblEspecialidad;

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

INSERT INTO tblPaciente VALUES('62676743','Deirdre','Hendricks','Avila','eleifend@Aliquam.co.uk','Huancayo','1989/02/19','M')
INSERT INTO tblPaciente VALUES('82963954','Henry','Davenport','Scott','Fusce.aliquet.magna@blandit.org','Jauja','1993/09/14','M')
INSERT INTO tblPaciente VALUES('22325549','Nolan','Lowe','Lowe','odio@disparturient.co.uk','Concepcion','1997/03/27','F')
INSERT INTO tblPaciente VALUES('94367892','Amethyst','Monroe','Talley','sem.egestas@etmagnisdis.edu','Chilca','1994/12/19','F')
INSERT INTO tblPaciente VALUES('42406887','Cynthia','Hutchinson','Estrada','diam.luctus@sitamet.org','Tambo','1996/07/15','F')
select * from tblPaciente;

Create Table tblEstado(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Nombre varchar (30))
INSERT INTO tblEstado VALUES ('Disponible'); 
INSERT INTO tblEstado VALUES ('No Disponible'); 

select * from tblEstado;

CREATE TABLE tblHorario(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Dias VARCHAR (30) NOT NULL,
HoraIngreso time  NOT NULL,
HoraSalida time  NOT NULL);

INSERT INTO tblHorario VALUES ('Lunes-Viernes','09:00:00','20:00:00');
INSERT INTO tblHorario VALUES ('Sabado','09:00:00','2:00:00');
select * from tblHorario;

CREATE TABLE tblMedico(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
DNI varchar (11),
Nombre varchar (50),
ApellidoPaterno varchar (50),
ApellidoMaterno varchar (50),
telefono varchar (11),
IdEspecialidad int not null REFERENCES tblEspecialidad(Id),
IdHorario INT NOT NULL REFERENCES tblHorario(Id),
IdEstado INT NOT NULL REFERENCES tblEstado(Id));

INSERT INTO tblMedico VALUES('62676743','Deirdre','Hendricks','Avila','987654321',1,1,1);
INSERT INTO tblMedico VALUES('40589654','Deysi','Taipe','Medrano','987612345',2,1,1);
INSERT INTO tblMedico VALUES('36267674','Omar','Garcia','Sabala','943654321',3,1,1);
INSERT INTO tblMedico VALUES('67674623','Juan','Rosalez','Savedra','945678234',4,1,1);
INSERT INTO tblMedico VALUES('23456789','Carmen','Ramos','Morales','923872345',6,1,1);
INSERT INTO tblMedico VALUES('60306785','Lizeth','Adauto','Meneses','96356962',6,1,1);
INSERT INTO tblMedico VALUES('58945678','Camila','Paredes','Rojas','945612345',6,2,1);


select * from tblMedico;
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

 INSERT INTO tblUsuarios VALUES('casmorales@gmail.com','12345','Carlos','Medrano Taipe','45987654','1990/12/12','M',1);
 INSERT INTO tblUsuarios VALUES('carmen@gmail.com','12345','Carmen','Ramos Taipe','70986754','1992/02/13','F',6);
 INSERT INTO tblUsuarios VALUES('AnaMeza@gmail.com','12345','Ana','Meza Sotelo','50678456','1994/09/23','F',2);
 INSERT INTO tblUsuarios VALUES('GabrielPalaciosA@hotmail.com','12345','Gabriel','Palacios Arias','70305648','1995/05/25','M',1);
 select * from tblUsuarios;

CREATE TABLE tblCita(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Fecha DATE NOT NULL,
Hora TIME  NOT NULL,
observacion text NOT NULL,
Estado VARCHAR(50) NOT NULL,
IdPaciente INT  NOT NULL REFERENCES tblPaciente(Id),
IdUsuario INT NOT NULL REFERENCES tblUsuarios(Id),
IdMedico INT NOT NULL REFERENCES tblMedico(Id));

INSERT INTO tblCita VALUES('2019/10/19','09:00:00','atencion de ortodoncia','Disponible',1,1,5);
INSERT INTO tblCita VALUES('2010/11/03','11:00:00','atencion de endodoncia','Disponible',3,2,4);
INSERT INTO tblCita VALUES('2010/11/03','12:00:00','Tratamiento de implantologia','Disponible',6,4,2);
select * from tblCita;


CREATE TABLE tblCitaDetalle(
Id INT  PRIMARY KEY IDENTITY(1,1) NOT NULL,
Fecha DATE NOT NULL,
observacion text NOT NULL,
IdCita INT  NOT NULL REFERENCES tblCita(Id));
INSERT INTO tblCitaDetalle VALUES('2010/11/03','Tratamiento de implantologia',1);
INSERT INTO tblCitaDetalle VALUES('2010/11/03','atencion de endodoncia',3);
INSERT INTO tblCitaDetalle VALUES('2019/10/19','atencion de ortodoncia',4);

select * from tblCitaDetalle

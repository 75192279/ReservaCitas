USE [ClinicaRamos]
GO
/****** Object:  StoredProcedure [dbo].[sp_verificar_horario]    Script Date: 05/12/2019 11:07:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[sp_verificar_horario]
@fecha date, 
@hora varchar(50),
@tratamiento varchar(20)
as
select count(*) from tblCita where Fecha = @fecha and Hora = @hora and tratamiento = @tratamiento
﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClinicaRamos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ClinicaRamosEntities1 : DbContext
    {
        public ClinicaRamosEntities1()
            : base("name=ClinicaRamosEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblCita> tblCita { get; set; }
        public virtual DbSet<tblCitaDetalle> tblCitaDetalle { get; set; }
        public virtual DbSet<tblEspecialidad> tblEspecialidad { get; set; }
        public virtual DbSet<tblEstado> tblEstado { get; set; }
        public virtual DbSet<tblHorario> tblHorario { get; set; }
        public virtual DbSet<tblMedico> tblMedico { get; set; }
        public virtual DbSet<tblPaciente> tblPaciente { get; set; }
        public virtual DbSet<tblUsuarios> tblUsuarios { get; set; }
    }
}

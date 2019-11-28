using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClinicaRamos.Models
{
    public class Medico
    {
        public byte Id { get; set; }
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string telefono { get; set; }
        public Especialidad EspecialidadDeMedico { get; set; }
        public  Horario HorarioDeMedico { get; set; }
        public Estado EstadoDeMedico { get; set; }

    }
}
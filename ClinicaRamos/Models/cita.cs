using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClinicaRamos.Models
{
    public class Cita
    {
        public byte Id { get; set; }
        public DateTime Fecha { get; set; }
        public DateTime Hora { get; set; }
        public string Observacion { get; set; }
        public string Estado { get; set; }
        public Paciente CitadePaciente { get; set; }
        public Usuario CitadeUsuario { get; set; }
        public Medico CitaMedico { get; set; }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClinicaRamos.Models
{
    public class Paciente
    {
        public int Id { get; set; }
        public string DNI { get; set; }
        public string Nombres { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Correo { get; set; }
        public string Direccion { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Genero { get; set; }
    }
}
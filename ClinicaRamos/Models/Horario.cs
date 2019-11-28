using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClinicaRamos.Models
{
    public class Horario
    {
        public byte Id { get; set; }
        public string Dias { get; set; }
        public DateTime HoraIngreso { get; set; }
        public DateTime HoraSalida { get; set; }
    }
}
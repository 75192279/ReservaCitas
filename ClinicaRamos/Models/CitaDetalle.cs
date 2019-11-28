using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClinicaRamos.Models
{
    public class CitaDetalle
    {
        public byte Id { get; set; }
        public DateTime Fecha { get; set; }
        public string Observacion { get; set; }
        public Cita CitaDtalle { get; set; }
    }
}
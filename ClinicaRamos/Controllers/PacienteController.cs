using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClinicaRamos.Controllers
{
    public class PacienteController : Controller
    {
        // GET: Paciente
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult listarPaciente()
        {
            List<ClinicaRamos.Models.Paciente> Listado = new List<Models.Paciente>();


            ClinicaRamosEntities1 Datos = new ClinicaRamosEntities1();
            foreach (tblPaciente elemento in Datos.tblPaciente)
            {
                ClinicaRamos.Models.Paciente objeto01 = new Models.Paciente();
                objeto01.Id = elemento.Id;
                objeto01.DNI = elemento.DNI;
                objeto01.Nombres = elemento.Nombres;
                objeto01.ApellidoPaterno = elemento.ApellidoPaterno;
                objeto01.ApellidoMaterno = elemento.ApellidoMaterno;
                objeto01.Correo = elemento.Correo;
                //objeto01.FechaNacimiento = elemento.FechaNacimiento;
                objeto01.Genero = elemento.Genero;

                Listado.Add(objeto01);
            }

            return Json(Listado, JsonRequestBehavior.AllowGet);
        }
    }
}
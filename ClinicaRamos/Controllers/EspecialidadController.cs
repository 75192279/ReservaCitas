using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClinicaRamos.Controllers
{
    public class EspecialidadController : Controller
    {
        // GET: Especialidad
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult listarEspecialidad()
        {
            List<ClinicaRamos.Models.Especialidad> Listado = new List<Models.Especialidad>();

            ClinicaRamosEntities1 Datos = new ClinicaRamosEntities1();
            foreach (tblEspecialidad elemento in Datos.tblEspecialidad)
            {
                ClinicaRamos.Models.Especialidad objeto01 = new Models.Especialidad();
                objeto01.Id = elemento.Id;
                objeto01.Nombre = elemento.Nombre;      
                Listado.Add(objeto01);
            }

            return Json(Listado, JsonRequestBehavior.AllowGet);
        }
    }
}
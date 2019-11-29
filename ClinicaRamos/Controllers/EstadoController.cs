using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClinicaRamos.Controllers
{
    public class EstadoController : Controller
    {
        // GET: Estado
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult listarEstado()
        {
            List<ClinicaRamos.Models.Estado> Listado = new List<Models.Estado>();
            ClinicaRamosEntities2 Datos = new ClinicaRamosEntities2();
            foreach(tblEstado elemento in Datos.tblEstado)
            {
                ClinicaRamos.Models.Estado objeto01 = new Models.Estado();
                objeto01.Id = Convert.ToByte(elemento.Id);
                objeto01.Nombre = elemento.Nombre;
                Listado.Add(objeto01);
            }

            return Json(Listado, JsonRequestBehavior.AllowGet);
        }
    }
}
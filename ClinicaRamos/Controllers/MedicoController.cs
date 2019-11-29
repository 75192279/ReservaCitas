using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClinicaRamos.Controllers
{
    public class MedicoController : Controller
    {
        // GET: Medico
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult listarPorEspecialidad(byte argIdEspecialidad )
        {
            List<ClinicaRamos.Models.Medico> Listado = new List<Models.Medico>();

            ClinicaRamosEntities2 Datos = new ClinicaRamosEntities2();
            foreach (tblMedico elemento in Datos.tblMedico.Where(x => x.IdEspecialidad == argIdEspecialidad ))
            {
                ClinicaRamos.Models.Especialidad aux02 = new ClinicaRamos.Models.Especialidad();
                aux02.Nombre = elemento.tblEspecialidad.Nombre;
                
                ClinicaRamos.Models.Estado aux01 = new ClinicaRamos.Models.Estado();
                aux01.Nombre = elemento.tblEstado.Nombre;
                

                ClinicaRamos.Models.Medico objeto01 = new Models.Medico();
                objeto01.Id = Convert.ToByte(elemento.Id);
                objeto01.DNI = elemento.DNI;
                objeto01.Nombre = elemento.Nombre;
                objeto01.ApellidoPaterno = elemento.ApellidoPaterno;
                objeto01.ApellidoMaterno = elemento.ApellidoMaterno;
                objeto01.telefono = elemento.telefono;
                objeto01.EstadoDeMedico = aux01;
                Listado.Add(objeto01);
            }

            return Json(Listado, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Buscar_PorId(byte argId)
        {
            List<ClinicaRamos.Models.Medico> Listado = new List<Models.Medico>();

            ClinicaRamosEntities2 Datos = new ClinicaRamosEntities2();
            foreach (tblMedico elemento in Datos.tblMedico.Where(x => x.Id == argId))
            {
                ClinicaRamos.Models.Estado aux01 = new ClinicaRamos.Models.Estado();
                aux01.Nombre = elemento.tblEstado.Nombre;
                aux01.Id = Convert.ToByte(elemento.tblEstado.Id);

                ClinicaRamos.Models.Especialidad aux02 = new ClinicaRamos.Models.Especialidad();
                aux02.Nombre = elemento.tblEspecialidad.Nombre;
                aux02.Id = elemento.tblEspecialidad.Id;

                ClinicaRamos.Models.Medico objeto01 = new Models.Medico();
                  objeto01.Id = Convert.ToByte(elemento.Id);
                objeto01.DNI = elemento.DNI;
                objeto01.Nombre = elemento.Nombre;
                objeto01.ApellidoPaterno = elemento.ApellidoPaterno;
                objeto01.ApellidoMaterno = elemento.ApellidoMaterno;
                objeto01.telefono = elemento.telefono;
                objeto01.EstadoDeMedico = aux01;
                objeto01.EspecialidadDeMedico = aux02;
                Listado.Add(objeto01);
            }

            return Json(Listado, JsonRequestBehavior.AllowGet);
        }

     public bool Editar(ClinicaRamos.Models.Medico argNuevosDatosDeMedico)
        {
            ClinicaRamosEntities2 Datos = new ClinicaRamosEntities2();
            tblMedico medicoExistente = Datos.tblMedico.Where(x => x.Id == argNuevosDatosDeMedico.Id).First();
            medicoExistente.DNI = argNuevosDatosDeMedico.DNI;
            medicoExistente.Nombre = argNuevosDatosDeMedico.Nombre;
            medicoExistente.ApellidoPaterno = argNuevosDatosDeMedico.ApellidoPaterno;
            medicoExistente.ApellidoMaterno = argNuevosDatosDeMedico.ApellidoMaterno;
            medicoExistente.telefono = argNuevosDatosDeMedico.telefono;
            medicoExistente.IdEspecialidad = argNuevosDatosDeMedico.EspecialidadDeMedico.Id;
            medicoExistente.IdEstado = argNuevosDatosDeMedico.EstadoDeMedico.Id;

            try
            {
                Datos.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }



    }
}
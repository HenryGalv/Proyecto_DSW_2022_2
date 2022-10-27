using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Proyecto_DSW_2022.Models;
using Proyecto_DSW_2022.Models.ProductoDI;

namespace Proyecto_DSW_2022.Controllers
{
    public class ProyectoController : Controller
    {
        public readonly IConfiguration _iconfig;
        IProducto _inyector;
        public ProyectoController(IConfiguration iconfig)
        {
            _iconfig = iconfig;
            _inyector = new ProductoRepositorio(_iconfig["ConnectionStrings:cadena"]);
        }
        public IActionResult Portal()
        {
            return View(_inyector.catalogo());
        }
        public IActionResult Detalle(int id)
        {
            return View(_inyector.buscar(id));
        }
    }
}

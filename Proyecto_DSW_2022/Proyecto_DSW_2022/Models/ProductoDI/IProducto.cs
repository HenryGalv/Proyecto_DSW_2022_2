namespace Proyecto_DSW_2022.Models.ProductoDI
{
    public interface IProducto
    {
        IEnumerable<Producto> catalogo();
        Producto buscar(int id);
    }
}

namespace Proyecto_DSW_2022.Models
{
    public class Producto
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string categoria { get; set; }
        public string marca { get; set; }
        public decimal precio { get; set; }
        public Int16 stock { get; set; }
        public int idCategoria { get; set; }
        public int idMarca { get; set; }
        public Producto()
        {
            nombre = "";
            descripcion = "";
            categoria = "";
            marca = "";
        }
    }
}

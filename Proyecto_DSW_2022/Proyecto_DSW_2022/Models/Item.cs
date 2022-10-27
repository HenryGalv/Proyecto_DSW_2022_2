namespace Proyecto_DSW_2022.Models
{
    public class Item
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string categoria { get; set; }
        public string marca { get; set; }
        public decimal precio { get; set; }
        public int cantidad { get; set; }
        public decimal monto { get { return precio * cantidad; } } 
        public Item()
        {
            nombre = "";
            descripcion = "";
            categoria = "";
            marca = "";
        }
    }
}

using Microsoft.Data.SqlClient;

namespace Proyecto_DSW_2022.Models.ProductoDI
{
    public class ProductoRepositorio : IProducto
    {
        public string _cadena;
        public ProductoRepositorio(string cadena)
        {
            _cadena = cadena;
        }
        public IEnumerable<Producto> catalogo()
        {
            List<Producto> temporal = new List<Producto>();
            using (SqlConnection cn = new SqlConnection(_cadena))
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("EXEC usp_productos_cat_mar", cn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    temporal.Add(new Producto()
                    {
                        id = dr.GetInt32(0),
                        nombre = dr.GetString(1),
                        idCategoria = dr.GetInt32(2),
                        categoria = dr.GetString(3),
                        idMarca = dr.GetInt32(4),
                        marca = dr.GetString(5),
                        descripcion = dr.GetString(6),
                        precio = dr.GetDecimal(7),
                        stock = dr.GetInt16(8)
                    });
                }
                cn.Close();
            }
            return temporal;
        }
        public Producto buscar(int id)
        {
            return catalogo().Where(a => a.id == id).FirstOrDefault();
        }
    }
}

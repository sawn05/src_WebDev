using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1.data
{
    public class DeliveryAddress
    {
        ConnectionSQL connectionSQL = new ConnectionSQL();
        public DataTable GetListAddress(string username)
        {
            string query = "Select * from DiaChiGiaoHang where username = @username";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@username", username);
            return connectionSQL.GetData(cmd);
        }
    }
}
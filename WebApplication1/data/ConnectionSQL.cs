using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

namespace WebApplication1.data
{
    public class ConnectionSQL
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        public SqlConnection conn = new SqlConnection();

        public void OpenConnection()
        {
            if (conn.State == 0)
            {
                conn.ConnectionString = connectionString;
                conn.Open();
            }
        }

        public void CloseConnection()
        {
            if (conn != null && conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }


        public DataTable GetData(SqlCommand cmd)
        {
            if (cmd.Connection != null)
            {
                using (DataSet ds=new DataSet())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        da.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
            else
            {
                OpenConnection();
                try
                {
                    using (DataSet ds = new DataSet())
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter())
                        {
                            cmd.Connection = conn;
                            da.SelectCommand = cmd;
                            da.Fill(ds);
                            return ds.Tables[0];
                        }
                    }
                }
                finally
                {
                    CloseConnection();
                }
            }
        }
    }
}
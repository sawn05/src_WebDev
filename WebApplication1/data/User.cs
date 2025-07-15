using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace WebApplication1.data
{
    public class User
    {
        ConnectionSQL conn = new ConnectionSQL();
        public User()
        {

        }

        public string email { get; set; }
        public string nameAccount { get; set; }
        public string password { get; set; }

        public User(string email, string nameAccount, string password)
        {
            this.email = email;
            this.nameAccount = nameAccount;
            this.password = password;
        }

        public DataTable getList()
        {
            SqlCommand cmd = new SqlCommand("Select * from [User]");
            cmd.CommandType = CommandType.Text;
            return conn.GetData(cmd);
        }


        public DataTable GetUserByUsername(string username)
        {
            SqlCommand cmd = new SqlCommand("Select * from [User] Where username = @username");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@username", username);
            return conn.GetData(cmd);
        }

        public DataTable GetUserByEmail(string email)
        {
            SqlCommand cmd = new SqlCommand("Select * from [User] Where email = @email");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@email", email);
            return conn.GetData(cmd);
        }

        public void InsertUser(string username, string password)
        {
            conn.OpenConnection();
            using (SqlCommand command = new SqlCommand(
                "INSERT INTO [User] (username, password) VALUES (@username, @password)", conn.conn))
            {
                command.CommandType = CommandType.Text;
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);

                command.ExecuteNonQuery();
            }
            conn.CloseConnection();
        }
    }
}
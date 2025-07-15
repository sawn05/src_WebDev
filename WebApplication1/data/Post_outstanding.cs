using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1.data
{
    public class Post_outstanding
    {
        ConnectionSQL connectionSQL = new ConnectionSQL();
        public Post_outstanding()
        {

        }


        public DataTable getList()
        {
            SqlCommand cmd = new SqlCommand("Select * from BaiVietNoiBat");
            cmd.CommandType = CommandType.Text;
            return connectionSQL.GetData(cmd);
        }

        public void Insert(string tenChuDe, string hinhAnhChuDe, string noiDung, string maTheLoai)
        {
            connectionSQL.OpenConnection();
            using (SqlCommand command = new SqlCommand(
                "INSERT INTO BaiVietNoiBat (tenChuDe, hinhAnhChuDe, noiDung, maTheLoai) VALUES (@tenchude, @hinhanh, @noidung, @matheloai)",
                connectionSQL.conn))
            {
                command.CommandType = CommandType.Text;
                command.Parameters.AddWithValue("@tenchude", tenChuDe);
                command.Parameters.AddWithValue("@hinhanh", hinhAnhChuDe);
                command.Parameters.AddWithValue("@noidung", noiDung);
                command.Parameters.AddWithValue("@matheloai", maTheLoai);

                command.ExecuteNonQuery();
            }
            connectionSQL.CloseConnection();
        }

        public void Delete(string maChuDe)
        {
            connectionSQL.OpenConnection();
            using (SqlCommand cmd = new SqlCommand("DELETE FROM BaiVietNoiBat WHERE maChuDe = @maChuDe", connectionSQL.conn))
            {
                cmd.Parameters.AddWithValue("@maChuDe", maChuDe);
                cmd.ExecuteNonQuery();
            }
        }

        public DataTable GetListPostOutstading(int top)
        {
            string query = "Select  top " + top + " * from BaiVietNoiBat Order by maChuDe DESC";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectionSQL.GetData(cmd);
        }


        public DataTable GetListPostByID(string maChuDe)
        {
            SqlCommand cmd = new SqlCommand("Select * from BaiVietNoiBat Where maChuDe = @maChuDe");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@maChuDe", maChuDe);
            return connectionSQL.GetData(cmd);
        }

        public void Update(string maChuDe, string tenChuDe, string hinhAnhChuDe, string noiDung, string maTheLoai)
        {
            connectionSQL.OpenConnection();
            using (SqlCommand command = new SqlCommand(
                "Update BaiVietNoiBat Set tenChuDe = @tenChuDe, hinhAnhChuDe = @hinhAnhChuDe, noiDung = @noiDung, maTheLoai = @maTheLoai Where maChuDe = @maChuDe",
                connectionSQL.conn))
            {
                command.CommandType = CommandType.Text;
                command.Parameters.AddWithValue("@maChuDe", maChuDe);
                command.Parameters.AddWithValue("@tenChuDe", tenChuDe);
                command.Parameters.AddWithValue("@hinhAnhChuDe", hinhAnhChuDe);
                command.Parameters.AddWithValue("@noiDung", noiDung);
                command.Parameters.AddWithValue("@maTheLoai", maTheLoai);

                command.ExecuteNonQuery();
            }
            connectionSQL.CloseConnection();
        }


    }
}
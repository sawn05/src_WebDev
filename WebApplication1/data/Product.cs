using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1.data
{
    public class Product
    {
        ConnectionSQL connectionSQL = new ConnectionSQL();
        public Product()
        {

        }

        public DataTable getListBestSellingProduct(int top)
        {
            string query = "Select top " + top + " * from SanPham Order by soLuotban Desc ";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectionSQL.GetData(cmd);
        }

        public DataTable getListProduct()
        {
            string query = "Select *, donGia * (1 - giamGia / 100.0) AS giaMoi from SanPham";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectionSQL.GetData(cmd);
        }

        public DataTable getProductDetail_byProductID(string maSP)
        {
            string query = "SELECT SanPham.*, TheLoai.tenTheLoai FROM SanPham JOIN TheLoai ON SanPham.maTheLoai = TheLoai.maTheLoai WHERE SanPham.maSP = @maSP";
            SqlCommand sqlCommand = new SqlCommand(query);
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.Parameters.AddWithValue("@maSP", maSP);
            return connectionSQL.GetData(sqlCommand);
        }

        public DataTable getListProduct_WatchMore(string maTheLoai, string maSP, int top)
        {
            string query = "Select top " + top + " * from SanPham Where maTheLoai = @maTheLoai And maSP <> @maSP ORDER BY NEWID();";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@maTheLoai", maTheLoai);
            cmd.Parameters.AddWithValue("@maSP", maSP);
            return connectionSQL.GetData(cmd);
        }

        public DataTable getProductByNameProduct(string tenSP)
        {
            string query = "SELECT *, donGia * (1 - giamGia / 100.0) AS giaMoi FROM SanPham WHERE tenSP LIKE @tenSP";
            SqlCommand sqlCommand = new SqlCommand(query);
            sqlCommand.CommandType = CommandType.Text;

            sqlCommand.Parameters.AddWithValue("@tenSP", "%" + tenSP + "%");

            return connectionSQL.GetData(sqlCommand);
        }


        public DataTable GetAllCategoryName()
        {
            string query = "SELECT * FROM TheLoai";
            SqlCommand cmd = new SqlCommand(query);
            return connectionSQL.GetData(cmd);
        }

        public DataTable GetAllSupplier()
        {
            string query = "SELECT * FROM NhaCungCap";
            SqlCommand cmd = new SqlCommand(query);
            return connectionSQL.GetData(cmd);
        }

        public DataTable GetProductByCategoryCode(string maTheLoai)
        {
            string query = "SELECT *, donGia * (1 - giamGia / 100.0) AS giaMoi FROM SanPham WHERE maTheLoai LIKE @maTheLoai";
            SqlCommand sqlCommand = new SqlCommand(query);
            sqlCommand.CommandType = CommandType.Text;

            sqlCommand.Parameters.AddWithValue("@maTheLoai", maTheLoai);
            return connectionSQL.GetData(sqlCommand);
        }

        public DataTable searchProductByFilter(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql);
            cmd.CommandType = CommandType.Text;
            return connectionSQL.GetData(cmd);
        }


        public void Insert(string maSP, string tenSP, decimal donGia, string maTL, string maNCC, int soLuong, decimal giamGia, float danhGia, string hinhAnh,
            string moTa)
        {

            connectionSQL.OpenConnection();
            using (SqlCommand command = new SqlCommand(
                "INSERT INTO SanPham (maSP, tenSP, donGia, maTheLoai, maNCC, slTon, giamGia, danhGia, luotDanhGia, hinhAnhSanPham, soLuotBan, moTa)" +
                " VALUES (@maSP, @tenSP, @donGia, @maTL, @maNCC, @slTon, @giamGia, @danhGia, @luotDanhGia, @hinhAnhSanPham, @soLuotBan, @moTa)",
                connectionSQL.conn))
            {
                command.CommandType = CommandType.Text;
                command.Parameters.AddWithValue("@maSP", maSP);
                command.Parameters.AddWithValue("@tenSP", tenSP);
                command.Parameters.AddWithValue("@donGia", donGia);
                command.Parameters.AddWithValue("@maTL", maTL);
                command.Parameters.AddWithValue("@maNCC", maNCC);
                command.Parameters.AddWithValue("@slTon", soLuong);
                command.Parameters.AddWithValue("@giamGia", giamGia);
                command.Parameters.AddWithValue("@danhGia", danhGia);
                command.Parameters.AddWithValue("@luotDanhGia", 0);
                command.Parameters.AddWithValue("@hinhAnhSanPham", hinhAnh);
                command.Parameters.AddWithValue("@soLuotBan", 0);
                command.Parameters.AddWithValue("@moTa", moTa);

                command.ExecuteNonQuery();
            }
            connectionSQL.CloseConnection();
        }

        public void Delete(string maSP)
        {
            connectionSQL.OpenConnection();
            using (SqlCommand command = new SqlCommand(
                "Delete from SanPham Where maSP = @maSP",
                connectionSQL.conn))
            {
                command.CommandType = CommandType.Text;
                command.Parameters.AddWithValue("@maSP", maSP);
                command.ExecuteNonQuery();
            }
            connectionSQL.CloseConnection();
        }



        public DataTable GetProductByOrderID(string username)
        {
            string query = @"SELECT hd.maHD, hd.trangThai, sp.tenSP, sp.moTa, sp.donGia, sp.giamGia, 
                        sp.hinhAnhSanPham, ctdh.soLuongMua, hd.tongTien
                 FROM HoaDon hd
                 JOIN CTDonHang ctdh ON hd.maHD = ctdh.maHD
                 JOIN SanPham sp ON ctdh.maSP = sp.maSP
                 WHERE hd.username = @username
                 ORDER BY hd.ngayLap DESC";

            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@username", username);
            return connectionSQL.GetData(cmd);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace WebApplication1.data
{
    internal class Order
    {
        ConnectionSQL connectionSQL = new ConnectionSQL();
        public Order() { }
        private string maHD;

        public void InsertToOrder(string username, decimal tongTien, DateTime ngayLap, string ghiChu, string PTTT)
        {
            maHD = createOrderID();
            connectionSQL.OpenConnection();
            using (SqlCommand cmd = new SqlCommand(
                "INSERT INTO HoaDon (maHD, username, tongTien, ngayLap, ghiChu, phuongThucThanhToan) VALUES (@maHD, @username, @tongTien, CAST(@ngayLap AS DATE), @ghiChu, @phuongThucThanhToan)",
                connectionSQL.conn))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@maHD", maHD);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@tongTien", tongTien);
                cmd.Parameters.AddWithValue("@ngayLap", ngayLap);
                cmd.Parameters.AddWithValue("@ghiChu", ghiChu);
                cmd.Parameters.AddWithValue("@phuongThucThanhToan", PTTT);

                cmd.ExecuteNonQuery();
            }
            connectionSQL.CloseConnection();
        }


        private string createOrderID()
        {
            string maHD = "HD001";
            string query = "SELECT TOP 1 maHD FROM HoaDon ORDER BY maHD DESC";

            connectionSQL.OpenConnection();
            using (SqlCommand cmd = new SqlCommand(query, connectionSQL.conn))
            {
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    string lastMaHD = result.ToString();
                    int soThuTu = int.Parse(lastMaHD.Substring(2)) + 1;
                    maHD = "HD" + soThuTu.ToString("D3");
                }
            }
            connectionSQL.CloseConnection();
            return maHD;
        }

        
        public void InsertToOrderDetails(string username, string maSP, int soLuong, float donGia)
        {
            string maHoaDon = !string.IsNullOrEmpty(maHD) ? maHD : "";
            connectionSQL.OpenConnection();
            using (SqlCommand cmd = new SqlCommand(
                "INSERT INTO CTDonHang (maHD, maSP, soLuongMua, giaDonHang) VALUES (@maHoaDon, @maSP, @soLuong, @donGia)",
                connectionSQL.conn))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@maHoaDon", maHoaDon);
                cmd.Parameters.AddWithValue("@maSP", maSP);
                cmd.Parameters.AddWithValue("@soLuong", soLuong);
                cmd.Parameters.AddWithValue("@donGia", donGia);
                cmd.ExecuteNonQuery();
            }
            connectionSQL.CloseConnection();
        }


    }
}
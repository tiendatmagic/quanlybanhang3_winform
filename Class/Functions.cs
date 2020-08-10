using System;
using System.Collections.Generic;

using System.Text;
using System.Threading;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;


namespace Quanlybanhang.Class
{
    class Functions
    {
        public static SqlConnection conn; // biến conn để kết nối đến csdl

        public static void Connect()
        {
            conn = new SqlConnection("Data Source=ADMIN\\SQLEXPRESS;Initial Catalog=Quanlybanhang;Integrated Security=True");
            conn.Open();
            if (conn.State == ConnectionState.Open)
                MessageBox.Show("Kết nối thành công");

            else MessageBox.Show("Kết nối không thành công");
        }

        // Phương thức kết nối CSDL
        public static void DisConnect()
        {
            if (conn.State == ConnectionState.Open) // kiểm tra kết nối có mở hay không
            {
                conn.Close(); // đóng kết nối
                conn.Dispose();// giải phóng tài nguyên
                conn = null;
            }
        }

        public static DataTable GetDataToTable(string sql)
        {
            SqlDataAdapter MyData = new SqlDataAdapter(); /*Định nghĩa đối tượng thuộc lớp SqlDataAdapter*/
            //Tạo đối tượng thuộc lớp SqlCommand
            MyData.SelectCommand = new SqlCommand();
            MyData.SelectCommand.Connection = Functions.conn; /*Kết nối cơ sở dữ liệu*/
            MyData.SelectCommand.CommandText = sql; //Lệnh SQL
            //Khai báo đối tượng table thuộc lớp DataTable
            DataTable table = new DataTable();
            MyData.Fill(table);
            return table;
        }

        public static bool CheckKey(string sql)
        {
            //SqlDataAdapter MyData = new SqlDataAdapter(sql, Con);
            SqlDataAdapter MyData = new SqlDataAdapter(sql, conn);
            DataTable table = new DataTable();
            MyData.Fill(table);
            if (table.Rows.Count > 0)
                return true;
            else return false;
        }

        public static void RunSQL(string sql)
        {
            SqlCommand cmd; //Đối tượng thuộc lớp SqlCommand
            cmd = new SqlCommand();
            //cmd.Connection = Con; 
            cmd.Connection = conn;
            //Gán kết nối
            cmd.CommandText = sql; //Gán lệnh SQL
            try
            {
                cmd.ExecuteNonQuery(); //Thực hiện câu lệnh SQL
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            cmd.Dispose();//Giải phóng bộ nhớ
            cmd = null;
        }


        public static void RunSqlDel(string sql)
        {
            SqlCommand cmd = new SqlCommand();
            //cmd.Connection = Functions.Con;
            cmd.Connection = Functions.conn;
            cmd.CommandText = sql;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Dữ liệu đang được dùng, không thể xoá...", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                MessageBox.Show(ex.ToString());
            }
            cmd.Dispose();
            cmd = null;
        }




    }
}

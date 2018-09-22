using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace LiveMap
{
    class Program
    {
        static void Main(string args)
        {
        }
    }
    public partial class LiveMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            connect("SELECT * FROM events");// WHERE date > '23.09.2018 09:00:00'");            
        }
        public void connect(string a)
        {
            string connString = "Server=den1.mysql6.gear.host;Port=3306;Database=mysqlliv;Uid=mysqlliv;password=5eaPea3#;SslMode=none;";
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = a;// "SELECT * FROM tracks WHERE id=3";
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Label1.Text = reader["location"].ToString();
            }

        }

        public void SelectData()
        {
            string connString = "Server=den1.mysql6.gear.host;Port=3306;Database=mysqlliv;Uid=mysqlliv;password=5eaPea3#;SslMode=none;";
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "SELECT * FROM tracks WHERE id=3";
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Label1.Text=reader["track"].ToString();
            }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SelectData();
        }
    }
}
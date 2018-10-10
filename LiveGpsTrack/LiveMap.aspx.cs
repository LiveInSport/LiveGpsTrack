using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections;

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
//        public IHtmlString Raw( List<string> eloc);
        public List<string> eName = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        public void Connect(string a)
        {
            string connString = "Server=den1.mysql6.gear.host;Port=3306;Database=mysqlliv;Uid=mysqlliv;password=5eaPea3#;SslMode=none;";
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = a;// "SELECT * FROM tracks WHERE id=3";
            MySqlDataReader reader = command.ExecuteReader();
            List<string> locatio = new List<string>();
            List<string> Name = new List<string>();

            while (reader.Read())
            {
                locatio.Add(reader["drivers"].ToString());
         
                Name.Add(reader["name"].ToString());
                reader.GetFloat(1);
            }
            conn.Close();
      //      Raw = locatio.ToList();
            eName = Name.ToList();
        }
        public void BindData()
        {
            MySqlConnection conn = new MySqlConnection("Server=den1.mysql6.gear.host;Port=3306;Database=mysqlliv;Uid=mysqlliv;password=5eaPea3#;SslMode=none;");
            conn.Open();
            MySqlCommand command = new MySqlCommand("SELECT * FROM events", conn);
            MySqlDataAdapter adb = new MySqlDataAdapter(command);
            DataSet ds = new DataSet();
            adb.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            conn.Close();
            command.Dispose();
        }
    }
}
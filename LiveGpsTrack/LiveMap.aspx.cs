using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            Connect("SELECT * FROM events ");
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

            while (reader.Read())
            {
                locatio.Add(reader["drivers"].ToString());
                //Events.Add(new Event((float)reader["lat"], (float)reader["lng"], reader["Name"].ToString()));
                
                //Label1.Text = Label1.Text + (float)reader["lat"];
                //Label1.Text = Label1.Text + reader["location"].ToString();
                //reader.GetString(1);
                reader.GetFloat(1);
            }
            conn.Close();
            var all = String.Join(", ", locatio.ToArray());
            Label1.Text = all;
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace LiveGpsTrack
{
    public partial class Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            BindData(id);
        }
        public void BindData(String id)
        {
            MySqlConnection conn = new MySqlConnection("Server=den1.mysql6.gear.host;Port=3306;Database=mysqlliv;Uid=mysqlliv;password=5eaPea3#;SslMode=none;");
            conn.Open();
            MySqlCommand command = new MySqlCommand("SELECT * FROM events WHERE id="+ id, conn);
            MySqlDataAdapter adb = new MySqlDataAdapter(command);
            DataSet ds = new DataSet();
            adb.Fill(ds);
            DetailsView1.DataSource = ds;
            DetailsView1.DataBind();
            conn.Close();
            command.Dispose();
        }

    }
}
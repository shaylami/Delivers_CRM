using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivers_CRM.Pages
{
    public partial class Delivers : System.Web.UI.Page
    {
        SqlConnection connection;
        System.Timers.Timer t = new System.Timers.Timer();
        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            Clock();
            lblUserName.Text = Application["FullName"].ToString();
        }
        private void DBCon()
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            //connetionString = "Data Source = localhost; Initial Catalog = Weeles_100_DB; Persist Security Info = True; User ID = weeles100; Password = A123a123";
            //connection = new SqlConnection(connetionString);
        }
        private void Clock()
        {
            DateTime dt = DateTime.Now;
            string datetimeformat = "dd/MM/yyyy HH:mm:ss";
            lblCurrentDateTime.Text = dt.ToString(datetimeformat);
        }

    }
}
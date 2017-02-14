using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivers_CRM.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        System.Timers.Timer t = new System.Timers.Timer();
        SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            Clock();
            lblUserName.Text = Application["FullName"].ToString();
            //string fname = Request.QueryString["FullName"];
            //lblUserName.Text = fname;
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
        protected void TimerClock_Tick(object sender, EventArgs e)
        {
            
            int counter = 0;
            if (counter >= 1)
            {
                t.Enabled = false;
            }
            else
            {
                //do something here
                Clock();
                counter++;
            }
        }
        private void GVPOPBikeJornalData()
        {
            //connection.Open();
            //SqlCommand cmd = connection.CreateCommand();
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "SELECT Bike_Jornal_ID,Bike_Current_Owner,Comments FROM Bike_Jornal";
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //GvJornal.DataSource = dt;
            //GvJornal.DataBind();
            //connection.Close();
        }
    }
}
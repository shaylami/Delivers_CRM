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
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            lblUserName.Text = "a";
            lblUserName.Text = "שלום : " + Application["FullName"].ToString();
            Clock();
        }
        private void DBCon()
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
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

        protected void BtnAddNewDeliver2Bike_Click(object sender, EventArgs e)
        {
            DVAddDeliver2Bike.Visible = true;
            GVDeliverBikeList.Visible = false;
        }

        protected void BtnDeliversBikesList_Click(object sender, EventArgs e)
        {
            DVAddDeliver2Bike.Visible = false;
            GVDeliverBikeList.Visible = true;
            GVDeliverBikeList.DataBind();
        }

        protected void DVAddDeliver2Bike_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            try
            {
                string BikePlate, CurrentDateTime, DelvierSend, DeliverGet, Km, FinalDeliverName, Comments;
                DropDownList DDLBike_Plate = DVAddDeliver2Bike.FindControl("DDL_BikePlate") as DropDownList;
                TextBox TBCurrentDT = DVAddDeliver2Bike.FindControl("TBCurrentTodatDateTime") as TextBox;
                DropDownList tbDelvierSend = DVAddDeliver2Bike.FindControl("DDLDeliverSend") as DropDownList;
                DropDownList tbDDLDeliverGetBike = DVAddDeliver2Bike.FindControl("DDLDeliverGetBike") as DropDownList;
                TextBox tbkm = DVAddDeliver2Bike.FindControl("TBKM") as TextBox;
                Label tbFinallDeliverName = DVAddDeliver2Bike.FindControl("TBFinallDeliverName") as Label;
                TextBox tbComments = DVAddDeliver2Bike.FindControl("TBComments") as TextBox;
                BikePlate = DDLBike_Plate.Text.ToString();
                CurrentDateTime = DateTime.Now.ToString();
                DelvierSend = tbDelvierSend.Text.ToString();
                DeliverGet = tbDDLDeliverGetBike.Text.ToString();
                Km = tbkm.Text.ToString();
                FinalDeliverName = DeliverGet;
                Comments = tbComments.Text.ToString();
                DBCon();
                string query = "INSERT INTO Bike_Jornal(Bike_Plate,Tody_Date_Time,Deliver_return_Bike,Deliver_get_Bike,Bike_Km,Bike_Current_Owner,Comments) VALUES (@Bike_Plate,@Tody_Date_Time,@Deliver_return_Bike,@Deliver_get_Bike,@Bike_Km,@Bike_Current_Owner,@Comments)";
                using (cmd = new SqlCommand(query))
                {
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@Bike_Plate", BikePlate);
                    cmd.Parameters.AddWithValue("@Tody_Date_Time", CurrentDateTime);
                    cmd.Parameters.AddWithValue("@Deliver_return_Bike", DelvierSend);
                    cmd.Parameters.AddWithValue("@Deliver_get_Bike", DeliverGet);
                    cmd.Parameters.AddWithValue("@Bike_Km", Km);
                    cmd.Parameters.AddWithValue("@Bike_Current_Owner", FinalDeliverName);
                    cmd.Parameters.AddWithValue("@Comments", Comments);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                string exeption = ex.ToString();
            }
        }

        protected void DVAddDeliver2Bike_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            DVAddDeliver2Bike.Visible = false;
            GVDeliverBikeList.Visible = true;
            GVDeliverBikeList.DataBind();
        }
    }
}
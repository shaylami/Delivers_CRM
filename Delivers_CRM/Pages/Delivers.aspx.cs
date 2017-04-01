using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
        SqlCommand cmd;
        SqlDataReader dataReader;
        SqlDataAdapter dataAdapter;
        string BlueId = "";
        System.Timers.Timer t = new System.Timers.Timer();
        protected void Page_Load(object sender, EventArgs e)
        {
            DVInsertDelivers.Visible = false;
            t.Enabled = true;
            Clock();
            if (string.IsNullOrEmpty(lblUserName.Text))
            {
                Response.Redirect("Pages/Login.aspx", false);
            }
            else
            {
                lblUserName.Text = "שלום : " + Application["FullName"].ToString();
            }
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

        protected void BtnInsertDeliver_Click(object sender, EventArgs e)
        {
            DVInsertDelivers.Visible = true;
            GvAllDelives.Visible = false;
        }

        protected void BtnViewAllDelivers_Click(object sender, EventArgs e)
        {
            DVInsertDelivers.Visible = false;
            GvAllDelives.Visible = true;
            GvAllDelives.DataBind();
        }

        protected void DVInsertDelivers_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            DVInsertDelivers.DataSource = null;
            Response.Write("<script>alert('המידע הוסף בהצלחה')</script>");
            DVInsertDelivers.DataBind();
            DVInsertDelivers.Visible = true;
        }
        public void DVGetDeatils()
        {
            try
            {
                DBCon();
                connection.Open();
                string sql = "SELECT * FROM Deliver_Person WHERE Deliver_Blue_ID='" + BlueId + "'";
                cmd = new SqlCommand(sql, connection);
                DataTable dt = new DataTable();
                dataAdapter = new SqlDataAdapter(cmd);
                dataAdapter.Fill(dt);
                DVShowDetails.DataSource = dt;
                DVShowDetails.DataBind();
                cmd.Dispose();
                connection.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }

        }

        protected void GvAllDelives_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBCon();
            try
            {
                BlueId = ((Label)GvAllDelives.SelectedRow.FindControl("Label2")).Text;
                string sql = "SELECT * FROM Deliver_Person WHERE Deliver_Blue_ID='" + BlueId + "'";
                connection.Open();
                cmd = new SqlCommand(sql, connection);
                dataReader = cmd.ExecuteReader();
                if (dataReader.Read())
                {
                    DVGetDeatils();
                }
                dataReader.Close();

            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                connection.Close();
            }
        }
    }
    }

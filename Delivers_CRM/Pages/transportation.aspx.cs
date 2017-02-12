using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivers_CRM.Pages
{
    public partial class transportation : System.Web.UI.Page
    {
        System.Timers.Timer t = new System.Timers.Timer();
        SqlConnection connection;
        SqlCommand cmd;
        SqlDataReader dataReader; 
        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            Clock();
            string fname = Request.QueryString["FullName"];
            lblUserName.Text = Application["FullName"].ToString();
            
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

        protected void AddNewBike_Click(object sender, EventArgs e)
        {
            DVAddBike.Visible = true;
            GVAllBikes.Visible = false;
        }

        protected void ViewAllBikes_Click(object sender, EventArgs e)
        {
            DVAddBike.Visible = false;
            GVAllBikes.Visible = true;
        }

        protected void DVAddBike_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            try
            {
                string Bike_Plate, Bike_Model, Bike_Color, Year_of_Production;
                TextBox tbBike_Plate = DVAddBike.FindControl("tbBike_Plate") as TextBox;
                TextBox tbBike_Model = DVAddBike.FindControl("tbBike_Model") as TextBox;
                TextBox tbBike_Color = DVAddBike.FindControl("tbBike_Color") as TextBox;
                TextBox tbYear_of_Production = DVAddBike.FindControl("tbYear_of_Production") as TextBox;
                Bike_Plate = tbBike_Plate.ToString();
                Bike_Model = tbBike_Model.ToString();
                Bike_Color = tbBike_Color.ToString();
                Year_of_Production = tbYear_of_Production.ToString();
                DBCon();
                string query = "INSERT INTO Motor_Bike(Bike_Plate,Bike_Model,Bike_Color,Year_of_Production) VALUES (@Bike_Plate,@Bike_Model,@Bike_Color,@Year_of_Production)";
                using (cmd = new SqlCommand(query))
                {
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@Bike_Plate", Bike_Plate);
                    cmd.Parameters.AddWithValue("@Bike_Model", Bike_Model);
                    cmd.Parameters.AddWithValue("@Bike_Color", Bike_Color);
                    cmd.Parameters.AddWithValue("@Year_of_Production", Year_of_Production);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch(Exception ex)
            {

            }
        }
        protected void FileUploadDoc(object sender, EventArgs e)
        {
            FileUpload fu = DVAddBike.FindControl("FUCarLicense") as FileUpload;
            string filename = Path.GetFileName(fu.PostedFile.FileName);
            string contentType = fu.PostedFile.ContentType;
            using (Stream fs = fu.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    DBCon();
                    {
                        string query = "INSERT INTO Motor_Bike (Car_License_Name,Car_License_Type,Car_License_Data) VALUES (@Car_License_Name,@Car_License_Type,@Car_License_Data)";
                        using (cmd = new SqlCommand(query))
                        {
                            cmd.Connection = connection;
                            cmd.Parameters.AddWithValue("@Car_License_Name", filename);
                            cmd.Parameters.AddWithValue("@Car_License_Type", contentType);
                            cmd.Parameters.AddWithValue("@Car_License_Data", bytes);
                            connection.Open();
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}
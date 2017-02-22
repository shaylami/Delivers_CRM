using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
        string bikeID = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            Clock();
            string fname = Request.QueryString["FullName"];
            lblUserName.Text = "שלום : "+Application["FullName"].ToString();
            
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
            ltEmbedHT.Visible = false;
        }

        protected void ViewAllBikes_Click(object sender, EventArgs e)
        {
            DVAddBike.Visible = false;
            GVAllBikes.Visible = true;
            GVAllBikes.DataBind();
        }

        protected void DVAddBike_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            try
            {
                byte[] bytes;
                string Bike_Plate, Bike_Model, Bike_Color, Year_of_Production,FUFileName,FUContentType;
                TextBox tbBike_Plate = DVAddBike.FindControl("tbBike_Plate") as TextBox;
                TextBox tbBike_Model = DVAddBike.FindControl("tbBike_Model") as TextBox;
                TextBox tbBike_Color = DVAddBike.FindControl("tbBike_Color") as TextBox;
                TextBox tbYear_of_Production = DVAddBike.FindControl("tbYear_of_Production") as TextBox;
                FileUpload fu = DVAddBike.FindControl("FUCarLicense") as FileUpload;
                FUFileName = Path.GetFileName(fu.PostedFile.FileName);
                FUContentType = fu.PostedFile.ContentType;
                Bike_Plate = tbBike_Plate.Text.ToString();
                Bike_Model = tbBike_Model.Text.ToString();
                Bike_Color = tbBike_Color.Text.ToString();
                Year_of_Production = tbYear_of_Production.Text.ToString();
                using (Stream fs = fu.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        bytes = br.ReadBytes((Int32)fs.Length);
                    }
                }
                DBCon();
                string query = "INSERT INTO Motor_Bike(Bike_Plate,Bike_Model,Bike_Color,Year_of_Production,Car_License_Name,Car_License_Type,Car_License_Data) VALUES (@Bike_Plate,@Bike_Model,@Bike_Color,@Year_of_Production,@Car_License_Name,@Car_License_Type,@Car_License_Data)";
                using (cmd = new SqlCommand(query))
                {
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@Bike_Plate", Bike_Plate);
                    cmd.Parameters.AddWithValue("@Bike_Model", Bike_Model);
                    cmd.Parameters.AddWithValue("@Bike_Color", Bike_Color);
                    cmd.Parameters.AddWithValue("@Year_of_Production", Year_of_Production);
                    cmd.Parameters.AddWithValue("@Car_License_Name", FUFileName);
                    cmd.Parameters.AddWithValue("@Car_License_Type", FUContentType);
                    cmd.Parameters.AddWithValue("@Car_License_Data", bytes);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch(Exception ex)
            {
                string exeption = ex.ToString();
            }

        }

        protected void ViewFile(object sender, EventArgs e)
        {
            ltEmbedHT.Text = "";
            int id = int.Parse((sender as LinkButton).CommandArgument);
            string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"800px\" height=\"600px\">";
            embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
            embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
            embed += "</object>";
            ltEmbedHT.Text = string.Format(embed, ResolveUrl("~/Pdfhandler.ashx?Id="), id);

        }

        protected void DVAddBike_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            DVAddBike.Visible = false;
            GVAllBikes.Visible = true;
            GVAllBikes.DataBind();
        }
    }
}
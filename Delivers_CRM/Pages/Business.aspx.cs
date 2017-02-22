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
    public partial class Business : System.Web.UI.Page
    {
        SqlConnection connection;
        System.Timers.Timer t = new System.Timers.Timer();
        SqlCommand cmd;
        SqlDataReader dataReader;
        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            Clock();
            lblUserName.Text = "שלום : "+Application["FullName"].ToString();
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

        protected void DVAddNewCustomer_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            try
            {
                byte[] bytes;
                string Bussines_Name, Bussines_Phone, Bussines_Mobile, Bussines_Fax, Bussines_Address, Bussines_Owner, Bussines_Ownre_Mobile, Bussines_WorkingHouers, Bussines_Type, Bussines_LogoName, Bussines_LogoType, Bussines_LogoData, Bussines_CustomerAddDate;
                TextBox _Bussines_Name = DVAddNewCustomer.FindControl("TBBussines_Name") as TextBox;
                TextBox _Bussines_Phone = DVAddNewCustomer.FindControl("TBBussines_Phone") as TextBox;
                TextBox _Bussines_Mobile = DVAddNewCustomer.FindControl("TBBussines_Mobile") as TextBox;
                TextBox _Bussines_Fax = DVAddNewCustomer.FindControl("TBBussines_Fax") as TextBox;
                TextBox _Bussines_Address = DVAddNewCustomer.FindControl("TBBussines_Address") as TextBox;
                TextBox _Bussines_Owner = DVAddNewCustomer.FindControl("TBBussines_Owner") as TextBox;
                TextBox _Bussines_Ownre_Mobile = DVAddNewCustomer.FindControl("TBBussines_Owner_Mobile") as TextBox;
                TextBox _Bussines_WorkingHouers = DVAddNewCustomer.FindControl("TBBussines_WorkingHouers") as TextBox;
                TextBox _Bussines_Type = DVAddNewCustomer.FindControl("TBBussines_Type") as TextBox;
                FileUpload _FULogo = DVAddNewCustomer.FindControl("FP_Logo") as FileUpload;

                Bussines_LogoName = System.IO.Path.GetFileName(_FULogo.PostedFile.FileName);
                Bussines_LogoType = _FULogo.PostedFile.ContentType;
                Bussines_Name = _Bussines_Name.Text.ToString();
                Bussines_Phone = _Bussines_Phone.Text.ToString();
                Bussines_Mobile = _Bussines_Mobile.Text.ToString();
                Bussines_Fax = _Bussines_Fax.Text.ToString();
                Bussines_Address = _Bussines_Address.Text.ToString();
                Bussines_Owner = _Bussines_Owner.Text.ToString();
                Bussines_Ownre_Mobile = _Bussines_Ownre_Mobile.Text.ToString();
                Bussines_WorkingHouers = _Bussines_WorkingHouers.Text.ToString();
                Bussines_Type = _Bussines_Type.Text.ToString();
                Bussines_CustomerAddDate = lblCurrentDateTime.Text;
                using (Stream fs = _FULogo.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        bytes = br.ReadBytes((Int32)fs.Length);
                    }
                }
                DBCon();
                string query = "INSERT INTO Bussines_Customers(Bussines_Name,Bussines_Phone,Bussines_Mobile,Bussines_Fax,Bussines_Address,Bussines_Owner,Bussines_Ownre_Mobile,Bussines_WorkingHouers,Bussines_LogoName,Bussines_Type,Bussines_LogoType,Bussines_LogoData,Bussines_CustomerAddDate) VALUES (@Bussines_Name,@Bussines_Phone,@Bussines_Mobile,@Bussines_Fax,@Bussines_Address,Bussines_Owner,@Bussines_Ownre_Mobile,@Bussines_WorkingHouers,@Bussines_Type,@Bussines_LogoName,@Bussines_LogoType,@Bussines_LogoData,@Bussines_CustomerAddDate)";
                using (cmd = new SqlCommand(query))
                {
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@Bussines_Name", Bussines_Name);
                    cmd.Parameters.AddWithValue("@Bussines_Phone", Bussines_Phone);
                    cmd.Parameters.AddWithValue("@Bussines_Mobile", Bussines_Mobile);
                    cmd.Parameters.AddWithValue("@Bussines_Fax", Bussines_Fax);
                    cmd.Parameters.AddWithValue("@Bussines_Address", Bussines_Address);
                    cmd.Parameters.AddWithValue("@Bussines_Owner", Bussines_Owner);
                    cmd.Parameters.AddWithValue("@Bussines_Ownre_Mobile", Bussines_Ownre_Mobile);
                    cmd.Parameters.AddWithValue("@Bussines_WorkingHouers", Bussines_WorkingHouers);
                    cmd.Parameters.AddWithValue("@Bussines_Type", Bussines_Type);
                    cmd.Parameters.AddWithValue("@Bussines_LogoName", Bussines_LogoName);
                    cmd.Parameters.AddWithValue("@Bussines_LogoType", Bussines_LogoType);
                    cmd.Parameters.AddWithValue("@Bussines_LogoData", bytes);
                    cmd.Parameters.AddWithValue("@Bussines_CustomerAddDate", Bussines_CustomerAddDate);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                Response.Write("<script>alert('Data inserted successfully')</script>");
            }
            catch (Exception ex)
            {
                string exeption = ex.ToString();
            }

        }

        protected void DVAddNewCustomer_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            DVAddNewCustomer.Visible = false;
            //GVAllBikes.Visible = true;
            //GVAllBikes.DataBind();
        }
    }
}
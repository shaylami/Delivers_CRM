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
    public partial class Login : System.Web.UI.Page
    {
        //string connetionString = null;
        SqlConnection connection;
        SqlCommand cmd;
        SqlDataReader dataReader;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void DBCon()
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            //connetionString = "Data Source = localhost; Initial Catalog = Weeles_100_DB; Persist Security Info = True; User ID = weeles100; Password = A123a123";
            //connection = new SqlConnection(connetionString);
        }
        protected void UserLogin_Click(object sender, EventArgs e)
        {
            VerifyUserPWDLogin();
        }
        private void VerifyUserPWDLogin()
        {
            string email, password,isActive="True",FullName=null;
            email = TBEmail.Text;
            password = TBPWD.Text;
            if (email == string.Empty || password == string.Empty)
            {
                lblError.Text = "אוופס !!!! נא לבדוק שם משתמש וסיסמא";
                lblError.Visible = true;
            }
            else
            {
                DBCon();
                try
                {


                    string sql = "SELECT FullName,Email,IsActive,Password FROM Login_Users WHERE Email='" + email + "' AND Password='" + password+"' AND IsActive='" + isActive+"'";
                    connection.Open();               
                    cmd = new SqlCommand(sql,connection);
                    dataReader = cmd.ExecuteReader();
                    if(dataReader.Read())
                    { 
                        //string email = (string)reader["Email"];
                        FullName = (string)dataReader["FullName"];
                        Application["FullName"] = FullName;
                        //lblError.Text = FullName;
                    }
                    dataReader.Close();
                    if(isActive == "False")
                    {
                        lblError.Visible = true;
                        lblError.Text = "משתמש לא מורשה להתחבר";
                        return;
                    }

                }
                catch (Exception ex)
                {
                    lblError.Text = ex.ToString();
                    lblError.Visible = true;
                }
                finally
                {
                    if(cmd != null)
                    {
                        cmd.Dispose();
                    }
                    connection.Close();
                    //Response.Redirect("Home.aspx?FullName="+FullName);
                    Response.Redirect("Pages/Home.aspx",false);
                }
            }

        }
    }
}
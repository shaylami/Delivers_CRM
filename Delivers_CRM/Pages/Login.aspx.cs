using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivers_CRM.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        string connetionString = null;
        SqlConnection connection;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void DBCon()
        {
            connetionString = "Data Source = localhost; Initial Catalog = Weeles_100_DB; Persist Security Info = True; User ID = weeles100; Password = A123a123";
            connection = new SqlConnection(connetionString);
        }
        protected void UserLogin_Click(object sender, EventArgs e)
        {
            VerifyUserPWDLogin();
        }
        private void VerifyUserPWDLogin()
        {
            string email, password;
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
                    string sql = "select * from Login_Users where Email=" + email + "AND Password=" + password;
                    connection.Open();
                    cmd = new SqlCommand(sql, connection);
                    cmd.Dispose();
                    connection.Close();
                    lblError.Text = "ok";
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.ToString();
                    lblError.Visible = true;
                }
            }

        }
    }
}
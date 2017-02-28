using System;
using Android.App;
using Android.Content;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.OS;
using Android.Net;
using Android.Telephony;
using System.Data.SqlClient;

namespace DeliverCrm_App_Droid
{
    [Activity(Label = "DeliverCrm_App_Droid", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : Activity
    {
        TextView _IsOnlineText;
        EditText _Mobile;
        Button _login;
        SqlConnection connection;
        SqlCommand cmd;
        SqlDataReader dataReader;
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);
            CheckNetworkState();
            GetMobileNumber();
            _login = (Button)FindViewById(Resource.Id.LogIn);
            _login.Click += (o, e) => { CheckMobileNumberInDB(); };

        }
        public void LoginButtonClicked()
        {
            _login = (Button)FindViewById(Resource.Id.LogIn);
            CheckMobileNumberInDB();
        }
        private void DBCon()
        {
            connection = new SqlConnection(@"Server=soft.solveit.co.il,1433;Database=Weeles_100_DB;User ID=weeles100;Password=A123a123");
        }
        private void CheckMobileNumberInDB()
        {
            AlertDialog.Builder alert = new AlertDialog.Builder(this);
            DBCon();
            string _mobile = _Mobile.Text;
            try
            {
                string sql = "SELECT * FROM Deliver_Person";// WHERE Deliver_Mobile = '"+_mobile+"'";
                connection.Open();
                cmd = new SqlCommand(sql, connection);
                dataReader = cmd.ExecuteReader();
                if (dataReader.Read())
                {
                    //string email = (string)reader["Email"];
                    _mobile = (string)dataReader["Deliver_Mobile"];
                    //lblError.Text = FullName;
                }
                dataReader.Close();

            }
            catch (Exception ex)
            {
                alert.SetTitle("Error");
                alert.SetMessage(ex.ToString());
                Dialog dialog = alert.Create();
                dialog.Show();
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
        private void CheckNetworkState()
        {
            ConnectivityManager connectivityManager = (ConnectivityManager)GetSystemService(ConnectivityService);
            NetworkInfo networkInfo = connectivityManager.ActiveNetworkInfo;
            bool isOnline = networkInfo.IsConnected;
            var checkisonline = isOnline.ToString();
            _IsOnlineText = FindViewById<TextView>(Resource.Id.TVisOnLine);
            if (checkisonline == "True")
            {
                _IsOnlineText.Text = "מחובר לרשת סלולארית";
            }
            else if (checkisonline == "False")
            {
                _IsOnlineText.Text = "לא מחובר לרשת סלולארית";
            }

        }
        private void GetMobileNumber()
        {
            TelephonyManager tm = (TelephonyManager)GetSystemService(Context.TelephonyService);
            string Mobile = tm.Line1Number.ToString();
            _Mobile = FindViewById<EditText>(Resource.Id.MobileNumber);
            _Mobile.Text = Mobile;
        }
        
        
    }
}


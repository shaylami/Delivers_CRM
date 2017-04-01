using Android.App;
using Android.Widget;
using Android.OS;
using Android.Net;
using Android.Telephony;
using Android.Content;
using System;
using System.Threading.Tasks;

namespace Deliver_CRM_Droid
{
    [Activity(Label = "מערכת נוכחות", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : Activity
    {
        bool isAlive;
        string date,conType;
        DigitalClock _Time;
        TextView _IsOnlineText, _Mobile, _date,_internet;
        Button _login;
        private ProgressBar spinner;
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            // Set our view from the "main" layout resource
            SetContentView (Resource.Layout.Main);

            _Time = FindViewById<DigitalClock>(Resource.Id.Clock);
            spinner = (ProgressBar)FindViewById(Resource.Id.progressBarLogin);
            spinner.Visibility = Android.Views.ViewStates.Invisible;
            _login = (Button)FindViewById(Resource.Id.LogIn);
            _login.Click += (o, e) => { GetLogin(); };
            // load your calss
            Load();
        }
        private void Load()
        {
            spinner = (ProgressBar)FindViewById(Resource.Id.progressBarLogin);
            spinner.Visibility = Android.Views.ViewStates.Visible;
            GetDateTime();
            GetMobileNumber();
            CheckNetworkState();
            CheckNetworkConnection();
            
        }
        public void IsAlive()
        {
            try
            {
                string alive="",_isAlive = "";
                WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
                _isAlive = Convert.ToString(isAlive);
                alive = ws.SetConnectionIsAlive(_date.Text, _Time.Text, _Mobile.Text, conType,_isAlive);
            }
            catch(Exception ex)
            {
                string err="";
                err = ex.ToString();
            }
        }
        public void CheckNetworkConnection()
        {
            try
            {
                
                _internet = FindViewById<TextView>(Resource.Id.Internet);
                var connectivityManager = (ConnectivityManager)Application.Context.GetSystemService(Context.ConnectivityService);
                var activeNetworkInfo = connectivityManager.ActiveNetworkInfo;
                if (activeNetworkInfo != null && activeNetworkInfo.IsConnectedOrConnecting)
                {
                    isAlive = true;
                    conType = activeNetworkInfo.TypeName+" : "+activeNetworkInfo.ExtraInfo;
                    _internet.Text = conType;
                }
                else
                {
                    isAlive = false;
                    conType = activeNetworkInfo.TypeName;
                    _internet.Text = conType;
                }
            }
            catch(Exception ex)
            {
                string err = ex.ToString();
            }
        }
        private void GetDateTime()
        {
            try
            {
                date = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy"));
                _date = FindViewById<TextView>(Resource.Id.TodayDate);
                _date.Text = date;
            }
            catch (Exception ex)
            {
                ex.ToString();
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
            spinner.Visibility = Android.Views.ViewStates.Gone;
        }
        private void GetMobileNumber()
        {
            TelephonyManager tm = (TelephonyManager)GetSystemService(Android.Content.Context.TelephonyService);
            string Mobile = tm.Line1Number.ToString();
            string replacenumbers = Mobile;
            replacenumbers = Mobile.Replace("+972", "0");
            string dash = "-";
            Mobile = replacenumbers.Insert(3, dash);
            _Mobile = FindViewById<TextView>(Resource.Id.MobileNumber);
            _Mobile.Text = Mobile;
        }
        private void OpenHWPage()
        {
            var intent = new Intent(this, typeof(WH));
            StartActivity(intent);
            Finish();
        }       
        public void GetLogin()
        {
            CheckNetworkConnection();
            spinner = (ProgressBar)FindViewById(Resource.Id.progressBarLogin);
            spinner.Visibility = Android.Views.ViewStates.Visible;
            string a = "";
            WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
            a = ws.GetDeliverMobile(_Mobile.Text);
            if (a == "-1")
            {
                Toast.MakeText(this, "מנוי לא קיים במערכת....", ToastLength.Short).Show();
            }
            else
            {
                IsAlive();
                OpenHWPage();
            }

        }
    }
}


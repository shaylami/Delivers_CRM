using Android.App;
using Android.Widget;
using Android.OS;
using Android.Telephony;
using Android.Net;

namespace DeliverCrm_App_Droid
{
    [Activity(Label = "DeliverCrm_App_Droid", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : Activity
    {
        TextView _IsOnlineText, _Mobile;
        EditText _ServiceURL;
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            // Set our view from the "main" layout resource
            SetContentView (Resource.Layout.Main);


            ServiceURL();
            GetMobileNumber();
            CheckNetworkState();
        }

        private void ServiceURL()
        {
            _ServiceURL = FindViewById<EditText>(Resource.Id.ServiceURL);
            _ServiceURL.Text = "soft.solveit.co.il:8081/delivercrmwebservice.asmx";
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
            TelephonyManager tm = (TelephonyManager)GetSystemService(Android.Content.Context.TelephonyService);
            string Mobile = tm.Line1Number.ToString();
            string replacenumbers = Mobile;
            replacenumbers = Mobile.Replace("+972", "0");
            string dash = "-";
            Mobile = replacenumbers.Insert(3, dash);
            _Mobile = FindViewById<TextView>(Resource.Id.MobileNumber);
            _Mobile.Text = Mobile;
        }

    }
}


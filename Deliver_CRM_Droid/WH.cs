using System;
using System.Text;

using Android.App;
using Android.OS;
using Android.Widget;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Support.V4.App;
using Plugin.Geolocator;
using Android.Telephony;
using System.Xml.Linq;
using System.Linq;

namespace Deliver_CRM_Droid
{
    [Activity(Label = "דווח נוכחות")]
    public class WH : Activity, IOnMapReadyCallback
    {
        private GoogleMap mMap;
        string lat = "" ;
        string lng = "" ;
        string Mobile,date;
        TextView _date, _time, _mobile,_lat,_lng,_reportIn,_reportOut;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.WH);
            // Create your application here
            GetDateTime();
            GetMobileNumber();       
            GetCurrentLocation();
            CheckReportingTodayDate();
        }
        private void CheckReportingTodayDate()
        {
            string b = "", a = "";
            _reportIn = FindViewById<TextView>(Resource.Id.ReportIn);
            _reportOut = FindViewById<TextView>(Resource.Id.ReportOut);
            WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
            b = ws.GetReportInWH(_mobile.Text, _date.Text);
            a = ws.GetReportOutWH(_mobile.Text, _date.Text);
            if (string.IsNullOrEmpty(b))
            {
                _reportIn.Text = "כניסה : "+"לא דווח";
            }
            else
            {
                _reportIn.Text = "כניסה : "+b;
            }
            if(string.IsNullOrEmpty(a))
            {
                _reportOut.Text = "יציאה : "+"לא דווח";
            }
            else
            {
                _reportOut.Text = "יציאה : "+a;
            }
        }

        private void SetWhReport()
        { }
        private void CheckReportingTodayDate2()
        {
            try
            {
                StringBuilder a = new StringBuilder();
                WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
                a.Append(ws.GetReportInWH(_mobile.Text, _date.Text));
                //if (a == "-1")
                //{
                //    Toast.MakeText(this, "לא קיים דווח.....", ToastLength.Short).Show();
                //}
                //else
                //{

                //}
                string response = a.ToString();

            }
            catch(Exception ex)
            {
                string err;
                err = ex.ToString();
            }
        }
        private void GetMobileNumber()
        {
            TelephonyManager tm = (TelephonyManager)GetSystemService(Android.Content.Context.TelephonyService);
            Mobile = tm.Line1Number.ToString();
            string replacenumbers = Mobile;
            replacenumbers = Mobile.Replace("+972", "0");
            string dash = "-";
            Mobile = replacenumbers.Insert(3, dash);
            _mobile = FindViewById<TextView>(Resource.Id.Mobile);
            _mobile.Text = Mobile;
        }
        private void GetDateTime()
        {
            try
            {
                 date = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy"));
                _date = FindViewById<TextView>(Resource.Id.TodayDate);
                _date.Text = date;
                string time = Convert.ToString(DateTime.Now.ToString("HH:MM"));
                _time = FindViewById<TextView>(Resource.Id.CurrentTime);
                _time.Text = time;
            }
            catch(Exception ex)
            {
                ex.ToString();
            }
        }
        private async void GetCurrentLocation()
        {
            var locator = CrossGeolocator.Current;
            locator.DesiredAccuracy = 100; //100 is new default
            var position = await locator.GetPositionAsync(timeoutMilliseconds: 10000);
            lat = position.Longitude.ToString();
            lng = position.Latitude.ToString();
            initializeMap();
        }
        public void initializeMap()
        {
            if (mMap == null)
            {
                FragmentManager.FindFragmentById<MapFragment>(Resource.Id.map).GetMapAsync(this);
            }
        }
        public void OnMapReady(GoogleMap googleMap)
        {
            try
            {
                double laat, lnng;
                laat =  Convert.ToDouble(lat);
                lnng = Convert.ToDouble(lng);
                mMap = googleMap;
                LatLng latlng = new LatLng(laat, lnng);
                //LatLng latlng = new LatLng(40.746608, -73.970755);
                MarkerOptions marker = new MarkerOptions()
                    .SetPosition(latlng)
                    .SetTitle("המיקום שלך");

                    mMap.AddMarker(marker);
                
            }
            catch(Exception ex)
            {
                string err;
                err = ex.ToString();
            }
            
        }

    }
}
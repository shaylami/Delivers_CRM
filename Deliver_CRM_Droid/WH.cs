using System;
using Android.App;
using Android.OS;
using Android.Widget;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Support.V4.App;
using Plugin.Geolocator;
using Android.Telephony;
using Android.Content;


namespace Deliver_CRM_Droid
{
    [Activity(Label = "דווח נוכחות")]
    public class WH : Activity, IOnMapReadyCallback
    {
        private GoogleMap mMap;
        string lat = "", lat2 = "", DestenationLat = "";
        string lng = "", lng2 = "", DestenationLng = "";
        string Mobile, date;
        DigitalClock _time;
        TextView _date, _mobile, _lat, _lng, _reportIn, _reportOut;
        Button _btnReportIn, _btnReportOut, _btnReportSick, _btnReportDayOff;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.WH);
            // Create your application here
            GetDateTime();
            GetMobileNumber();
            GetCurrentLocation();
            CheckReportingTodayDate();
            _time = (DigitalClock)FindViewById(Resource.Id.CurrentTime);
            _btnReportIn = (Button)FindViewById(Resource.Id.btnReportIn);
            _btnReportIn.Click += (o, e) => { SetReportIn(); };

            _reportOut = (Button)FindViewById(Resource.Id.btnReportOut);
            _reportOut.Click += (o, e) => { SetReportOut(); };

            _btnReportSick = (Button)FindViewById(Resource.Id.btnReportSick);
            _btnReportSick.Click += (o, e) => { ReportSickDay(); };

            _btnReportDayOff = (Button)FindViewById(Resource.Id.btnDayOff);
            _btnReportDayOff.Click += (o, e) => { ReportDayOff(); };
        }

        private void ReportSickDay()
        {
            var intent = new Intent(this, typeof(ReportSick));
            StartActivity(intent);
            Finish();
        }
        private void ReportDayOff()
        {
            var intent = new Intent(this, typeof(ReportDayOff));
            StartActivity(intent);
            Finish();
        }
        /// <summary>
        /// Get from web service report in & reportout for current today date
        /// </summary>
        public void CheckReportingTodayDate()
        {
            string In = "", Out = "",AbsReport="";
            _reportIn = FindViewById<TextView>(Resource.Id.ReportIn);
            _reportOut = FindViewById<TextView>(Resource.Id.ReportOut);
            _btnReportIn = (Button)FindViewById(Resource.Id.btnReportIn);
            _btnReportOut = (Button)FindViewById(Resource.Id.btnReportOut);
            WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
            In = ws.GetReportInWH(_mobile.Text, _date.Text);
            Out = ws.GetReportOutWH(_mobile.Text, _date.Text,AbsReport);
            if (string.IsNullOrEmpty(In) || (In == "-1"))
            {
                _reportIn.Text = "כניסה : "+"לא דווח";               
            }
            else
            {
                if (In != "מחלה")
                {
                    _reportIn.Text = "כניסה : " + In;
                    _reportIn.SetBackgroundColor(Android.Graphics.Color.CadetBlue);
                    _btnReportIn.Visibility = Android.Views.ViewStates.Invisible;
                }
                else
                {
                    _reportIn.Text = "מחלה";
                }
            }
            if(string.IsNullOrEmpty(Out) || (Out == "-1"))
            {
                _reportOut.Text = "יציאה : "+"לא דווח";
            }
            else
            {
                if (Out != "מחלה")
                {
                    _reportOut.Text = "יציאה : " + Out;
                    _reportOut.SetBackgroundColor(Android.Graphics.Color.CadetBlue);
                    _btnReportOut.Visibility = Android.Views.ViewStates.Invisible;
                }
                else
                {
                    _reportOut.Text = "מחלה";
                }
            }

        }
        /// <summary>
        /// when vutten reportin clicked data will send to web service for insert to the DB
        /// </summary>
        private void SetReportIn()
        {
            
            try
            {
                string value, _reportAbsence = "רגיל";
                WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
                value = ws.SetReportInWH(_mobile.Text, _date.Text, _time.Text, _reportAbsence, lng, lat);
                Toast.MakeText(this, "data send to server", ToastLength.Short).Show();
                CheckReportingTodayDate();
            }
            catch(Exception ex)
            {
                string okexerr = ex.ToString();
            }

        }
        /// <summary>
        /// when vutten reportout clicked data will send to web service for insert to the DB
        /// </summary>
        private void SetReportOut()
        {
            try
            {
                string value,_reportAbsence = "רגיל";
                WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
                value = ws.SetReportOutWH(_mobile.Text, _date.Text, _time.Text, _reportAbsence, lng, lat);
                Toast.MakeText(this, "data send to server", ToastLength.Short).Show();
                CheckReportingTodayDate();
            }
            catch(Exception ex)
            {
                string exerr = ex.ToString();
            }
        }
        /// <summary>
        /// Get mobile number from TelephonyManager and set in to text view
        /// </summary>
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
        /// <summary>
        /// Get current today date & time to text view
        /// </summary>
        private void GetDateTime()
        {
            try
            {
                 date = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy"));
                _date = FindViewById<TextView>(Resource.Id.TodayDate);
                _date.Text = date;
            }
            catch(Exception ex)
            {
                ex.ToString();
            }
        }
        /// <summary>
        /// return curreent location based on lat lng from gps device
        /// </summary>
        private async void GetCurrentLocation()
        {
            try
            {
                if(lat =="" && lng == "")
                {
                    var locator = CrossGeolocator.Current;
                    locator.DesiredAccuracy = 100; //100 is new default
                    var position = await locator.GetPositionAsync(timeoutMilliseconds: 10000);
                    lat = position.Longitude.ToString();
                    lng = position.Latitude.ToString();
                    initializeMap();
                }
                else
                {
                    var locator = CrossGeolocator.Current;
                    locator.DesiredAccuracy = 100; //100 is new default
                    var position = await locator.GetPositionAsync(timeoutMilliseconds: 10000);
                    lat2 = position.Longitude.ToString();
                    lng2 = position.Latitude.ToString();
                    if(lat != lat2 || lng != lng2)
                    {
                        lat = lat2;
                        lng = lng2;
                        initializeMap();
                    }
                }

            }
            catch(Exception ex)
            {
                ex.ToString();
            }
        }
        /// <summary>
        /// init Map on layot
        /// </summary>
        public void initializeMap()
        {
            if (mMap == null)
            {
                FragmentManager.FindFragmentById<MapFragment>(Resource.Id.map).GetMapAsync(this);
            }
        }
        /// <summary>
        /// estblise map with location and show on map
        /// </summary>
        /// <param name="googleMap"></param>
        public void OnMapReady(GoogleMap googleMap)
        {
            try
            {
                double laat, lnng;
                laat =  Convert.ToDouble(lat);
                lnng = Convert.ToDouble(lng);
                mMap = googleMap;
                LatLng latlng = new LatLng(lnng, laat);
                CameraUpdate camera = CameraUpdateFactory.NewLatLngZoom(latlng, 16);
                mMap.MoveCamera(camera);
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
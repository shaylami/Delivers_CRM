using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.Gms.Maps;
using Android.Gms.Maps.Model;
using Android.Support.V4.App;
using Android.Locations;
using Android.Util;
using Plugin.Geolocator;
using System.Globalization;
using Android.Icu.Text;

namespace Deliver_CRM_Droid
{
    [Activity(Label = "דווח נוכחות")]
    public class WH : Activity, IOnMapReadyCallback
    {
        private GoogleMap mMap;
        string lat = "40.746608";
        string lng = "-73.970755";
        TextView _date,_time;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.WH);
            // Create your application here
            GetDateTime();
            GetCurrentLocation();
        }
        private void GetDateTime()
        {
            try
            {
                string date = Convert.ToString(DateTime.Now.ToString("dd-MM-yyyy"));
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
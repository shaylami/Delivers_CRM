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
using Android.Locations;
using Plugin.Geolocator;

namespace DeliverCrm_App_Droid
{
    [Activity(Label = "WH")]
    public class WH : Activity
    {
        LocationManager locMgr;
        Location location;
        string latitude = "", longitude = "", accuracy = "";
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.WH);
            // Create your application here
            GetCurrentlocation();
            ShowGoogleMap();

        }

        private async void GetCurrentlocation()
        {
            var locator = CrossGeolocator.Current;
            locator.DesiredAccuracy = 100; //100 is new default
            var position = await locator.GetPositionAsync(timeoutMilliseconds: 10000);
            longitude =  position.Longitude.ToString();
            latitude =   position.Latitude.ToString();
        }
        private void ShowGoogleMap()
        {

        }
    }
}
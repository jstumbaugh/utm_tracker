$(document).ready(function() {
  var params = {};

  // Grab the utm parameters from the url
  window.location.search
    .replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str,key,value) {
      params[key] = value;
    }
  );

  // Only register the page view if the required utm params are present
  if (params["utm_source"] && params["utm_campaign"] && params["utm_medium"]) {
    // Set the time the page was viewed at to now in UTC
    params["viewed_at"] = new Date().toISOString();

    params["full_url"] = window.location.href;
    params["url"]      = window.location.origin + window.location.pathname;
    params["referrer"] = document.referrer;

    // Get IP Address and associated information
    $.getJSON('//freegeoip.net/json/?callback=?', function(json_data) {
      var ip_address_response_fields = [
        "city", "country_code", "country_name", "ip", "latitude", "longitude",
        "metro_code", "region_code", "region_name", "time_zone", "zip_code"
      ];

      $.each(ip_address_response_fields, function(i, field) {
        params[field] = json_data[field];
      });

      // Send data to the tracker
      $.post(
        "http://localhost:3000/page_views", params
      ).done(function() {
        console.log("Successfully submitted the page view to the tracker.");
      }).fail(function() {
        console.log("An error occured sending the page view to the tracker.");
      });

      console.log("Parameters:");
      console.log(params);
    });

  } else {
    console.log("No UTM paramters set.");
  }
});

// Note that using Google Gears requires loading the Javascript
// at http://code.google.com/apis/gears/gears_init.js

var initialLocation;
var siberia = new google.maps.LatLng(60, 105);
var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
var browserSupportFlag =  new Boolean();
var infowindow = new google.maps.InfoWindow({width:100});

function initialize() {
  var myOptions = {
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var mapp = map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

  var elevator = new google.maps.ElevationService();
  
  google.maps.event.addListener(map, 'click', getElevation);
  
  google.maps.event.addListenerOnce(map, 'tilesloaded', VR.switch_headers);
  
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      contentString = "<br/>Hey, looks like you're canning here.  Neat!"
      map.setCenter(initialLocation);
      //infowindow.setContent(contentString)
      //infowindow.setPosition(initialLocation)
      //infowindow.open(map)
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  // Try Google Gears Geolocation
  } else if (google.gears) {
    browserSupportFlag = true;
    var geo = google.gears.factory.create('beta.geolocation');
    geo.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeoLocation(browserSupportFlag);
    });
  // Browser doesn't support Geolocation
  } else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }
  
  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      alert("Geolocation service failed.");
      initialLocation = newyork;
    } else {
      alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = siberia;
    }
    map.setCenter(initialLocation);
  }
  
  function getElevation(event) {

    var locations = [];
    
    
    // Retrieve the clicked location and push it on the array
    var clickedLocation = event.latLng;
    locations.push(clickedLocation);

    // Create a LocationElevationRequest object using the array's one value
    var positionalRequest = {
      'locations': locations
    }

    // Initiate the location request
    elevator.getElevationForLocations(positionalRequest, function(results, status) {
      if (status == google.maps.ElevationStatus.OK) {

        // Retrieve the first result
        if (results[0]) {
          elevation = results[0];
          // Open an info window indicating the elevation at the clicked position
          infowindow.setContent("Looks like you're canning at " + Math.round(results[0].elevation) + " meters. Neat!");
          infowindow.setPosition(clickedLocation);
          infowindow.open(map);
          VR.calculate_pressure(results[0].elevation * 3.2808399) ////convert meters to feet for elevation
        } else {
          alert("No results found");
        }
      } else {
        alert("Elevation service failed due to: " + status);
      }
    });
  }
}


// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var VR = {};

VR.hide_elevations = function() {
  $(function() {
    $('#click_around').hide();
    $('#elevation_2000').hide();
    $('#elevation_4000').hide();
    $('#elevation_6000').hide();
    $('#elevation_8000').hide();
    $('#elevation_below_1000').hide();
    $('#elevation_above_1000').hide();
  });
};

VR.switch_headers = function() {
  $('#click_around').show();
  $('#loading_gif').hide();
};

VR.calculate_pressure = function(elevation) {
  VR.hide_elevations();
  if (elevation > 0 && elevation < 2000 ) {
    $('#elevation_2000').show();
    if (elevation < 1000){
      $('#elevation_below_1000').show();
    }
    else if (elevation > 1000){
      $('#elevation_above_1000').show();
    }
  }
  else if (elevation > 2000 && elevation < 4000) {
    $('#elevation_4000').show();
    $('#elevation_above_1000').show();
  }
  else if (elevation > 4000 && elevation < 6000) {
    $('#elevation_6000').show();
    $('#elevation_above_1000').show();
  } 
  else if (elevation > 6000 && elevation < 8000) {
    $('#elevation_6000').show();
    $('#elevation_above_1000').show();
  }
};
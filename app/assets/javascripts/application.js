// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function initialize() {
  var locations = [
  ['San Diego', 32, -117, 4]];

  window.map = new google.maps.Map(document.getElementById('map'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var infowindow = new google.maps.InfoWindow();

  var bounds = new google.maps.LatLngBounds();

  for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      map: map
    });

    bounds.extend(marker.position);

    google.maps.event.addListener(marker, 'click', (function (marker, i) {
      return function () {
        infowindow.setContent(locations[i][0]);
        infowindow.open(map, marker);
      }
    })(marker, i));
  }

  map.fitBounds(bounds);

  var listener = google.maps.event.addListener(map, "idle", function () {
    map.setZoom(7);
    google.maps.event.removeListener(listener);
  });
}

$(document).ready(function(){
  $.ajax({
    url: '/',
    method: "GET",
    dataType: "JSON"
    })
    .done(function(response){
      var tweetResponse = response;

      function addMarker(lat, long) {
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(lat, long),
            map: map
        });
      }

      tweetResponse.forEach(function(element, elementIndex) {
        if(tweetResponse[elementIndex].place !== null){
          var latitude = tweetResponse[elementIndex].place.bounding_box.coordinates[0][1][0];
          var longitude = tweetResponse[elementIndex].place.bounding_box.coordinates[0][1][1];
          addMarker(longitude,latitude);
        } else {
          console.log('no coordinates for' + element)
        }
      });
    })
})




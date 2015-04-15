$(document).ready(function () {
  map = new JourneyMap(51.5072, 0.1275, 10)
  map.drawMap('#map-canvas')
  google.maps.event.addListener(map.map, 'dblclick', function(event) {
    map.addMarker("New Waypoint",event.latLng, true);
  });
});

function JourneyMap(lat, lng, zoom_level) {
  this.center = new google.maps.LatLng(lat, lng);
  this.zoom_level = zoom_level;
}

JourneyMap.prototype.fitView = function(latLngList) {
  var bounds = new google.maps.LatLngBounds();
  var LtLgLen = latLngList.length
  for (var i = 0; i < LtLgLen; i++) {
    bounds.extend(latLngList[i]);
  }
  map.map.fitBounds(bounds);
}

JourneyMap.prototype.drawMap = function(jquerySelector) {
  var map_options = {
    center: this.center,
    zoom: this.zoom_level
  }
  var map_canvas = $(jquerySelector)[0]
  this.map = new google.maps.Map(map_canvas, map_options);
  this.LatLngList = [];
}

JourneyMap.prototype.addMarker = function(title, latLng, sync) {
  var marker = new google.maps.Marker({
    position: latLng,
    map: this.map,
    title: title
  });
  if (sync) {
    syncMarker(latLng)
  }
}
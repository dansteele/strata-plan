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
  this.directionsSetup(this.map);
  google.maps.event.addListener(map.map, 'dblclick', function(event) {
    map.addMarker("New Waypoint",event.latLng, true);
  });
}

JourneyMap.prototype.addMarker = function(title, latLng, sync) {
  var marker = new google.maps.Marker({
    position: latLng,
    map: this.map,
    title: title
  });
  if (sync) {
    this.syncMarker(latLng)
  }
}

JourneyMap.prototype.directionsSetup = function(targetMap) {
  this.directionsService = new google.maps.DirectionsService();
  this.directionsDisplay = new google.maps.DirectionsRenderer();
  this.directionsDisplay.setMap(targetMap);
  if ($('.waypoint').length > 0) this.calcRoute(); 
}

JourneyMap.prototype.calcRoute = function(start, end) {
  var _this = this;
  var posList = $('.waypoint').map(function() {
    return new google.maps.LatLng($(this).data().longitude, $(this).data().latitude)
  });
  var start = posList.first()[0];
  var end = posList.last()[0];
  posList = posList.slice(1,-1)
  this.fireRouteRequest(this.createRequest(start, end, posList));
}

JourneyMap.prototype.makeWaypoints = function(posList) {
  var wpList = _.map(posList, function(pos) {
    return {
      location: pos,
      stopover: false
    }
  })
  return wpList;
}

JourneyMap.prototype.createRequest = function(start, end, posList) {
  _this = this;
  return {
    origin: start,
    destination: end,
    waypoints: _this.makeWaypoints(posList),
    travelMode: google.maps.TravelMode.DRIVING
  }
}

JourneyMap.prototype.updateRoute = function(wpListHtml) {
  var waypoints = $(wpListHtml, '.waypoint')
  var start = new google.maps.LatLng(waypoints.first().data().longitude, waypoints.first().data().latitude)
  var end = new google.maps.LatLng(waypoints.last().data().longitude, waypoints.last().data().latitude)
  waypoints = waypoints.slice(1, -1)
  var posList = waypoints.not('#text').map(function() {
    var latlng = $(this).first().data()
    return new google.maps.LatLng(latlng.longitude, latlng.latitude)
  });
  this.fireRouteRequest(this.createRequest(start, end, posList));
}

JourneyMap.prototype.fireRouteRequest = function(request) {
  this.directionsService.route(request, function(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      _this.directionsDisplay.setDirections(result);
    }
  });
}
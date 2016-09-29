var map;		//The Map
var rect;		//The Rectangle
var myLat = 34.142750;
var myLng = -118.141953;
var tsLatLng = new google.maps.LatLng({lat: myLat, lng: myLng});  //Times Square LatLng
var nLat, wLng; //Latitude and Longitude variables
var ctrlDown = false;  //Ctrl key state
var canDraw = false;   //Can we draw the rectangle? Set true if mouse button pressed.
var beachFlag = null;

function drawBeachFlag(theLat, theLng) {
  var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
  beachFlag = new google.maps.Marker({
    position: {lat: myLat, lng: myLng},
    map: map,
    icon: image
  });
}

function recenter() {
  beachFlag.setMap(null);
  drawBeachFlag(theLat, theLng);
  var hash = {};
  hash['lat'] = theLat;
  hash['lng'] = theLng + 0.05;
  addMarker(hash);
}

function addMarker(hash) {
  alert('added')
  var marker = new google.maps.Marker({
    position: {lat: hash['lat'], lng: hash['lng']},
    map: map
  });
  markers.push(marker);
}

function initialize() {

  var mapOptions = {
	zoom: 15,
	draggableCursor: null,
	center: tsLatLng
  };
  map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions ); //Map constructor
  drawBeachFlag(myLat, myLng);

  rect = new google.maps.Rectangle({											 //Rectangle constructor
	  bounds:  {north:0, south:0, east:0, west:0},
	  strokeColor: '#000000',
	  strokeOpacity: 0.8,
	  strokeWeight: 2,
	  fillColor: '#000000',
	  fillOpacity: 0.1
  });
  map.addListener('click', function(e) {
    if (ctrlDown) {
      theLat = e.latLng.lat();
      theLng = e.latlng.lng();
      //alert(theLat + "," + theLng);
      recenter(theLat, theLng);
    }
  });

  /*
  map.addListener('mousedown', function(e){   //Event listener for the map's mouse down event
	if (ctrlDown){							  //We run the code if the Ctrl key is down
		canDraw = true;						  //We started to draw
		nLat = e.latLng.lat();				  //Get the initial latitude from the MouseEvent and set it to nLat variable
		wLng = e.latLng.lng();				  //Get the initial longitude from the MouseEvent and set it to wLng variable
		rect.setBounds({north: nLat, south:nLat, east: wLng, west: wLng});  //Set the initial bounds. Now the SW anf NE coordinates are the same.
		map.setOptions({draggable : false});  //We do not allow dragging the map while we draw the rectangle
		rect.setMap(map);					  //Set the rectangle to the map
	};
  });
  map.addListener('mousemove', function(e){	  //Event listener for the map's mouse move event
	if (ctrlDown && canDraw){				  //We run the code if the Ctrl key is down and started drawing
		var sLat = e.latLng.lat();			  //Get the latitude and longitude from the MouseEvent
		var eLng = e.latLng.lng();			  //
		if (eLng > wLng) {					  //Set the new bounds for the rectangle the North-West corner remains the initial values.
		  rect.setBounds({north: nLat, south:sLat, east: eLng, west: wLng}); //Set the bounds if we move the cursor from North-West to South-East
		} else{
		  rect.setBounds({north: nLat, south:sLat, east: wLng, west: eLng}); //Set the bounds if we move the cursor from South-East to North-West
		};
	};
  });
  rect.addListener('mouseup', function(){	  //Event listener for the !rectangle's mouse move event (there is no mouseup for the map)
	  map.setOptions({draggable : true});       //We have finished drawing so the map can be draggable again.
	  map.setOptions({draggableCursor : null}); //Set the cursor to 'default hand'
	  if (ctrlDown && canDraw){				  //If we have have finished drawing
		  canDraw = false;					  //Set the canDraw variable to false
		  map.fitBounds(rect.getBounds());	  //Sets the maps's viewport to contain the given bounds (the rectangle's bounds).
		  setTimeout(function(){ 				  //Removethe rectangle from the map after 500 milliseconds
		    rect.setMap(null); }, 500
		  );
	  }
  });
  google.maps.event.addDomListener(document, 'keydown', function (e) {  //DOM listener for keydown
    var code = (e.keyCode ? e.keyCode : e.which);
    if (code === 17) {													//If we push the Ctrl key
		map.setOptions({draggableCursor : 'crosshair'});				//We set the cursor to +
		ctrlDown = true;												//Set ctrlDown variable to true
    }
  });
  google.maps.event.addDomListener(document, 'keyup', function (e) {	//DOM listener for keyup
    var code = (e.keyCode ? e.keyCode : e.which);
    if (code === 17) {													//If we release the Ctrl key
		ctrlDown = false;												//Set the ctrlDown and canDraw variables to false
		canDraw = false;												//(We do not allow drawing)
		rect.setMap(null);												//remove the rectangle from the map
		map.setOptions({draggable : true});								//Set the cursor and the draggable option to true again
		map.setOptions({draggableCursor : null});
    }
  });
  */
};

/*
function addMarker(location) {
var marker = new google.maps.Marker({
  position: location,
  map: map
});
markers.push(marker);
}
*/

// Sets the map on all markers in the array.
function setMapOnAll(map) {
for (var i = 0; i < markers.length; i++) {
  markers[i].setMap(map);
}
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
clearMarkers();
markers = [];
}

google.maps.event.addDomListener(window, 'load', initialize);

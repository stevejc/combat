// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

jQuery(function($) {
	$("#location h3").append('<div id="map"></div>')
	$(".static_map").remove();
	
	var map;
	var center;
	
	function initialize() {
	  var mapOptions = {
	    center: new google.maps.LatLng(addressLat, addressLong),
	    zoom: 8,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  };
	  map = new google.maps.Map(document.getElementById("map"),
	      mapOptions);
	  var marker = new google.maps.Marker({
	      position: new google.maps.LatLng(addressLat, addressLong),
	      map: map,
	  });
	}
	
	initialize();
	google.maps.event.addDomListener(map, 'idle', function(){
		center = map.getCenter();
	});
	
	$(window).resize(function(){
		map.setCenter(center);
	});
	
})

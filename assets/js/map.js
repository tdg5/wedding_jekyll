(function() {
  function initialize() {
    var latLng = { lat: 42.367896, lng: -71.075234 };
    var mapOptions = {
      center: latLng,
      zoom: 14
    };
    var msg = '<a href="http://www.hotelmarlowe.com/" target="_blank">Hotel Marlowe</a><br>25 Edwin H. Land Blvd.<br>Cambridge, MA 02141<br>(617) 772-5838';
    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        title: msg
    });
    var infowindow = new google.maps.InfoWindow({ content: msg });
    google.maps.event.addListener(map, 'tilesloaded', function() {
      infowindow.open(map, marker);
    });
  }
  google.maps.event.addDomListener(window, 'load', initialize);
})();

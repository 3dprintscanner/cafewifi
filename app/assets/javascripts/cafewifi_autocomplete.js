$(document).ready(function(){
  // var geocoder;
  geocoder = new google.maps.Geocoder();
  
  console.log("something");
});


function codeAddress() {
    // var geocoder
    // geocoder = new google.maps.Geocoder();
    console.log(handler);
    // handler = Gmaps.build('Google');
    var address = document.getElementById('venue_address').value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        console.log(results);
        handler.getMap().setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: handler.getMap(),
            position: results[0].geometry.location
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  function autoComplete(){
    var query = document.getElementById('venue_address').value;
    geocoder.geocode({'address': query}, function(results, status){
      if (status == google.maps.GeocoderStatus.OK){
        choices = [];
        for (var i = results.length; i >= 0; i--) {
          choices.push(results[i].formatted_address);
        };
        // console.log(choices);
        // trial = ["one","two","three"];
        // console.log(choices);
        // completebox = document.getElementById("location-input");
        completebox = $('#venue_address');
        // completebox.autocomplete("enable");
        completebox.autocomplete({source: choices});
        // console.log('choices');      
        // completebox.autocomplete({source: trial});
      }
    })

  }
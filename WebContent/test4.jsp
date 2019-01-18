<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Waypoints in Directions</title>
    <style>
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
        float: left;
        width: 70%;
        height: 100%;
      }
      #right-panel {
        margin: 20px;
        border-width: 2px;
        width: 20%;
        height: 400px;
        float: left;
        text-align: left;
        padding-top: 0; 
      }
       #chiTiet {
         margin-top: 10px; 
         background-color: #FFEE77; 
         padding: 10px; 
         overflow: scroll; 
         height: 174px; 
       } 
    </style>
  </head>
  <body>
    <div id="map"></div>
    <div id="right-panel">
    <div>
    <b>Start:</b>
    <input id="noiDi" class="controls" type="text"
				>
    </input>
    </input>
    <br>

    <br>
    <b>End:</b>
    <input id="noiDen" class="controls" type="text"
				placeholder="Nhập điểm đến">
     </input>
    
    </input>
    <br>
      <input type="submit" id="submit">
    </div>
    <div id="chiTiet"></div>
    </div>
    <script>
      function initMap() {
    	  
     	var input = document.getElementById('noiDi');
// 		var input2 = document.getElementById('noiDen');
  		var autocomplete = new google.maps.places.Autocomplete(input);
//  		var autocomplete = new google.maps.places.Autocomplete(input2);  
    	  
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: {lat: 41.85, lng: -87.65}
        });
        directionsDisplay.setMap(map);

        document.getElementById('submit').addEventListener('click', function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        });
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
//         var waypts = [];
//         var checkboxArray = document.getElementById('waypoints');
//         for (var i = 0; i < checkboxArray.length; i++) {
//           if (checkboxArray.options[i].selected) {
//             waypts.push({
//               location: checkboxArray[i].value,
//               stopover: true
//             });
//           }
//         }

        directionsService.route({
          origin: document.getElementById('noiDi').value,
          destination: document.getElementById('noiDen').value,
//           waypoints: waypts,
          optimizeWaypoints: true,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
            var route = response.routes[0];
            var summaryPanel = document.getElementById('chiTiet');
            summaryPanel.innerHTML = '';
            // For each route, display summary information.
            for (var i = 0; i < route.legs.length; i++) {
              var routeSegment = i + 1;
              summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                  '</b><br>';
              summaryPanel.innerHTML += '<b>Hành trình: '
					 + '</b><br>';
			summaryPanel.innerHTML += route.legs[i].start_address
					+ '<b> Đến </b>';
			summaryPanel.innerHTML += route.legs[i].end_address
					+ '<br>' + '<b>Khoảng cách: ' ;
			summaryPanel.innerHTML += route.legs[i].distance.text
					+ '<br>' + '<b>Thành tiền: </b>';
			summaryPanel.innerHTML += (((route.legs[i].distance.value)*0.001).toFixed(1))*7000
					+ '<b> VNĐ' ;	
            }
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC58Pa1xnAA7rcKkgAcwX28G0-gyWLpryU&callback=initMap">
    </script>
  </body>
</html>
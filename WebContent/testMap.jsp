<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Waypoints in Directions</title>
<style>
#right-panel {
	font-family: 'Roboto', 'sans-serif';
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

#directions-panel {
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
			<b>Nơi đi:</b> <input id="start" class="controls" type="text"
				placeholder="Nhập điểm đi"> 
				</input> 
				
				<br> <b>Nơi đến:</b> 
				
				<input
				id="end" class="controls" class="controls" type="text"
				placeholder="Nhập điểm đến">
				</input>

<!-- 			 <br> <input type="submit" id="submit"> -->
		</div>
		<div id="directions-panel"></div>
	</div>
	<script>
		function initMap() {

			var input = document.getElementById('start');
			var input2 = document.getElementById('end');
// 			var autocomplete = new google.maps.places.Autocomplete(input);
// 			var autocomplete = new google.maps.places.Autocomplete(input2);

			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay = new google.maps.DirectionsRenderer;
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 6,
				center : {
					lat : 41.85,
					lng : -87.65
				}
			});
			directionsDisplay.setMap(map);

// 			document.getElementById('submit').addEventListener(
// 					'click',
// 					function() {
// 						calculateAndDisplayRoute(directionsService,
// 								directionsDisplay);
// 					});


			var onChangeHandler = function() {
		          calculateAndDisplayRoute(directionsService, directionsDisplay);
		        };
					
					document.getElementById('start').addEventListener('change', onChangeHandler);
			        document.getElementById('end').addEventListener('change', onChangeHandler);
		}

		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
		//	var waypts = [];
		//	var checkboxArray = document.getElementById('waypoints');
		//	for (var i = 0; i < checkboxArray.length; i++) {
		//		if (checkboxArray.options[i].selected) {
		//			waypts.push({
		//				location : checkboxArray[i].value,
		//				stopover : true
		//			});
		//		}
		//	}

			directionsService.route({
				origin : document.getElementById('start').value,
				destination : document.getElementById('end').value,
			//	waypoints : waypts,
// 			departureTime: Date,
				optimizeWaypoints : true,
				travelMode : 'DRIVING'
			}, function(response, status) {
				if (status === 'OK') {
					directionsDisplay.setDirections(response);
					var route = response.routes[0];
					var summaryPanel = document
							.getElementById('directions-panel');
					summaryPanel.innerHTML = '';
					// For each route, display summary information.
					for (var i = 0; i < route.legs.length; i++) {
						var routeSegment = i + 1;
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
//   						summaryPanel.innerHTML += route.legs[i].duration.text;
						
								
					}
				} else {
					window.alert('Directions request failed due to ' + status);
				}
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABUZPxB1tHjAh2pZEHkc3TJHNQiv9Kmrg&libraries=places&callback=initMap">
		
	</script>
</body>
</html>
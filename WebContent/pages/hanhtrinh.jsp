<%@page import="eCore.model.HanhTrinh"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhTrinh";
	String tenTrang = "Quản lý Hành Trinh";
	String trangDanhSach = "index.jsp?p=pages/hanhtrinhs.jsp";
	String[] tk_value = {"maHanhTrinh", "noiDi", "noiDen"};
	String[] tk_show = {"Mã Hành Trình", "Nơi Đi", "Nơi Đến"};
%>

<%-- <%@ include file="../../datxePartial/code-header.jsp"%> --%>
<%
	String mode = session.getAttribute("mode") + "";
	String tenTrangChiTiet = "";
	tenTrangChiTiet = mode.equals("addNew") ? "Thêm mới" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

	boolean modeView = mode.equals("viewDetail");
	boolean modeEdit = mode.equals("viewDetailAndEdit");

	HanhTrinh obj = session.getAttribute("obj") != null ? (HanhTrinh) session.getAttribute("obj") : null;
%>
<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maHanhTrinh");
		x.value = x.value.toUpperCase();

		var b = document.getElementById("myFileName");
		b.value = x.value;

	}
	
</script>
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
		
		<input class="controls" id="maHanhTrinh" name="maHanhTrinh" onblur="thayDoiMyFileFileName()"
			value="<%=(obj != null && obj.getMaHanhTrinh() != null ? obj.getMaHanhTrinh() : "")%>"
									
	<%=(modeView || modeEdit ? " readonly " : "")%>>
		
			<br> <b>Nơi đi:</b> 
<!-- 			<input id="start" class="controls" type="text" placeholder="Nhập điểm đi"> -->
			<input id="noiDi" class="controls" type="text" placeholder="Nhập điểm đi"
				name="noiDi" 
				value="<%=(obj != null && obj.getNoiDi()!= null ? obj.getNoiDi() : "")%>"
				<%=(modeView ? " readonly " : "")%>>
			 </input> 
			 
			 
				<br> <b>Nơi đến:</b>
<!-- 				<input id="noiDen" class="controls" class="controls" type="text" -->
<!-- 				placeholder="Nhập điểm đến"> -->
				
				
			<input id="noiDen" class="controls" type="text" placeholder="Nhập điểm đến"
				name="noiDen" 
				value="<%=(obj != null && obj.getNoiDen()!= null ? obj.getNoiDen() : "")%>"
				<%=(modeView ? " readonly " : "")%>>
			</input>
				 <!--       <option value="Da Lat">Vancouver, BC</option> -->
				<!--       <option value="Seattle, WA">Seattle, WA</option> --> <!--       <option value="San Francisco, CA">San Francisco, CA</option> -->
				<!--       <option value="Los Angeles, CA">Los Angeles, CA</option> -->
<!-- 				</select> <br> <input type="submit" id="submit"> -->
		</div>
		<div id="directions-panel"></div>
	</div>
	<script>
		function initMap() {

			var input = document.getElementById('noiDi');
			var input2 = document.getElementById('noiDen');
			var autocomplete = new google.maps.places.Autocomplete(input);
			var autocomplete = new google.maps.places.Autocomplete(input2);

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
					
					document.getElementById('noiDi').addEventListener('change', onChangeHandler);
			        document.getElementById('noiDen').addEventListener('change', onChangeHandler);


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
				origin : document.getElementById('noiDi').value,
				destination : document.getElementById('noiDen').value,
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC03FOXl5cmFLwyFYq3kNPrUgSIYJzoXlc&libraries=places&callback=initMap">
		
	</script>
</body>
</html>
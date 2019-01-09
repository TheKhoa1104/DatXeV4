<%@page import="eCore.util.Util_Date"%>
<%@page import="eCore.model.HanhKhach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhKhach";
	String tenTrang = "Quản lý Hành Khách";
	String trangDanhSach = "index.jsp?p=pages/hanhkhachs.jsp";
	String[] tk_value = {"maHanhKhach", "hoTen", "gioiTinh", "ngaySinh", "soDienThoaiDiDong", "email", "diaChi", "sCMND"};
	String[] tk_show = {"Mã hành khách", "Tên Nhân viên", "Giới tính", "Ngày sinh", "Số điện thoại di động", "Email",
			"Địa chỉ", "Số CMND"};
%>
<%@ include file="../../datxePartial/code-header.jsp"%>
<%
	String mode = session.getAttribute("mode") + "";
	String tenTrangChiTiet = "";
	tenTrangChiTiet = mode.equals("addNew") ? "Thêm mới" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

	boolean modeView = mode.equals("viewDetail");
	boolean modeEdit = mode.equals("viewDetailAndEdit");

	HanhKhach obj = session.getAttribute("obj") != null ? (HanhKhach) session.getAttribute("obj") : null;
%>
<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maHanhKhach");
		x.value = x.value.toUpperCase();

		var b = document.getElementById("myFileName");
		b.value = x.value;

	}
	
</script>
<<style>
#map {
	height: 100%;
	float: left;
	width: 70%;
	height: 100%;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			-
			<%=tenTrangChiTiet%>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<form action="luuDuLieu<%=tenLop%>.action" method="post"
	enctype="multipart/form-data">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: left;">
					<div class="row">
						<div class="col-md-5">
							<p style="color: red; display: inline;"><%=msg%></p>
						</div>
						<div class="col-md-7">
							<%@ include file="../../datxePartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<div id="map"></div>
								</div>

							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<input id="start" class="controls" type="text"
										placeholder="Nhập điểm đi"> </input>
								</div>
								<div class="form-group">
									<input id="end" class="controls" class="controls" type="text"
										placeholder="Nhập điểm đến"> </input>
								</div>


							</div>
						</div>


						<div class="col-md-12"></div>
						<div class="col-md-12">
							<%@ include file="../../datxePartial/processform.jsp"%>
						</div>
					</div>
					<!-- /.col-lg-6 (nested) -->
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<script>
		function initMap() {

			var input = document.getElementById('start');
			var input2 = document.getElementById('end');
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

			document.getElementById('submit').addEventListener(
					'click',
					function() {
						calculateAndDisplayRoute(directionsService,
								directionsDisplay);
					});
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC03FOXl5cmFLwyFYq3kNPrUgSIYJzoXlc&libraries=places&callback=initMap">
		
	</script>
</form>
<%@page import="eCore.model.HanhTrinh"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<%
	String tenLop = "HanhTrinh";
	String tenTrang = "Quản lý Hành Trình Khách";
	String trangDanhSach = "index.jsp?p=pages/hanhtrinhs.jsp";
	String[] tk_value = { "maHanhTrinh", "noiDi", "noiDen"};
	String[] tk_show = { "Mã Hành Trình", "Nơi Đi", "Nơi Đến"};
	
%>
<%@ include file="../datxePartial/code-header.jsp"%>
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
<style>
#directions-panel {
	margin-top: 10px;
	background-color: #FFEE77;
	padding: 10px;
	overflow: scroll;
	height: 174px;
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
<form action="luuDuLieu<%=tenLop%>.action" method="post">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: left;">
					<div class="row">
						<div class="col-md-5">
							<p style="color: red; display: inline;"><%=msg%></p>
						</div>
<!-- 						<div class="col-md-7"> -->
<%-- 							<%@ include file="../../datxePartial/processform.jsp"%> --%>
<!-- 						</div> -->
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class ="form-group">
									<div id="map-canvas"></div>
								</div>
							</div>
							<div class ="col-lg-6">
								<div class="form-group">
									<label>Mã Hành Trình</label> 
									<input class="form-control"
										name="maHanhTrinh" name="maHanhTrinh" onblur="thayDoiMyFileFileName()"
											value="<%=(obj != null && obj.getMaHanhTrinh() != null ? obj.getMaHanhTrinh() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class ="form-group">
								<label>Nơi Đi</label>
									<input id="noiDi" class="controls" type="text"
				placeholder="Nhập điểm đi"
										value="<%=(obj != null && obj.getNoiDi() != null ? obj.getNoiDi() : "")%>"
										<%=(modeView ? " readonly " : "")%>> 
											
								</div>
								<div class ="form-group">
								<label>Nơi Đến</label>
									<input id="noiDen" class="controls" type="text"
				placeholder="Nhập điểm đến"
										value="<%=(obj != null && obj.getNoiDen() != null ? obj.getNoiDen() : "")%>"
										<%=(modeView ? " readonly " : "")%>> 
											
								</div>
								<div class ="form-group">
									<input type="submit" id="submit">		
								</div>
								<div class ="form-group">
								<label>Thông tin Chi Tiết</label>
									<div id="directions-panel"></div>
								</div>
							</div>
								<script>
		function initMap() {

// 			var input = document.getElementById('noiDi');
// 			var input2 = document.getElementById('noiDen');
// 			var autocomplete = new google.maps.places.Autocomplete(input);
// 			var autocomplete = new google.maps.places.Autocomplete(input2);

			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay = new google.maps.DirectionsRenderer;
			var map = new google.maps.Map(document.getElementById('map-canvas'), {
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
						
							
							
							
							
							
							
						

							
<!-- 							<input type="hidden" name="s_hinhAnh" -->
<%-- 							value="<%=obj != null && obj.getHinhAnh() != null ? obj.getHinhAnh() : ""%>"> --%>
<!-- 						<input type="hidden" id="myFileName" name="myFileName"></input> <input -->
<!-- 							type="hidden" name="myFolder" -->
<%-- 							value="<%=request.getRealPath("images/quantri")%>" /> --%>
							<div class="panel-footer" style="text-align: left;">
								<div class="col-md-12"></div>
								<div class="col-md-12">
									<%@ include file="../../datxePartial/processform.jsp"%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</form>
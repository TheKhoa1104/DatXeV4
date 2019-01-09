<%@page import="eCore.model.HanhTrinhTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhTrinhTest";
	String tenTrang = "Hành Trình Test";
	String trangDanhSach = "index.jsp?p=pages/hanhtrinhtests.jsp";
	String[] tk_value = { "maTest", "noiDi", "noiDen", "chiTiet" };
	String[] tk_show = { "Mã Test", "Nơi Đi", "Nơi Đến", "Chi Tiết"};
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

	HanhTrinhTest obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof HanhTrinhTest) {
			obj = (HanhTrinhTest) session.getAttribute("obj");
		}
	}
%>
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
							<div class="col-lg-4">

								<div class="form-group">
									<div id="map"></div>




								</div>
							</div>
							<div class="col-lg-4">
							
								<div class="form-group">
									<label>Mã Test</label> <input class="form-control"
										name="maTest"
										value="<%=(obj != null ? obj.getMaTest() : "")%>"
										<%=(modeView  ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Nơi Đi</label> <input id="noiDi" class="controls"
										type="text" placeholder="Nhập điểm đi" 
										> </input>
								</div>


								<div class="form-group">
									<label>Nơi Đến </label> <input id="noiDen" class="controls"
										type="text" placeholder="Nhập điểm đến"> </input>

								</div>

								<!-- 									<br> <input type="submit" id="submit"> -->
<input type="submit" id="submit1">
								<div class="form-group">
									<label>Thông tin chi tiết </label>
									<div id="directions-panel"></div>
								</div>

								<script>
									function initMap() {

// 										

										var directionsService = new google.maps.DirectionsService;
										var directionsDisplay = new google.maps.DirectionsRenderer;
										var map = new google.maps.Map(document
												.getElementById('map'), {
											zoom : 10,
											center : {
												lat : 10.846740,
												lng : 106.794795
											}
										});
										  directionsDisplay.setMap(map);

									        document.getElementById('submit1').addEventListener('click', function() {
									          calculateAndDisplayRoute(directionsService, directionsDisplay);
									        });
										
									}

								      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
//								         var waypts = [];
//								         var checkboxArray = document.getElementById('waypoints');
//								         for (var i = 0; i < checkboxArray.length; i++) {
//								           if (checkboxArray.options[i].selected) {
//								             waypts.push({
//								               location: checkboxArray[i].value,
//								               stopover: true
//								             });
//								           }
//								         }

								        directionsService.route({
								          origin: document.getElementById('noiDi').value,
								          destination: document.getElementById('noiDen').value,
//								           waypoints: waypts,
								          optimizeWaypoints: true,
								          travelMode: 'DRIVING'
								        }, function(response, status) {
								          if (status === 'OK') {
								            directionsDisplay.setDirections(response);
								            var route = response.routes[0];
								            var summaryPanel = document.getElementById('directions-panel');
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
									src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABUZPxB1tHjAh2pZEHkc3TJHNQiv9Kmrg&libraries=places&callback=initMap">
									
								</script>


							</div>

							<div class="panel-footer" style="text-align: left;">
								<div class="col-md-12"></div>
								<div class="col-md-12">
<%-- 									<%@ include file="../../datxePartial/processform.jsp"%> --%>
								</div>
							</div>
						</div>
<!-- 						<div class="row"> -->
<!-- 							<div class="col-lg-12"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Mô tả</label> -->
<!-- 									<textarea class="form-control" cols="80" id="editor1" rows="5" -->
<%-- 										name="moTa" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getMoTa() != null ? obj.getMoTa() : "")%></textarea> --%>
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Ghi chú</label> -->
<!-- 									<textarea class="form-control" cols="80" id="editor2" rows="5" -->
<%-- 										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getGhiChu() : "")%></textarea> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="panel-footer" style="text-align: left;"> -->
<!-- 							<div class="col-md-5"></div> -->
<!-- 							<div class="col-md-7"> -->
<%-- 								<%@ include file="../../datxePartial/processform.jsp"%> --%>
<!-- 							</div> -->
<!-- 						</div> -->
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
</form>
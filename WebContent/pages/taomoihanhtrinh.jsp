<%@page import="eCore.model.HanhTrinhTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhTrinhTest";
	String tenTrang = "Hành Trình Test";
	String trangDanhSach = "index.jsp?p=pages/hanhtrinhtests.jsp";
	String[] tk_value = { "maTest", "noiDi", "noiDen", "chiTiet"};
	String[] tk_show = {"Mã Test", "Nơi Đi", "Nơi Đến", "Chi Tiết" };
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

	HanhTrinhTest obj = session.getAttribute("obj") != null ? (HanhTrinhTest) session.getAttribute("obj") : null;
%>
<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maTest");
		x.value = x.value.toUpperCase();

		var b = document.getElementById("myFileName");
		b.value = x.value;

	}
</script>
<style>
#map {
	width: 300px;
	height: 300px;
	margin: auto;
}

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
						<div class="col-md-7">
							<%@ include file="../../datxePartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-4">

								<div class="form-group">
									<div id="map"></div>
									<script>
										var map;
										function initMap() {
											map = new google.maps.Map(document
													.getElementById('map'), {
												center : {
													lat : -34.397,
													lng : 150.644
												},
												zoom : 8,
												scrollwheel : false

											});
										}
									</script>
									<script
										src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABUZPxB1tHjAh2pZEHkc3TJHNQiv9Kmrg&callback=initMap"
										async defer></script>
								</div>
							</div>
							<div class="col-lg-4">



								<div class="form-group">
									<label>Mã Test</label> <input class="form-control"
										name="maTest"
										value="<%=(obj != null ? obj.getMaTest() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
<!-- 								<div class="form-group"> -->
<!-- 									<label>Tài Xế</label> <select class="form-control" -->
<%-- 										name="maTaiXe" <%=(modeView ? " disabled " : "")%>> --%>
<!-- 									<option value=""></option> -->
<%-- 									<% --%>
<!--  											ObjectDAO objdao = new DAO_TaiXe(); -->
<!--  											ArrayList<TaiXe> listTaiXe = objdao.listAll(); -->
<!--  											for (TaiXe hk : listTaiXe) { -->
<%-- 										%> --%>
<%-- 									<option value="<%=hk.maTaiXe%> " --%>
<%-- 										<%=obj != null && obj.getTaiXe() != null && obj.getTaiXe().maTaiXe.equals(hk.maTaiXe) ? "selected" --%>
<%-- 												: ""%>> --%>
<%-- 										<%=hk.hoTen%> --%>
<!-- 									</option> -->
<%-- 									<% --%>
// 											}
<%-- 										%> --%>
<!-- 									</select> -->
<!-- 								</div> -->

								<div class="form-group">
									<label>Nơi Đi</label> <input class="form-control" name="noiDi"
										value="<%=(obj != null && obj.getNoiDi() != null ? obj.getNoiDi() : "")%>"
										<%=(modeView  ? " readonly " : "")%>>
								</div>


								<div class="form-group">
									<label>Nơi Đến </label> <input class="form-control"
										name="noiDen"
										value="<%=(obj != null && obj.getNoiDen() != null ? obj.getNoiDen() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								
								<div class="form-group">
									<label>Chi Tiết </label> <input class="form-control"
										name="chiTiet"
										value="<%=(obj != null && obj.getChiTiet() != null ? obj.getChiTiet() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								
								
								
								
								</div>
<!-- 								<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Só Lượng Ghế </label> <input class="form-control" -->
<!-- 										name="soLuongGhe" -->
<%-- 										value="<%=(obj != null && obj.getSoLuongGhe() != null ? obj.getSoLuongGhe() : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Ngày Đi</label> <input class="form-control" -->
<!-- 										name="s_ngayDi" type="date" -->
<%-- 										value="<%=(obj != null && obj.getNgayDi() != null ? Util_Date.dateToString(obj.getNgayDi()) : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
								
<!-- 								<div class="form-group"> -->
<!-- 									<label>Thời Gian</label> <input class="form-control" -->
<!-- 										name="s_thoiGian" type="date" -->
<%-- 										value="<%=(obj != null && obj.getThoiGian() != null ? Util_Date.dateToString(obj.getThoiGian()) : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
								
<!-- 								<div class="form-group"> -->
<!-- 									<label>Thông tin chi tiết </label> -->
<!-- 									<div id="directions-panel"></div> -->
<!-- 								</div> -->

<!-- 							</div> -->


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
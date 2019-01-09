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
</form>
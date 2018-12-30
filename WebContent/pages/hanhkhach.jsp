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
									<label>Mã hành khách</label> <input class="form-control"
										id="maHanhKhach" name="maHanhKhach" onblur="thayDoiMyFileFileName()"
											value="<%=(obj != null && obj.getMaHanhKhach() != null ? obj.getMaHanhKhach() : "")%>"
									
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên hành khách</label> <input class="form-control"
										name="tenHanhKhach"
										value="<%=(obj != null && obj.getHoTen() != null ? obj.getHoTen() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>

								<div class="form-group">
									<label>Ngày sinh</label> <input class="form-control"
										name="s_ngaySinh" type="date"
										value="<%=(obj != null && obj.getNgaySinh() != null ? Util_Date.dateToString(obj.getNgaySinh()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
<!-- 								<div class="form-group"> -->
<!-- 									<label>Ngày vào làm</label> <input class="form-control" -->
<!-- 										name="s_ngayVaoLam" type="date" -->
<%-- 										value="<%=(obj != null && obj.getNgayVaoLam() != null ? Util_Date.dateToString(obj.getNgayVaoLam()) : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
								<div class="form-group">
									<label>Giới tính</label> <select class="form-control"
										name="gioiTinh">
										<option></option>
										<option value="Nam"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nam") ? "selected" : ""%>>Nam</option>
										<option value="Nữ"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nữ") ? "selected" : ""%>>Nữ</option>
									</select>
								</div>
								<div class="form-group">
									<label>Địa chỉ</label> <input class="form-control"
										name="diaChi"
										value="<%=(obj != null && obj.getDiaChi() != null ? obj.getDiaChi() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">


								<div class="form-group">
									<label>Email</label> <input class="form-control" name="email"
										value="<%=(obj != null && obj.getEmail() != null ? obj.getEmail() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Số điện thoại di động</label> <input
										class="form-control" name="soDienThoaiDiDong"
										value="<%=(obj != null && obj.getSoDienThoaiDiDong() != null ? obj.getSoDienThoaiDiDong() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
<!-- 								<div class="form-group"> -->
<!-- 									<label>Bậc lương</label> <input class="form-control" -->
<!-- 										name="bacLuong" -->
<%-- 										value="<%=(obj != null && obj.getBacLuong() != null ? obj.getBacLuong() : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Hệ số lương</label> <input class="form-control" -->
<!-- 										name="heSo" -->
<%-- 										value="<%=(obj != null && obj.getHeSo() != null ? obj.getHeSo() : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Ngày hưởng</label> <input class="form-control" -->
<!-- 										name="s_ngayHuong" type="date" -->
<%-- 										value="<%=(obj != null && obj.getNgayHuong() != null ? Util_Date.dateToString(obj.getNgayHuong()) : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
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
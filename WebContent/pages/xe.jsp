<%@page import="eCore.model.TaiXe"%>
<%@page import="eCore.modelDao.DAO_TaiXe"%>
<%@page import="eCore.model.Xe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String tenlop = "Xe";
String tenTrang = "Quản Lý Xe";
String trangDanhSach = "index.jsp?p=pages/xes.jsp";
String[] tk_value = {"maXe", "taiXe", "bienSo", "loaiXe", "moTa", "hinhAnh"};
String[] tk_show = {"Mã Xe", "Tài Xế", "Biển Số", "Loại Xe", "Mô Tả", "Hình Ảnh"};
	
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

	Xe obj = session.getAttribute("obj") != null ? (Xe) session.getAttribute("obj") : null;
%>
<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maXe");
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
<form action="luuDuLieu<%=tenlop%>.action" method="post">
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
									<label>Mã xe</label> <input class="form-control"
										name="maXe" r value="<%=(obj != null ? obj.getMaXe() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="form-group">
									<label>Tài Xế</label> <select class="form-control"
										name="maTaiXe" <%=(modeView ? " disabled " : "")%>>
										<option value=""></option>
										<%
											ObjectDAO objdao = new DAO_TaiXe();
											ArrayList<TaiXe> listTaiXe = objdao.listAll();
											for (TaiXe tx : listTaiXe) {
										%>
										<option value="<%=tx.maTaiXe%> "
											<%=obj != null && obj.getTaiXe() != null && obj.getTaiXe().maTaiXe.equals(tx.maTaiXe) ? "selected"
													: ""%>>
											<%=tx.hoTen%>
											
										</option>
										<%
											}
										%>
									</select>
								</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Hình ảnh</label> <input class="form-control"
										name="myFile"
										value="<%=(obj != null && obj.getHinhAnh() != null ? obj.getHinhAnh() : "")%>"
										type="<%=(modeView ? "hidden" : "file")%>"><img
										src="<%=obj != null && obj.getHinhAnh() != null && modeView ? "kTXCore/images/taixes/" + obj.getHinhAnh()
					: ""%>"
										height="<%=modeView ? 135 : 1%>"
										width="<%=modeView ? 135 : 1%>">
								</div>
							</div>
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Giới tính</label> <select class="form-control" -->
<%-- 										<%=(modeView ? " disabled " : "")%> name="gioiTinh"> --%>
<!-- 										<option></option> -->
<!-- 										<option value="Nam" -->
<%-- 											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nam") ? "selected" : ""%>>Nam</option> --%>
<!-- 										<option value="Nữ" -->
<%-- 											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nữ") ? "selected" : ""%>>Nữ</option> --%>
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col-lg-4">
								<div class="form-group">
									<label>Biển Số</label> <input class="form-control"
										name="bienSo"
										value="<%=(obj != null ? obj.getBienSo() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Loại Xe</label> <input class="form-control"
										name="loaiXe"
										value="<%=(obj != null && obj.getLoaiXe() != null ? obj.getLoaiXe() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>moTa</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="moTa" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getMoTa() != null ? obj.getMoTa() : "")%></textarea>
								</div>
							</div>
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Dân Tộc</label> <input class="form-control" -->
<!-- 										name="danToc" -->
<%-- 										value="<%=(obj != null && obj.getDanToc() != null ? obj.getDanToc() : "")%>" --%>
<%-- 										<%=(modeView ? " readonly " : "")%>> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 								<label>Địa Chỉ</label> <input class="form-control" -->
<!-- 									name="diaChi" -->
<%-- 									value="<%=(obj != null && obj.getDiaChi() != null ? obj.getDiaChi() : "")%>" --%>
<%-- 									<%=(modeView ? " readonly " : "")%>> --%>
<!-- 							</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 								<label>Số CMND</label> <input class="form-control" name="cMND" -->
<%-- 									value="<%=(obj != null && obj.getcMND() != null ? obj.getcMND() : "")%>" --%>
<%-- 									<%=(modeView ? " readonly " : "")%>> --%>
<!-- 							</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Số điện thoại</label> <input class="form-control" -->
<!-- 										name="soDienThoaiDiDong" -->
<%-- 										value="<%=(obj != null && obj.getSoDienThoaiDiDong() != null ? obj.getSoDienThoaiDiDong() : "")%>" --%>
<%-- 										<%=(modeView || modeEdit ? " readonly " : "")%>> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Email</label> <input class="form-control" name="email" r -->
<%-- 										value="<%=(obj != null ? obj.getEmail() : "")%>" --%>
<%-- 										<%=(modeView || modeEdit ? " readonly " : "")%>> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Địa chỉ</label> <input class="form-control" -->
<!-- 										name="diaChi" r -->
<%-- 										value="<%=(obj != null ? obj.getDiaChi() : "")%>" --%>
<%-- 										<%=(modeView || modeEdit ? " readonly " : "")%>> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>Ghi chú</label> -->
<!-- 									<textarea class="form-control" cols="80" id="editor2" rows="5" -->
<%-- 										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getGhiChu() : "")%></textarea> --%>
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
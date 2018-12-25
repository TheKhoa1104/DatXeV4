<%@page import="eCore.util.Util_Date"%>
<%@page import="eCore.model.QuanTri"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String tenlop = "QuanTri";
String tenTrang = "Quản trị";
String trangDanhSach = "index.jsp?p=pages/quantris.jsp";
String[] tk_value = {"maQuanTri", "hoTen", "ngaySinh", "gioiTinh", "noiSinh", "queQuan", "danToc", "tonGiao", "diaChi", "cMND", "email","soDienThoaiDiDong",  "soTaiKhoan"};
String[] tk_show = {"Mã Quản Trị", "Họ Tên", "Ngày Sinh", "Giới Tính", "Nới Sinh", "Quê Quán", "Dân Tộc", "Tôn Giáo", "Địa Chỉ", "Số CMND","Email","Số Điện Thoại Di động" , "Số Tài Khoản"};
	
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

	QuanTri obj = session.getAttribute("obj") != null ? (QuanTri) session.getAttribute("obj") : null;
%>
<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maQuanTri");
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
									<label>Mã quản trị</label> <input class="form-control"
										name="maQuanTri" r value="<%=(obj != null ? obj.getMaQuanTri() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Họ và tên</label> <input class="form-control"
										name="tenQuanTri"
										value="<%=(obj != null && obj.getHoTen() != null ? obj.getHoTen() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
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
							<div class="col-lg-4">
								<div class="form-group">
									<label>Giới tính</label> <select class="form-control"
										<%=(modeView ? " disabled " : "")%> name="gioiTinh">
										<option></option>
										<option value="Nam"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nam") ? "selected" : ""%>>Nam</option>
										<option value="Nữ"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nữ") ? "selected" : ""%>>Nữ</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Ngày sinh</label> <input class="form-control"
										name="ngaySinh"
										value="<%=(obj != null ? obj.getNgaySinh() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Quê Quán</label> <input class="form-control"
										name="queQuan"
										value="<%=(obj != null && obj.getQueQuan() != null ? obj.getQueQuan() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Nơi Sinh</label> <input class="form-control"
										name="noiSinh"
										value="<%=(obj != null && obj.getNoiSinh() != null ? obj.getNoiSinh() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Dân Tộc</label> <input class="form-control"
										name="danToc"
										value="<%=(obj != null && obj.getDanToc() != null ? obj.getDanToc() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
								<label>Địa Chỉ</label> <input class="form-control"
									name="diaChi"
									value="<%=(obj != null && obj.getDiaChi() != null ? obj.getDiaChi() : "")%>"
									<%=(modeView ? " readonly " : "")%>>
							</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
								<label>Tôn giáo</label> <input class="form-control"
									name="tonGiao"
									value="<%=(obj != null && obj.getTonGiao() != null ? obj.getTonGiao() : "")%>"
									<%=(modeView ? " readonly " : "")%>>
							</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
								<label>Số CMND</label> <input class="form-control" name="cMND"
									value="<%=(obj != null && obj.getcMND() != null ? obj.getcMND() : "")%>"
									<%=(modeView ? " readonly " : "")%>>
							</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Số điện thoại</label> <input class="form-control"
										name="soDienThoaiDiDong"
										value="<%=(obj != null && obj.getSoDienThoaiDiDong() != null ? obj.getSoDienThoaiDiDong() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							
							<div class="col-lg-4">
								<div class="form-group">
									<label>Địa chỉ</label> <input class="form-control"
										name="diaChi" r
										value="<%=(obj != null ? obj.getDiaChi() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Email</label> <input class="form-control" name="email" r
										value="<%=(obj != null ? obj.getEmail() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Số tài khoản</label> <input class="form-control" name="email" r
										value="<%=(obj != null ? obj.getSoDienThoaiDiDong() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor2" rows="5"
										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getGhiChu() : "")%></textarea>
								</div>
							</div>
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
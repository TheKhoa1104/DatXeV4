<%@page import="eCore.modelDao.DAO_HanhTrinhTaiXe"%>
<%@page import="eCore.model.HanhTrinhTaiXe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhTrinhTaiXe";
	String tenTrang = "Quản lý Hành Trình Tài Xế";
	String[] tk_value = { "maHanhTrinhTaiXe", "taiXe", "noiDi","tramDung", "noiDen","soLuongGhe","ngayDi","thoiGian"};
	String[] tk_show = { "Mã Hành Trình Tài Xế", "Tài Xế", "Nơi Đi","Trạm Dừng", "Nơi Đến","Số Lượng Ghế","Ngày Đi","Thời Gian"};
%>
<%@ include file="../../datxePartial/code-header.jsp"%>
<%
	ObjectDAO<HanhTrinhTaiXe> dao = new DAO_HanhTrinhTaiXe();

	ArrayList<HanhTrinhTaiXe> list = new ArrayList<HanhTrinhTaiXe>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof HanhTrinhTaiXe) {
		list = (ArrayList<HanhTrinhTaiXe>) listTemp;
	} else {
		session.setAttribute("checkTimKiem", null);
		list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
	}
		} else
	list = new ArrayList<HanhTrinhTaiXe>();
	} else {
		list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
	}
%>
<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			<p style="color: red; display: inline;"><%=msg%></p>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-12">
<%-- 		<%@ include file="../../datxePartial/panel-heading.jsp"%> --%>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="row" style="align-items: center;">
			<div class="col-md-3">
				<form class="form-inline">
					<script type="text/javascript">
						function myFunction() {
							var recordPerPage = document
									.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&recordPerPage="
									+ recordPerPage;

						}
					</script>
					<input type="hidden" id="p1" value=<%=p1%> /> <label>Số lượng:</label>
					 <select class="form-control" name="recordPerPage"
						id="recordPerPage" onchange="myFunction()">
						<option <%if (s_recordPerPage.equals("10")) {%>
							selected="selected" <%}%>>10</option>
						<option <%if (s_recordPerPage.equals("50")) {%>
							selected="selected" <%}%>>50</option>
						<option <%if (s_recordPerPage.equals("100")) {%>
							selected="selected" <%}%>>100</option>
					</select>
				</form>
			</div>
			<div class="col-md-9">
				<div class="row pull-right" style="margin-right: 10px;">
					<!-- 					<div class="col-md-2" style="padding: 1px"> -->
					<%-- 						<form class="form-inline" action="taiLai<%=tenLop%>.action" --%>
					<!-- 							method="post"> -->
					<!-- 							<button type="submit" class="btn btn-block btn-default" -->
					<!-- 								style="text-align: left;" style="width: 100%" id="nutTaiLai"> -->
					<!-- 								<img src="content/images/refresh-32.png" width="16px" -->
					<!-- 									height="16px" /> &nbsp; Tải lại -->
					<!-- 							</button> -->
					<!-- 						</form> -->
					<!-- 					</div> -->
					<!-- 					<div class="col-md-3" style="padding: 1px"> -->
					<%-- 						<form class="form-inline" action="themMoi<%=tenLop%>.action" --%>
					<!-- 							method="post"> -->
					<!-- 							<button type="submit" class="btn btn-block btn-default" -->
					<!-- 								style="text-align: left;" id="nutThemMoi"> -->
					<!-- 								<img src="content/images/new-32.png" width="16px" height="16px" /> -->
					<!-- 								&nbsp; Thêm mới -->
					<!-- 							</button> -->
					<!-- 						</form> -->
					<!-- 					</div> -->
					<!-- 					<div class="col-md-3" style="padding: 1px"> -->
					<!-- 						<a class="btn btn-block btn-default" style="text-align: left;" -->
					<!-- 							id="nutNhapLieuExcel"> <img src="content/images/excel-32.png" -->
					<!-- 							width="16px" height="16px" /> &nbsp; Nhập liệu Excel -->
					<!-- 						</a> -->
					<!-- 					</div> -->
					<!-- 					<div class="col-md-2" style="padding: 1px"> -->
					<!-- 						<a type="button" class="btn btn-block btn-default" -->
					<!-- 							style="text-align: left;" data-toggle="modal" -->
					<!-- 							data-target="#timKiemModal" id="nutTimKiem"> <img -->
					<!-- 							src="content/images/search-32.png" width="16px" height="16px" /> -->
					<!-- 							&nbsp; Tìm kiếm -->
					<!-- 						</a> -->
					<!-- 					</div> -->
					<!-- 					<div class="col-md-2" style="padding: 1px"> -->
					<!-- 						<a class="btn btn-block  btn-default" style="text-align: left;" -->
					<!-- 							id="nutBaoCao"> <img src="content/images/report-32.png" -->
					<!-- 							width="16px" height="16px" /> &nbsp; Báo cáo -->
					<!-- 						</a> -->
					<!-- 					</div> -->


					<a type="submit" class="btn  btn-default"
						href="taiLai<%=tenLop%>.action" style="text-align: left;"
						style="width: 100%" id="nutTaiLai"> <img
						src="content/images/refresh-32.png" width="16px" height="16px" />
						&nbsp; Tải lại
					</a> 
					<a type="submit" class="btn  btn-default"
						href="themMoi<%=tenLop%>.action" style="text-align: left;"
						id="nutThemMoi"> <img src="content/images/new-32.png"
						width="16px" height="16px" /> &nbsp; Tạo chuyến
					</a> 
<!-- 					<a class="btn  btn-default" style="text-align: left;" data-toggle="modal" -->
<!-- 						data-target="#nhapExcelModal" -->
<!-- 						id="nutNhapLieuExcel"> <img src="content/images/excel-32.png" -->
<!-- 						width="16px" height="16px" /> &nbsp; Nhập liệu Excel -->
<!-- 					</a>  -->
<!-- 					<a type="button" class="btn  btn-default" -->
<!-- 						style="text-align: left;" data-toggle="modal" -->
<!-- 						data-target="#timKiemModal" id="nutTimKiem"> <img -->
<!-- 						src="content/images/search-32.png" width="16px" height="16px" /> -->
<!-- 						&nbsp; Tìm kiếm -->
<!-- 					</a>  -->
<!-- 					<a class="btn   btn-default" style="text-align: left;"  -->
<!-- 						id="nutBaoCao"> <img src="content/images/report-32.png" -->
<!-- 						width="16px" height="16px" /> &nbsp; Báo cáo -->
<!-- 					</a> -->
				</div>
			</div>
		</div>
	</div>
</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã Hành Trình Tài Xế</th>
						<th>Tài Xế</th>
						<th>Nơi Đi</th>
						<th>Trạm dừng</th>
						<th>Nơi Đến</th>
						<th>Số Lượng Ghế</th>
						<th>Ngày Đi</th>
						<th>Thời Gian</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (HanhTrinhTaiXe obj : list) {
													//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
													String maDoiTuong = obj.getMaHanhTrinhTaiXe();
													String tenDoiTuong = obj.getNoiDi();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaHanhTrinhTaiXe()%></td>
						<td><%=obj.getTaiXe() == null ? "" : obj.getTaiXe().getHoTen()%></td>
						<td><%=obj.getNoiDi()!=null?obj.getNoiDi():""%></td>
						<td><%=obj.getTramDung()!=null?obj.getTramDung():""%></td>
						<td><%=obj.getNoiDen()!=null?obj.getNoiDen():""%></td>
						<td><%=obj.getSoLuongGhe()!=null?obj.getSoLuongGhe():""%></td>
						<td><%=obj.getNgayDi()!=null?obj.getNgayDi():""%></td>
						<td><%=obj.getThoiGian()!=null?obj.getThoiGian():""%></td>
						<td style="text-align: center;"><%@ include
								file="../../datxePartial/menupullcuadoituong.jsp"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- /.table-responsive -->
			<!-- Phan trang -->
			<%@ include file="../../datxePartial/phantrang.jsp"%>
			<!-- ket thuc phan trang -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<%@ include file="../../datxePartial/timkiemModel.jsp"%>
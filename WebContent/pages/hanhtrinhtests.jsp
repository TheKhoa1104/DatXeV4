<%@page import="eCore.modelDao.DAO_HanhTrinhTest"%>
<%@page import="eCore.model.HanhTrinhTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhTrinhTest";
	String tenTrang = "Hành Trình Test";
	String[] tk_value = { "maTest", "noiDi", "noiDen", "chiTiet"};
	String[] tk_show = {"Mã Test", "Nơi Đi", "Nơi Đến", "Chi Tiết" };
%>
<%@ include file="../../datxePartial/code-header.jsp"%>
<%
	ObjectDAO<HanhTrinhTest> dao = new DAO_HanhTrinhTest();

	ArrayList<HanhTrinhTest> list = new ArrayList<HanhTrinhTest>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof HanhTrinhTest) {
				list = (ArrayList<HanhTrinhTest>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<HanhTrinhTest>();
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
						href="pages/taomoihanhtrinh.jsp" style="text-align: left;"
						id="nutThemMoi"> <img src="content/images/new-32.png"
						width="16px" height="16px" /> &nbsp; Thêm mới
					</a> 
					<a class="btn  btn-default" style="text-align: left;" data-toggle="modal"
						data-target="#nhapExcelModal"
						id="nutNhapLieuExcel"> <img src="content/images/excel-32.png"
						width="16px" height="16px" /> &nbsp; Nhập liệu Excel
					</a>
					 <a type="button" class="btn  btn-default"
						style="text-align: left;" data-toggle="modal"
						data-target="#timKiemModal" id="nutTimKiem"> <img
						src="content/images/search-32.png" width="16px" height="16px" />
						&nbsp; Tìm kiếm
					</a> 
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
						<th>Mã test</th>
						<th>Nơi Đi</th>
						<th>Nơi Đến</th>
						<th>Chi Tiết</th>
						<th>Xử lí</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (HanhTrinhTest obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaTest();
							String tenDoiTuong = obj.getNoiDi();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaTest()%></td>
						<td><%=obj.getNoiDi() != null ? obj.getNoiDi() : ""%></td>
						<td><%=obj.getNoiDen() != null ? obj.getNoiDen() : ""%></td>
						<td><%=obj.getChiTiet() != null ? obj.getChiTiet() : ""%></td>

						<td style="text-align: center;">
<%-- 						<%@ include file="../../datxePartial/menupullcuadoituong.jsp"%></td> --%>
						<div class="pull-center">
	<div class="btn-group">
		<button type="button" class="btn btn-default btn-xs dropdown-toggle"
			data-toggle="dropdown">
			<img src="content/images/menu-16.png" /> Chọn chức năng <span
				class="caret"></span>
		</button>
		<ul class="dropdown-menu pull-right" role="menu">

			<li><a href="pages/hanhtrinhtest.jsp"><img
					src="content/images/detail-16.png" />&nbsp;&nbsp; Xem chi tiết</a></li>
			<li id="xemChiTietVaChinhSuaDoiTuong"><a
				href="xemChiTietVaChinhSua<%=tenLop%>.action?maobj=<%=maDoiTuong%>"><img
					src="content/images/edit-16.png" />&nbsp;&nbsp; Chỉnh sửa</a></li>
			<li id="xoaDoiTuong"><a id="<%=tenLop%>" title="<%=maDoiTuong%>"
				target="<%=tenDoiTuong%>" onclick="confirmDelete(this)"><img
					src="content/images/delete-16.png" />&nbsp;&nbsp; Xóa</a></li>
		</ul>
	</div>
</div>
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
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- Modal Tìm kiếm-->
<%@ include file="../../datxePartial/timkiemModel.jsp"%>
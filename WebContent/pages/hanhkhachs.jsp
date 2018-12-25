<%@page import="eCore.modelDao.DAO_HanhKhach"%>
<%@page import="eCore.model.HanhKhach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhKhach";
	String tenTrang = "Quản lý Hành Khách";
	String[] tk_value = {"maHanhKhach", "hoTen", "gioiTinh", "ngaySinh", "soDienThoaiDiDong", "email", "diaChi", "sCMND"};
	String[] tk_show = {"Mã hành khách", "Tên Nhân viên", "Giới tính", "Ngày sinh", "Số điện thoại di động", "Email",
			"Địa chỉ", "Số CMND"};
%>
<%@ include file="../../datxePartial/code-header.jsp"%>
<%
	ObjectDAO<HanhKhach> dao = new DAO_HanhKhach();

	ArrayList<HanhKhach> list = new ArrayList<HanhKhach>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof HanhKhach) {
				list = (ArrayList<HanhKhach>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<HanhKhach>();
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
		<%@ include file="../../datxePartial/panel-heading.jsp"%>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã hành khách</th>
						<th>Tên hành khách</th>
						<th>Email</th>
						<th>Ngày Sinh</th>
						<th>Số điện thoại</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (HanhKhach obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaHanhKhach();
							String tenDoiTuong = obj.getHoTen();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaHanhKhach()%></td>
						<td><%=obj.getHoTen() != null ? obj.getHoTen() : ""%></td>
						<td><%=obj.getEmail() != null ? obj.getEmail() : ""%></td>
						<td><%=obj.getNgaySinh() != null ? obj.getNgaySinh() : ""%></td>
						<td><%=obj.getSoDienThoaiDiDong() != null ? obj.getSoDienThoaiDiDong() : ""%></td>
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
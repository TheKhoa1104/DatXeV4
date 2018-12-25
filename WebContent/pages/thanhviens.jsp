<%@page import="eCore.model.QuanTri"%>
<%@page import="eCore.modelDao.DAO_ThanhVien"%>
<%@page import="eCore.model.ThanhVien"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "ThanhVien";
	String tenTrang = "Quản lý Thành Viên";
	String[] tk_value = {"maTV", "tenTV", "gioiTinh", "ngaySinh", "email", "diaChi"};
	String[] tk_show = {"Mã Nhân viên", "Tên Nhân viên", "Giới tính", "Ngày Sinh", "Email", "Địa chỉ"};
%>

<%@ include file="../../datxePartial/code-header.jsp"%>
<%
ObjectDAO<ThanhVien> dao = new DAO_ThanhVien();

	ArrayList<ThanhVien> list = new ArrayList<ThanhVien>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof ThanhVien) {
				list = (ArrayList<ThanhVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<ThanhVien>();
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
						<th>Mã thành viên</th>
						<th>Tên thành viên</th>
						<th>Email</th>
						<th>Ngày Sinh</th>
						<th>Số điện thoại</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (ThanhVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaTV();
							String tenDoiTuong = obj.getTenTV();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaTV()%></td>
						<td><%=obj.getTenTV() != null ? obj.getTenTV() : ""%></td>
						<td><%=obj.getEmail() != null ? obj.getEmail() : ""%></td>
						<td><%=obj.getNgaySinh() != null ? obj.getNgaySinh() : ""%></td>
						<td><%=obj.getsDT() != null ? obj.getsDT() : ""%></td>
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
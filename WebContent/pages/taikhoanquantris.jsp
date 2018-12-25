<%@page import="java.util.ArrayList"%>
<%@page import="eCore.model.TaiKhoanQuanTri"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@page import="eCore.modelDao.DAO_TaiKhoanQuanTri"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "TaiKhoanQuanTri";
	String tenTrang = "Quản lý Tài Khoản Quản Trị";
	String[] tk_value = { "maDangNhap", "ngayTao", "cauHoiBiMat", "loaiTaiKhoan", "hoVaTen", "email" };
	String[] tk_show = { "Mã đăng nhập", "Ngày tạo", "Câu hỏi bí mật", "Loại tài khoản", "Họ và tên", "Email" };
%>
<%@ include file="../../datxePartial/code-header.jsp"%>

<%
	ObjectDAO<TaiKhoanQuanTri> dao = new DAO_TaiKhoanQuanTri();

	ArrayList<TaiKhoanQuanTri> list = new ArrayList<TaiKhoanQuanTri>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof TaiKhoanQuanTri) {
				list = (ArrayList<TaiKhoanQuanTri>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<TaiKhoanQuanTri>();
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
<!-- /.row -->
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
						<th>Mã đăng nhập</th>
						<th>Loại tài khoản</th>
						<th>Trạng thái hoạt động</th>
						<th>Email</th>
						<th>Họ và tên</th>
						<th>Xử lí</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (TaiKhoanQuanTri obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaDangNhap();
							String tenDoiTuong = obj.getHoVaTen();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaDangNhap()%></td>
						<td><%=obj.getLoaiTaiKhoan() != null ? obj.getLoaiTaiKhoan() : ""%></td>
						<td><%=obj.isTrangThaiHoatDong() == true ? "Hoạt động" : "Không hoạt động"%></td>
						<td><%=obj.getEmail() != null ? obj.getEmail() : ""%></td>
						<td><%=obj != null && obj.getQuantri() != null ? obj.getQuantri().getHoTen() : ""%></td>

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
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- Modal Tìm kiếm-->
<%@ include file="../../datxePartial/timkiemModel.jsp"%>
<%@page import="eCore.modelDao.DAO_QuanTri"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eCore.model.QuanTri"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "QuanTri";
	String tenTrang = "Quản Trị";
	String[] tk_value = { "maQuanTri", "hoTen", "ngaySinh", "gioiTinh", "noiSinh", "queQuan", "danToc", "tonGiao", "diaChi", "cMND", "email","soDienThoaiDiDong", "soTaiKhoan"};
	String[] tk_show = { "Mã Quản Trị", "Họ Tên", "Ngày Sinh", "Giới Tính", "Nới Sinh", "Quê Quán", "Dân Tộc", "Tôn Giáo", "Địa Chỉ", "Số CMND","Email","Số Điện Thoại Di động", "Số Tài Khoản"};
%>
<%@ include file="../datxePartial/code-header.jsp"%>
<%
	ObjectDAO<QuanTri> dao = new DAO_QuanTri();

	ArrayList<QuanTri> list = new ArrayList<QuanTri>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof QuanTri) {
				list = (ArrayList<QuanTri>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<QuanTri>();
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
						<th>Mã hành khách</th>
						<th>Họ tên</th>
<!-- 						<th>Hình ảnh</th> -->
<!-- 						<th>Ngày sinh</th> -->
						<th>Giới tính</th>
						<th>Nơi sinh</th>
<!-- 						<th>Quê quán</th> -->
<!-- 						<th>Dân tộc</th> -->
<!-- 						<th>Tôn giáo</th> -->
						<th>Địa chỉ</th>
						<th>CMND</th>
						<th>Email</th>
						<th>SĐT</th>
<!-- 						<th>Số tài khoản</th> -->
<!-- 						<th>Ghi chú</th> -->
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (QuanTri obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaQuanTri();
							String tenDoiTuong = obj.getHoTen();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaQuanTri()%></td>
						<td><%=obj.getHoTen() != null ? obj.getHoTen() : ""%></td>
<%-- 						<td><%=obj.getHinhAnh()!=null?obj.getHinhAnh():""%></td> --%>
<%-- 						<td><%=obj.getNgaySinh()!=null?obj.getNgaySinh():""%></td> --%>
						<td><%=obj.getGioiTinh()!=null?obj.getGioiTinh():""%></td>
						<td><%=obj.getNoiSinh()!=null?obj.getNoiSinh():""%></td>
<%-- 						<td><%=obj.getQueQuan()!=null?obj.getQueQuan():""%></td> --%>
<%-- 						<td><%=obj.getDanToc()!=null?obj.getDanToc():""%></td> --%>
<%-- 						<td><%=obj.getTonGiao()!=null?obj.getTonGiao():""%></td> --%>
						<td><%=obj.getDiaChi()!=null?obj.getDiaChi():""%></td>
						<td><%=obj.getcMND()!=null?obj.getcMND():""%></td>
						<td><%=obj.getEmail()!=null?obj.getEmail():""%></td>
						<td><%=obj.getSoDienThoaiDiDong()!=null?obj.getSoDienThoaiDiDong():""%></td>
<%-- 						<td><%=obj.getGhiChu()!=null?obj.getGhiChu():""%></td> --%>
<%-- 						<td><%=obj.getSoTaiKhoan()!=null?obj.getSoTaiKhoan():""%></td> --%>
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
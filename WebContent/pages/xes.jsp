<%@page import="eCore.modelDao.DAO_Xe"%>
<%@page import="eCore.model.Xe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "Xe";
	String tenTrang = "Quản lý Xe";
	String[] tk_value = { "maXe", "taiXe", "bienSo", "loaiXe", "moTa", "hinhAnh"};
	String[] tk_show = { "Mã Xe", "Tài Xế", "Biển Số", "Loại Xe", "Mô Tả", "Hình Ảnh"};
%>
<%@ include file="../../datxePartial/code-header.jsp"%>
<%
	ObjectDAO<Xe> dao = new DAO_Xe();

	ArrayList<Xe> list = new ArrayList<Xe>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof Xe) {
				list = (ArrayList<Xe>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<Xe>();
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
						<th>Mã Xe</th>
						<th>Họ tên tài xế</th>
						<th>Biển số</th>
						<th>Loại xe</th>
						<th>Mô tả</th>
						<th>Hình ảnh</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (Xe obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaXe();
							String tenDoiTuong = obj.getLoaiXe();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaXe()%></td>
						<td><%=obj.getTaiXe() != null ? obj.getTaiXe().getHoTen() : ""%></td>
						<td><%=obj.getBienSo()!=null?obj.getBienSo():""%></td>
						<td><%=obj.getLoaiXe()!=null?obj.getLoaiXe():""%></td>
						<td><%=obj.getMoTa()!=null?obj.getMoTa():""%></td>
						<td><%=obj.getHinhAnh()!=null?obj.getHinhAnh():""%></td>	
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
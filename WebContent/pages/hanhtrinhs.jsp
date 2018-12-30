<%@page import="eCore.modelDao.DAO_HanhTrinh"%>
<%@page import="eCore.model.HanhTrinh"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "HanhTrinh";
	String tenTrang = "Quản lý Hành Trình Khách";
	String[] tk_value = { "maHanhTrinh", "noiDi", "noiDen"};
	String[] tk_show = { "Mã Hành Trình", "Nơi Đi", "Nơi Đến"};
	
%>
<%@ include file="../../datxePartial/code-header.jsp"%>
<%
	ObjectDAO<HanhTrinh> dao = new DAO_HanhTrinh();

	ArrayList<HanhTrinh> list = new ArrayList<HanhTrinh>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof HanhTrinh) {
				list = (ArrayList<HanhTrinh>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<HanhTrinh>();
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
						<th>Mã Hành Trình</th>
						<th>Nơi Đi</th>
						<th>Nơi Đến</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (HanhTrinh obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaHanhTrinh();
							String tenDoiTuong = obj.getNoiDi();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaHanhTrinh()%></td>
						
						<td><%=obj.getNoiDi()!=null?obj.getNoiDi():""%></td>
						<td><%=obj.getNoiDen()!=null?obj.getNoiDen():""%></td>
					
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
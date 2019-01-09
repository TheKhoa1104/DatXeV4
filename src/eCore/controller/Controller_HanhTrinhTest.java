package eCore.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import eCore.dao.ObjectDAO;
import eCore.model.HanhTrinhTest;
import eCore.model.QuanTri;
import eCore.modelDao.DAO_HanhTrinhTest;

public class Controller_HanhTrinhTest extends HanhTrinhTest implements ZEController{
ObjectDAO dao = new DAO_HanhTrinhTest();

String timKiemTheo;
String tuKhoa;
String duongDanTrang = "pages/hanhtrinhtests.jsp";
String duongDanTrangView = "pages/luulaihanhtrinhtest.jsp";
String tenCotTimDoiTuong = "maTest";
String maObj;
public String getTimKiemTheo() {
	return timKiemTheo;
}
public void setTimKiemTheo(String timKiemTheo) {
	this.timKiemTheo = timKiemTheo;
}
public String getTuKhoa() {
	return tuKhoa;
}
public void setTuKhoa(String tuKhoa) {
	this.tuKhoa = tuKhoa;
}
public String getTenCotTimDoiTuong() {
	return tenCotTimDoiTuong;
}
public void setTenCotTimDoiTuong(String tenCotTimDoiTuong) {
	this.tenCotTimDoiTuong = tenCotTimDoiTuong;
}
public String getMaObj() {
	return maObj;
}
public void setMaObj(String maObj) {
	this.maObj = maObj;
}
@Override
public String addNew() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	session.setAttribute("mode", "addNew");
	session.setAttribute("p", duongDanTrangView);
	session.setAttribute("msg", null);
	session.setAttribute("obj", null);
	return "SUCCESS";
}
@Override
public String viewDetail() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	String maobj = request.getParameter("maobj");

	session.setAttribute("mode", "viewDetail");

	ArrayList<HanhTrinhTest> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
	if (arr.size() > 0) {
		session.setAttribute("obj", arr.get(0));
		session.setAttribute("p", duongDanTrangView);
		return "SUCCESS";
	} else {
		return "FAIL";
	}
}
@Override
public String viewDetailAndEdit() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	session.setAttribute("msg", null);

	String maobj = request.getParameter("maobj");
	session.setAttribute("mode", "viewDetailAndEdit");
	ArrayList<HanhTrinhTest> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
	if (arr.size() > 0) {
		session.setAttribute("obj", arr.get(0));
		session.setAttribute("p", duongDanTrangView);
		return "SUCCESS";
	} else {
		return "FAIL";
	}
}
@Override
public String saveOrUpdate() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	HanhTrinhTest obj = new HanhTrinhTest();
	obj.maTest = getMaTest();
	obj.noiDi = getNoiDi();
	obj.noiDen = getNoiDen();
	//obj.chiTiet = getChiTiet();
	if (dao.saveOrUpdate(obj)) {
		session.setAttribute("msg", "Cập nhật dữ liệu thành công");
		session.setAttribute("obj", obj);
		session.setAttribute("mode", "viewDetailAndEdit");
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	} else {
		return "FAIL";
	}
}
@Override
public String delete() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	String maobj = request.getParameter("maobj");
	QuanTri obj = (QuanTri) dao.listByColumns("maQuanTri", maobj).get(0);
	obj.setMaQuanTri(maobj);
//	if (obj.getHinhAnh() != null) {
//		myFileName = request.getRealPath("eCore/images/quantris") + "/" + obj.getHinhAnh();
//		System.out.println(myFileName);
//		File destFile = new File(myFolder, myFileName);
//		if (destFile.exists()) {
//			destFile.delete();
//		}
//	}
	if (dao.delete(obj)) {
		session.setAttribute("msg", "Xóa dữ liệu thành công");
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	} else {
		return "FAIL";
	}
}
@Override
public String search() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	String column = getTimKiemTheo();
	String key = getTuKhoa();
	ArrayList<HanhTrinhTest> arr = dao.listByColumnLike(column, key);
	session.setAttribute("arr", arr);
	session.setAttribute("checkTimKiem", "true");
	session.setAttribute("p", duongDanTrang);
	return "SUCCESS";
}
@Override
public String refresh() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	session.setAttribute("arr", null);
	session.setAttribute("msg", null);
	session.setAttribute("checkTimKiem", null);
	session.setAttribute("p", duongDanTrang);
	return "SUCCESS";
}
@Override
public String importData() {
	// TODO Auto-generated method stub
	return null;
}
@Override
public String exportData() throws IOException {
	// TODO Auto-generated method stub
	return null;
}


}

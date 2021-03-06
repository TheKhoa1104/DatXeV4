package eCore.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import eCore.dao.ObjectDAO;
import eCore.model.HanhKhach;
import eCore.model.HanhTrinh;
import eCore.model.TaiXe;
import eCore.model.Xe;
import eCore.modelDao.DAO_HanhKhach;
import eCore.modelDao.DAO_HanhTrinh;

public class Controller_HanhTrinh extends HanhTrinh implements ZEController{
ObjectDAO dao = new DAO_HanhTrinh();

String timKiemTheo;
String tuKhoa;
String duongDanTrang = "pages/hanhtrinhs.jsp";
String duongDanTrangView = "pages/hanhtrinh.jsp";
String tenCotTimDoiTuong = "maHanhTrinh";
String maObj;
String maHanhKhach;

File myFile;
String myFileContentType;
String myFileFileName;
String myFileName;
String myFolder;
public String getTimKiemTheo() {
	return timKiemTheo;
}

public String getMaHanhKhach() {
	return maHanhKhach;
}

public void setMaHanhKhach(String maHanhKhach) {
	this.maHanhKhach = maHanhKhach;
}
public HanhKhach getHanhKhach() {
	ObjectDAO dao_hanhkhach = new DAO_HanhKhach();
	ArrayList<HanhKhach> list_hanhkhach = dao_hanhkhach.listByColumns("maHanhKhach", getMaHanhKhach());
	if (list_hanhkhach.size() > 0)
		return list_hanhkhach.get(0);
	else
		return null;
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
public File getMyFile() {
	return myFile;
}
public void setMyFile(File myFile) {
	this.myFile = myFile;
}
public String getMyFileContentType() {
	return myFileContentType;
}
public void setMyFileContentType(String myFileContentType) {
	this.myFileContentType = myFileContentType;
}
public String getMyFileFileName() {
	return myFileFileName;
}
public void setMyFileFileName(String myFileFileName) {
	this.myFileFileName = myFileFileName;
}
public String getMyFileName() {
	return myFileName;
}
public void setMyFileName(String myFileName) {
	this.myFileName = myFileName;
}
public String getMyFolder() {
	return myFolder;
}
public void setMyFolder(String myFolder) {
	this.myFolder = myFolder;
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

	ArrayList<HanhTrinh> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
	ArrayList<HanhTrinh> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		HanhTrinh obj = new HanhTrinh();
		obj.maHanhTrinh = getMaHanhTrinh();
		obj.hanhKhach = getHanhKhach();
		obj.noiDi = getNoiDi();
		obj.noiDen = getNoiDen();
		obj.thoiGianCapNhat = new Date();
		if (dao.saveOrUpdate(obj)) {
			session.setAttribute("msg", "Cập nhật dữ liệu thành công!");
			session.setAttribute("obj", obj);
			session.setAttribute("mode", "viewDetailAndEdit");
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			session.setAttribute("msg", "Cập nhật dữ liệu thất bại!");
			return "FAIL";
		}
}
@Override
public String delete() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	String maobj = request.getParameter("maobj");
	HanhTrinh obj = new HanhTrinh();
	obj.setMaHanhTrinh(maobj);
	if (dao.delete(obj)) {
		session.setAttribute("msg", "Xóa dữ liệu thành công!");
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
	ArrayList<HanhTrinh> arr = dao.listByColumnLike(column, key);
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

package eCore.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import eCore.dao.ObjectDAO;
import eCore.model.HanhKhach;
import eCore.model.HanhTrinhHanhKhach;
import eCore.modelDao.DAO_HanhKhach;
import eCore.modelDao.DAO_HanhTrinhHanhKhach;
import eCore.util.Util_Date;





public class Controller_HanhTrinhHanhKhach extends HanhTrinhHanhKhach implements ZEController{
	ObjectDAO dao = new DAO_HanhTrinhHanhKhach();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eCore/pages/hanhtrinhhanhkhachs.jsp";
	String duongDanTrangView = "eCore/pages/hanhtrinhhanhkhach.jsp";
	String tenCotTimDoiTuong = "maHanhTrinhHanhKhach";
	String maObj;
	String s_ngayDi;
	String maHanhKhach;
	
	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder;
	/**
	 * 
	 */
	
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
	public String getS_ngayDi() {
		return s_ngayDi;
	}
	public void setS_ngayDi(String s_ngayDi) {
		this.s_ngayDi = s_ngayDi;
	}
	public Date getNgayDi() {
		return Util_Date.stringToDate(getS_ngayDi());
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
		session.setAttribute("mode", "addNew");
		session.setAttribute("p", duongDanTrangView);
		session.setAttribute("msg", null);
		session.setAttribute("obj", null);
		return "SUCCESS";
	}
	@Override
	public String viewDetailAndEdit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("msg", null);

		String maobj = request.getParameter("maobj");
		session.setAttribute("mode", "viewDetailAndEdit");
		ArrayList<HanhTrinhHanhKhach> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		HanhTrinhHanhKhach obj = new HanhTrinhHanhKhach();
		obj.maHanhTrinhHanhKhach = getMaHanhKhach();
		obj.hanhKhach = getHanhKhach();
		obj.noiDi = getNoiDi();
		obj.noiDen = getNoiDen();
		obj.soLuongGhe = getSoLuongGhe();
		obj.ngayDi = getNgayDi();
		obj.thoiGianCapNhat = new Date();
		if (dao.saveOrUpdate(obj)) {
			session.setAttribute("msg", "Cập nhật dữ liệu thành công");
			session.setAttribute("obj", obj);
			session.setAttribute("mode", "viewDetailAndEdit");
			session.setAttribute("p", duongDanTrangView);
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
		HanhTrinhHanhKhach obj = (HanhTrinhHanhKhach) dao.listByColumns("maHanhTrinhHanhKhach", maobj).get(0);
		obj.setMaHanhTrinhHanhKhach(maobj);
		
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
		ArrayList<HanhTrinhHanhKhach> arr = dao.listByColumnLike(column, key);
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

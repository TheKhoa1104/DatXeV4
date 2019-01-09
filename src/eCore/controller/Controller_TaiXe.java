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

import eCore.model.TaiXe;
import eCore.modelDao.DAO_TaiXe;
import eCore.util.Util_Date;

public class Controller_TaiXe extends TaiXe implements ZEController{
	ObjectDAO dao = new DAO_TaiXe();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "pages/taixes.jsp";
	String duongDanTrangView = "pages/taixe.jsp";
	String tenCotTimDoiTuong = "maTaiXe";
	String maObj;
	String s_ngaySinh;
	String s_hinhAnh;
	
	
	
	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder;
	public String getTimKiemTheo() {
		return timKiemTheo;
	}
	
	public String getDuongDanTrang() {
		return duongDanTrang;
	}

	public void setDuongDanTrang(String duongDanTrang) {
		this.duongDanTrang = duongDanTrang;
	}

	public String getDuongDanTrangView() {
		return duongDanTrangView;
	}

	public void setDuongDanTrangView(String duongDanTrangView) {
		this.duongDanTrangView = duongDanTrangView;
	}

	public String getTenCotTimDoiTuong() {
		return tenCotTimDoiTuong;
	}

	public void setTenCotTimDoiTuong(String tenCotTimDoiTuong) {
		this.tenCotTimDoiTuong = tenCotTimDoiTuong;
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
	public String getMaObj() {
		return maObj;
	}
	public void setMaObj(String maObj) {
		this.maObj = maObj;
	}
	public String getS_ngaySinh() {
		return s_ngaySinh;
	}
	public void setS_ngaySinh(String s_ngaySinh) {
		this.s_ngaySinh = s_ngaySinh;
	}
	
	public Date getNgaySinh() {
		return Util_Date.stringToDate(getS_ngaySinh());
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
	
	public String getS_hinhAnh() {
		return s_hinhAnh;
	}

	public void setS_hinhAnh(String s_hinhAnh) {
		this.s_hinhAnh = s_hinhAnh;
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

		ArrayList<TaiXe> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<TaiXe> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		try {
			String s ="";
			if (!myFileName.equals("")) {
				if (myFile != null) {
					myFileName = getMaTaiXe() + myFileFileName.substring(myFileFileName.lastIndexOf("."));
					File destFile = new File(myFolder, myFileName);
					s = destFile + "";
					FileUtils.copyFile(myFile, destFile);
					System.out.println(destFile.toString());
				} else {
					s = getS_hinhAnh();
				}
			} else
				s = getS_hinhAnh();
			TaiXe obj = new TaiXe();
			obj.maTaiXe = getMaTaiXe();
			obj.hoTen = getHoTen();
			obj.hinhAnh = s.substring(s.lastIndexOf("\\") + 1, s.length());
			obj.ngaySinh = getNgaySinh();
			obj.gioiTinh = getGioiTinh();
			obj.noiSinh = getNoiSinh();
			obj.queQuan = getQueQuan();
			obj.danToc = getDanToc();
			obj.tonGiao = getTonGiao();
			obj.diaChi = getDiaChi();
			obj.cMND = getcMND();
			obj.email = getEmail();
			obj.soDienThoaiDiDong = getSoDienThoaiDiDong();
			obj.ghiChu = getGhiChu();
			obj.soTaiKhoan = getSoTaiKhoan();
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
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";
		}

	}
	
	@Override
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maobj = request.getParameter("maobj");
		TaiXe obj = (TaiXe) dao.listByColumns("maTaiXe", maobj).get(0);
		obj.setMaTaiXe(maobj);
		if (obj.getHinhAnh() != null) {
			myFileName = request.getRealPath("eCore/images/nhanviens") + "/" + obj.getHinhAnh();
			System.out.println(myFileName);
			File destFile = new File(myFolder, myFileName);
			if (destFile.exists()) {
				destFile.delete();
			}
		}
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
		ArrayList<TaiXe> arr = dao.listByColumnLike(column, key);
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

package eCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import eCore.dao.ObjectDAO;
import eCore.model.HanhKhach;
import eCore.model.TaiKhoanHanhKhach;
import eCore.modelDao.DAO_HanhKhach;
import eCore.modelDao.DAO_TaiKhoanHanhKhach;
import eCore.util.Util_MD5;
import eCore.model.NhomPhanQuyen;
import eCore.modelDao.DAO_NhomPhanQuyen;


public class Controller_TaiKhoanHanhKhach extends TaiKhoanHanhKhach implements ZEController{
ObjectDAO dao = new DAO_TaiKhoanHanhKhach();

String timKiemTheo;
String tuKhoa;
String duongDanTrang = "pages/taikhoanhanhkhachs.jsp";
String duongDanTrangView = "pages/taikhoanhanhkhach.jsp";
String tenCotTimDoiTuong = "maDangNhap";
String maObj;
String maHanhKhach;
String s_ngayCapNhatMatKhau;
String maNhomPhanQuyen;

String matKhauHienTai;

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

public String getMaHanhKhach() {
	return maHanhKhach;
}

public void setMaHanhKhach(String maHanhKhach) {
	this.maHanhKhach = maHanhKhach;
}
public HanhKhach getHanhKhach() {
	ObjectDAO dao_hanhKhach = new DAO_HanhKhach();
	ArrayList<HanhKhach> list = dao_hanhKhach.listByColumns("maNV", getMaHanhKhach());
	if (list.size() > 0)
		return list.get(0);
	else
		return null;
}
public String getS_ngayCapNhatMatKhau() {
	return s_ngayCapNhatMatKhau;
}

public void setS_ngayCapNhatMatKhau(String s_ngayCapNhatMatKhau) {
	this.s_ngayCapNhatMatKhau = s_ngayCapNhatMatKhau;
}

public String getMaNhomPhanQuyen() {
	return maNhomPhanQuyen;
}

public void setMaNhomPhanQuyen(String maNhomPhanQuyen) {
	this.maNhomPhanQuyen = maNhomPhanQuyen;
}
public NhomPhanQuyen getNhomPhanQuyen() {
	ObjectDAO dao_nhomPhanQuyen = new DAO_NhomPhanQuyen();
	ArrayList<NhomPhanQuyen> list = dao_nhomPhanQuyen.listByColumns("maNhomPhanQuyen", getMaNhomPhanQuyen());
	if (list.size() > 0)
		return list.get(0);
	else
		return null;
}
public String getMatKhauHienTai() {
	return matKhauHienTai;
}

public void setMatKhauHienTai(String matKhauHienTai) {
	this.matKhauHienTai = matKhauHienTai;
}
public String getKiemTraMatKhau() {
	ArrayList<TaiKhoanHanhKhach> list = dao.listByColumns("maDangNhap", getMaDangNhap());
	if (list.size() > 0)
		return list.get(0).getMatKhau();
	else
		return "";
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

	ArrayList<TaiKhoanHanhKhach> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
	ArrayList<TaiKhoanHanhKhach> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
	TaiKhoanHanhKhach obj = new TaiKhoanHanhKhach();
	obj.anhDaiDien = getAnhDaiDien();
	obj.maDangNhap = getMaDangNhap();
	if (!getMatKhau().equals(getKiemTraMatKhau())) {
		obj.matKhau = Util_MD5.md5(getMatKhau());
	} else {
		obj.matKhau = getKiemTraMatKhau();
	}
	obj.ngayTao = getNgayTao();
	obj.ngayCapNhatMatKhau = new Date();
	obj.trangThaiHoatDong = isTrangThaiHoatDong();
	obj.email = getEmail();
	obj.hoVaTen = getHoVaTen();
	obj.moTa = getMoTa();
	obj.ghiChu = getGhiChu();
	obj.thoiGianCapNhat = new Date();
	obj.nhomPhanQuyen = getNhomPhanQuyen();
	obj.hanhKhach = getHanhKhach();
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
	TaiKhoanHanhKhach obj = new TaiKhoanHanhKhach();
	obj.setMaDangNhap(maobj);
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
	ArrayList<TaiKhoanHanhKhach> arr = dao.listByColumnLike(column, key);
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
public String doiMatKhau() {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	String maDangNhap = session.getAttribute("maDangNhap").toString();
	ObjectDAO<TaiKhoanHanhKhach> dao_TaiKhoanNhanVien = new DAO_TaiKhoanHanhKhach();
	ArrayList<TaiKhoanHanhKhach> list_TaiKhoanHanhKhach = dao_TaiKhoanNhanVien.listByColumns("maDangNhap",
			maDangNhap);
	TaiKhoanHanhKhach taiKhoanHanhKhach = list_TaiKhoanHanhKhach.get(0);
	String matKhauHienTai = taiKhoanHanhKhach.getMatKhau();
	if (matKhauHienTai.equals(Util_MD5.md5(getMatKhauHienTai()))) {
		taiKhoanHanhKhach.setMatKhau(Util_MD5.md5(getMatKhau()));
		if (dao.saveOrUpdate(taiKhoanHanhKhach)) {
			session.setAttribute("msg", "Đổi mật khẩu thành công!");
			return "SUCCESS";
		}
	} else {
		session.setAttribute("msg", "Đổi mật khẩu thất bại!");
		return "FAIL";
	}
	return "FAIL";
}

}

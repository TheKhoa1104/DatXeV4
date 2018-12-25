package eCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import eCore.dao.ObjectDAO;
import eCore.model.NhomPhanQuyen;
import eCore.model.QuanTri;
import eCore.model.TaiKhoanQuanTri;
import eCore.model.TaiKhoanTaiXe;
import eCore.model.TaiXe;
import eCore.modelDao.DAO_NhomPhanQuyen;
import eCore.modelDao.DAO_QuanTri;
import eCore.modelDao.DAO_TaiKhoanQuanTri;
import eCore.modelDao.DAO_TaiKhoanTaiXe;
import eCore.modelDao.DAO_TaiXe;
import eCore.util.Util_Date;
import eCore.util.Util_MD5;

public class Controller_TaiKhoanQuanTri extends TaiKhoanQuanTri implements ZEController{
ObjectDAO dao = new DAO_TaiKhoanQuanTri();

String timKiemTheo;
String tuKhoa;
String duongDanTrang = "pages/taikhoanquantris.jsp";
String duongDanTrangView = "pages/taikhoanquantri.jsp";
String tenCotTimDoiTuong = "maDangNhap";
String maObj;
String maQuanTri;
String s_ngayTao;
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

public String getMaObj() {
	return maObj;
}

public void setMaObj(String maObj) {
	this.maObj = maObj;
}

public String getMaQuanTri() {
	return maQuanTri;
}

public void setMaQuanTri(String maQuanTri) {
	this.maQuanTri = maQuanTri;
}

public QuanTri getQuanTri() {
	ObjectDAO dao_quantri = new DAO_QuanTri();
	ArrayList<QuanTri> list = dao_quantri.listByColumns("maQuanTri", getMaQuanTri());
	if (list.size() > 0)
		return list.get(0);
	else
		return null;
}
public String getS_ngayTao() {
	return s_ngayTao;
}

public void setS_ngayTao(String s_ngayTao) {
	this.s_ngayTao = s_ngayTao;
}
public Date getNgayTao() {
	return Util_Date.stringToDate(getS_ngayTao());
}
public String getS_ngayCapNhatMatKhau() {
	return s_ngayCapNhatMatKhau;
}

public void setS_ngayCapNhatMatKhau(String s_ngayCapNhatMatKhau) {
	this.s_ngayCapNhatMatKhau = s_ngayCapNhatMatKhau;
}
public Date getNgayCapNhatMatKhau() {
	return Util_Date.stringToDate(getS_ngayCapNhatMatKhau());
}
public String getMaNhomPhanQuyen() {
	return maNhomPhanQuyen;
}

public void setMaNhomPhanQuyen(String maNhomPhanQuyen) {
	this.maNhomPhanQuyen = maNhomPhanQuyen;
}

public String getMatKhauHienTai() {
	return matKhauHienTai;
}

public void setMatKhauHienTai(String matKhauHienTai) {
	this.matKhauHienTai = matKhauHienTai;
}

public NhomPhanQuyen getNhomPhanQuyen() {
	ObjectDAO dao_nhomPhanQuyen = new DAO_NhomPhanQuyen();
	ArrayList<NhomPhanQuyen> list = dao_nhomPhanQuyen.listByColumns("maNhomPhanQuyen", getMaNhomPhanQuyen());
	if (list.size() > 0)
		return list.get(0);
	else
		return null;
}
public String getKiemTraMatKhau() {
	ArrayList<TaiKhoanQuanTri> list = dao.listByColumns("maDangNhap", getMaDangNhap());
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

	ArrayList<TaiKhoanQuanTri> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
	ArrayList<TaiKhoanQuanTri> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
	TaiKhoanQuanTri obj = new TaiKhoanQuanTri();
	obj.anhDaiDien = getAnhDaiDien();
	obj.maDangNhap = getMaDangNhap();
	if (!getMatKhau().equals(getKiemTraMatKhau())) {
		obj.matKhau = Util_MD5.md5(getMatKhau());
	}else {
		obj.matKhau=getKiemTraMatKhau();
	}
	obj.ngayTao = getNgayTao();
	obj.ngayCapNhatMatKhau = new Date();
	obj.cauHoiBiMat = getCauHoiBiMat();
	obj.traLoiCauHoiBiMat = getTraLoiCauHoiBiMat();
	obj.trangThaiHoatDong = isTrangThaiHoatDong();
	obj.email = getEmail();
	obj.hoVaTen = getHoVaTen();
	obj.moTa = getMoTa();
	obj.ghiChu = getGhiChu();
	obj.thoiGianCapNhat = new Date();
	obj.nhomPhanQuyen = getNhomPhanQuyen();
	obj.quantri = getQuanTri();
	if (dao.saveOrUpdate(obj)) {
		session.setAttribute("msg", "Cập nhật dữ liệu thành công");
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
	TaiKhoanQuanTri obj = new TaiKhoanQuanTri();
	obj.setMaDangNhap(maobj);
	if (dao.delete(obj)) {
		session.setAttribute("msg", "Xóa dữ diệu thành công");
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
	ArrayList<TaiKhoanTaiXe> arr = dao.listByColumnLike(column, key);
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
	ObjectDAO<TaiKhoanQuanTri> dao_TaiKhoanQuanTri = new DAO_TaiKhoanQuanTri();
	ArrayList<TaiKhoanQuanTri> list_TaiKhoanQuanTri = dao_TaiKhoanQuanTri.listByColumns("maDangNhap",
			maDangNhap);
	TaiKhoanQuanTri taiKhoanQuanTri = list_TaiKhoanQuanTri.get(0);
	String matKhauHienTai = taiKhoanQuanTri.getMatKhau();
	if (matKhauHienTai.equals(Util_MD5.md5(getMatKhauHienTai()))) {
		taiKhoanQuanTri.setMatKhau(Util_MD5.md5(getMatKhau()));
		if (dao.saveOrUpdate(taiKhoanQuanTri)) {
			session.setAttribute("msg", "Đổi mật khẩu thành công");
			return "SUCCESS";
		}
	} else {
		session.setAttribute("msg", "Đổi mật khẩu thất bại");
		return "FAIL";
	}
	return "FAIL";
}

}

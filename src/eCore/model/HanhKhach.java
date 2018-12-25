package eCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity	
public class HanhKhach {
@Id
public String maHanhKhach;
public String hoTen;
public String gioiTinh;
public Date ngaySinh;
public String soDienThoaiDiDong;
public String sCMND;
public String diaChi;
public String email;
public Date thoiGianCapNhat;
/**
 * 
 */
public HanhKhach() {
}
/**
 * @param maHanhKhach
 * @param hoTen
 * @param gioiTinh
 * @param ngaySinh
 * @param soDienThoaiDiDong
 * @param sCMND
 * @param diaChi
 * @param email
 * @param thoiGianCapNhat
 */
public HanhKhach(String maHanhKhach, String hoTen, String gioiTinh, Date ngaySinh, String soDienThoaiDiDong,
		String sCMND, String diaChi, String email, Date thoiGianCapNhat) {
	this.maHanhKhach = maHanhKhach;
	this.hoTen = hoTen;
	this.gioiTinh = gioiTinh;
	this.ngaySinh = ngaySinh;
	this.soDienThoaiDiDong = soDienThoaiDiDong;
	this.sCMND = sCMND;
	this.diaChi = diaChi;
	this.email = email;
	this.thoiGianCapNhat = thoiGianCapNhat;
}
public String getMaHanhKhach() {
	return maHanhKhach;
}
public void setMaHanhKhach(String maHanhKhach) {
	this.maHanhKhach = maHanhKhach;
}
public String getHoTen() {
	return hoTen;
}
public void setHoTen(String hoTen) {
	this.hoTen = hoTen;
}
public String getGioiTinh() {
	return gioiTinh;
}
public void setGioiTinh(String gioiTinh) {
	this.gioiTinh = gioiTinh;
}
public Date getNgaySinh() {
	return ngaySinh;
}
public void setNgaySinh(Date ngaySinh) {
	this.ngaySinh = ngaySinh;
}
public String getSoDienThoaiDiDong() {
	return soDienThoaiDiDong;
}
public void setSoDienThoaiDiDong(String soDienThoaiDiDong) {
	this.soDienThoaiDiDong = soDienThoaiDiDong;
}
public String getsCMND() {
	return sCMND;
}
public void setsCMND(String sCMND) {
	this.sCMND = sCMND;
}
public String getDiaChi() {
	return diaChi;
}
public void setDiaChi(String diaChi) {
	this.diaChi = diaChi;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public Date getThoiGianCapNhat() {
	return thoiGianCapNhat;
}
public void setThoiGianCapNhat(Date thoiGianCapNhat) {
	this.thoiGianCapNhat = thoiGianCapNhat;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((diaChi == null) ? 0 : diaChi.hashCode());
	result = prime * result + ((email == null) ? 0 : email.hashCode());
	result = prime * result + ((gioiTinh == null) ? 0 : gioiTinh.hashCode());
	result = prime * result + ((hoTen == null) ? 0 : hoTen.hashCode());
	result = prime * result + ((maHanhKhach == null) ? 0 : maHanhKhach.hashCode());
	result = prime * result + ((ngaySinh == null) ? 0 : ngaySinh.hashCode());
	result = prime * result + ((sCMND == null) ? 0 : sCMND.hashCode());
	result = prime * result + ((soDienThoaiDiDong == null) ? 0 : soDienThoaiDiDong.hashCode());
	result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	HanhKhach other = (HanhKhach) obj;
	if (diaChi == null) {
		if (other.diaChi != null)
			return false;
	} else if (!diaChi.equals(other.diaChi))
		return false;
	if (email == null) {
		if (other.email != null)
			return false;
	} else if (!email.equals(other.email))
		return false;
	if (gioiTinh == null) {
		if (other.gioiTinh != null)
			return false;
	} else if (!gioiTinh.equals(other.gioiTinh))
		return false;
	if (hoTen == null) {
		if (other.hoTen != null)
			return false;
	} else if (!hoTen.equals(other.hoTen))
		return false;
	if (maHanhKhach == null) {
		if (other.maHanhKhach != null)
			return false;
	} else if (!maHanhKhach.equals(other.maHanhKhach))
		return false;
	if (ngaySinh == null) {
		if (other.ngaySinh != null)
			return false;
	} else if (!ngaySinh.equals(other.ngaySinh))
		return false;
	if (sCMND == null) {
		if (other.sCMND != null)
			return false;
	} else if (!sCMND.equals(other.sCMND))
		return false;
	if (soDienThoaiDiDong == null) {
		if (other.soDienThoaiDiDong != null)
			return false;
	} else if (!soDienThoaiDiDong.equals(other.soDienThoaiDiDong))
		return false;
	if (thoiGianCapNhat == null) {
		if (other.thoiGianCapNhat != null)
			return false;
	} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
		return false;
	return true;
}
@Override
public String toString() {
	return "HanhKhach [maHanhKhach=" + maHanhKhach + ", hoTen=" + hoTen + ", gioiTinh=" + gioiTinh + ", ngaySinh="
			+ ngaySinh + ", soDienThoaiDiDong=" + soDienThoaiDiDong + ", sCMND=" + sCMND + ", diaChi=" + diaChi
			+ ", email=" + email + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
}

}

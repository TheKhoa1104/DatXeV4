package eCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class QuanTri  {
	@Id
	public String maQuanTri;
	public String hoTen;
	public String hinhAnh;
	public Date ngaySinh;
	public String gioiTinh;
	public String noiSinh;
	public String queQuan;
	public String danToc;
	public String tonGiao;
	public String diaChi;
	public String cMND;
	public String email;
	public String soDienThoaiDiDong;
	public String ghiChu;
	public String soTaiKhoan;
	public Date thoiGianCapNhat;
	/**
	 * 
	 */
	public QuanTri() {
	}
	/**
	 * @param maQuanTri
	 * @param hoTen
	 * @param hinhAnh
	 * @param ngaySinh
	 * @param gioiTinh
	 * @param noiSinh
	 * @param queQuan
	 * @param danToc
	 * @param tonGiao
	 * @param diaChi
	 * @param cMND
	 * @param email
	 * @param soDienThoaiDiDong
	 * @param ghiChu
	 * @param soTaiKhoan
	 * @param thoiGianCapNhat
	 */
	public QuanTri(String maQuanTri, String hoTen, String hinhAnh, Date ngaySinh, String gioiTinh, String noiSinh,
			String queQuan, String danToc, String tonGiao, String diaChi, String cMND, String email,
			String soDienThoaiDiDong, String ghiChu, String soTaiKhoan, Date thoiGianCapNhat) {
		this.maQuanTri = maQuanTri;
		this.hoTen = hoTen;
		this.hinhAnh = hinhAnh;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.noiSinh = noiSinh;
		this.queQuan = queQuan;
		this.danToc = danToc;
		this.tonGiao = tonGiao;
		this.diaChi = diaChi;
		this.cMND = cMND;
		this.email = email;
		this.soDienThoaiDiDong = soDienThoaiDiDong;
		this.ghiChu = ghiChu;
		this.soTaiKhoan = soTaiKhoan;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}
	public String getMaQuanTri() {
		return maQuanTri;
	}
	public void setMaQuanTri(String maQuanTri) {
		this.maQuanTri = maQuanTri;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getNoiSinh() {
		return noiSinh;
	}
	public void setNoiSinh(String noiSinh) {
		this.noiSinh = noiSinh;
	}
	public String getQueQuan() {
		return queQuan;
	}
	public void setQueQuan(String queQuan) {
		this.queQuan = queQuan;
	}
	public String getDanToc() {
		return danToc;
	}
	public void setDanToc(String danToc) {
		this.danToc = danToc;
	}
	public String getTonGiao() {
		return tonGiao;
	}
	public void setTonGiao(String tonGiao) {
		this.tonGiao = tonGiao;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getcMND() {
		return cMND;
	}
	public void setcMND(String cMND) {
		this.cMND = cMND;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSoDienThoaiDiDong() {
		return soDienThoaiDiDong;
	}
	public void setSoDienThoaiDiDong(String soDienThoaiDiDong) {
		this.soDienThoaiDiDong = soDienThoaiDiDong;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public String getSoTaiKhoan() {
		return soTaiKhoan;
	}
	public void setSoTaiKhoan(String soTaiKhoan) {
		this.soTaiKhoan = soTaiKhoan;
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
		result = prime * result + ((cMND == null) ? 0 : cMND.hashCode());
		result = prime * result + ((danToc == null) ? 0 : danToc.hashCode());
		result = prime * result + ((diaChi == null) ? 0 : diaChi.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((gioiTinh == null) ? 0 : gioiTinh.hashCode());
		result = prime * result + ((hinhAnh == null) ? 0 : hinhAnh.hashCode());
		result = prime * result + ((hoTen == null) ? 0 : hoTen.hashCode());
		result = prime * result + ((maQuanTri == null) ? 0 : maQuanTri.hashCode());
		result = prime * result + ((ngaySinh == null) ? 0 : ngaySinh.hashCode());
		result = prime * result + ((noiSinh == null) ? 0 : noiSinh.hashCode());
		result = prime * result + ((queQuan == null) ? 0 : queQuan.hashCode());
		result = prime * result + ((soDienThoaiDiDong == null) ? 0 : soDienThoaiDiDong.hashCode());
		result = prime * result + ((soTaiKhoan == null) ? 0 : soTaiKhoan.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((tonGiao == null) ? 0 : tonGiao.hashCode());
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
		QuanTri other = (QuanTri) obj;
		if (cMND == null) {
			if (other.cMND != null)
				return false;
		} else if (!cMND.equals(other.cMND))
			return false;
		if (danToc == null) {
			if (other.danToc != null)
				return false;
		} else if (!danToc.equals(other.danToc))
			return false;
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
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (gioiTinh == null) {
			if (other.gioiTinh != null)
				return false;
		} else if (!gioiTinh.equals(other.gioiTinh))
			return false;
		if (hinhAnh == null) {
			if (other.hinhAnh != null)
				return false;
		} else if (!hinhAnh.equals(other.hinhAnh))
			return false;
		if (hoTen == null) {
			if (other.hoTen != null)
				return false;
		} else if (!hoTen.equals(other.hoTen))
			return false;
		if (maQuanTri == null) {
			if (other.maQuanTri != null)
				return false;
		} else if (!maQuanTri.equals(other.maQuanTri))
			return false;
		if (ngaySinh == null) {
			if (other.ngaySinh != null)
				return false;
		} else if (!ngaySinh.equals(other.ngaySinh))
			return false;
		if (noiSinh == null) {
			if (other.noiSinh != null)
				return false;
		} else if (!noiSinh.equals(other.noiSinh))
			return false;
		if (queQuan == null) {
			if (other.queQuan != null)
				return false;
		} else if (!queQuan.equals(other.queQuan))
			return false;
		if (soDienThoaiDiDong == null) {
			if (other.soDienThoaiDiDong != null)
				return false;
		} else if (!soDienThoaiDiDong.equals(other.soDienThoaiDiDong))
			return false;
		if (soTaiKhoan == null) {
			if (other.soTaiKhoan != null)
				return false;
		} else if (!soTaiKhoan.equals(other.soTaiKhoan))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (tonGiao == null) {
			if (other.tonGiao != null)
				return false;
		} else if (!tonGiao.equals(other.tonGiao))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "QuanTri [maQuanTri=" + maQuanTri + ", hoTen=" + hoTen + ", hinhAnh=" + hinhAnh + ", ngaySinh="
				+ ngaySinh + ", gioiTinh=" + gioiTinh + ", noiSinh=" + noiSinh + ", queQuan=" + queQuan + ", danToc="
				+ danToc + ", tonGiao=" + tonGiao + ", diaChi=" + diaChi + ", cMND=" + cMND + ", email=" + email
				+ ", soDienThoaiDiDong=" + soDienThoaiDiDong + ", ghiChu=" + ghiChu + ", soTaiKhoan=" + soTaiKhoan
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}
	
	
	
	
}

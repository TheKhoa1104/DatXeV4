package eCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class HanhTrinhHanhKhach implements Comparable<HanhTrinhHanhKhach>{
	@Id
	public String maHanhTrinhHanhKhach;
	@ManyToOne(fetch = FetchType.EAGER)
	public HanhKhach hanhKhach;
	public String noiDi;
	public String noiDen;
	public String soLuongGhe;
	public Date ngayDi;
	public Date thoiGianCapNhat;
	/**
	 * 
	 */
	public HanhTrinhHanhKhach() {
	}
	/**
	 * @param maHanhTrinhHanhKhach
	 * @param hanhKhach
	 * @param noiDi
	 * @param noiDen
	 * @param soLuongGhe
	 * @param ngayDi
	 * @param thoiGianCapNhat
	 */
	public HanhTrinhHanhKhach(String maHanhTrinhHanhKhach, HanhKhach hanhKhach, String noiDi, String noiDen,
			String soLuongGhe, Date ngayDi, Date thoiGianCapNhat) {
		this.maHanhTrinhHanhKhach = maHanhTrinhHanhKhach;
		this.hanhKhach = hanhKhach;
		this.noiDi = noiDi;
		this.noiDen = noiDen;
		this.soLuongGhe = soLuongGhe;
		this.ngayDi = ngayDi;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}
	public String getMaHanhTrinhHanhKhach() {
		return maHanhTrinhHanhKhach;
	}
	public void setMaHanhTrinhHanhKhach(String maHanhTrinhHanhKhach) {
		this.maHanhTrinhHanhKhach = maHanhTrinhHanhKhach;
	}
	public HanhKhach getHanhKhach() {
		return hanhKhach;
	}
	public void setHanhKhach(HanhKhach hanhKhach) {
		this.hanhKhach = hanhKhach;
	}
	public String getNoiDi() {
		return noiDi;
	}
	public void setNoiDi(String noiDi) {
		this.noiDi = noiDi;
	}
	public String getNoiDen() {
		return noiDen;
	}
	public void setNoiDen(String noiDen) {
		this.noiDen = noiDen;
	}
	public String getSoLuongGhe() {
		return soLuongGhe;
	}
	public void setSoLuongGhe(String soLuongGhe) {
		this.soLuongGhe = soLuongGhe;
	}
	public Date getNgayDi() {
		return ngayDi;
	}
	public void setNgayDi(Date ngayDi) {
		this.ngayDi = ngayDi;
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
		result = prime * result + ((hanhKhach == null) ? 0 : hanhKhach.hashCode());
		result = prime * result + ((maHanhTrinhHanhKhach == null) ? 0 : maHanhTrinhHanhKhach.hashCode());
		result = prime * result + ((ngayDi == null) ? 0 : ngayDi.hashCode());
		result = prime * result + ((noiDen == null) ? 0 : noiDen.hashCode());
		result = prime * result + ((noiDi == null) ? 0 : noiDi.hashCode());
		result = prime * result + ((soLuongGhe == null) ? 0 : soLuongGhe.hashCode());
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
		HanhTrinhHanhKhach other = (HanhTrinhHanhKhach) obj;
		if (hanhKhach == null) {
			if (other.hanhKhach != null)
				return false;
		} else if (!hanhKhach.equals(other.hanhKhach))
			return false;
		if (maHanhTrinhHanhKhach == null) {
			if (other.maHanhTrinhHanhKhach != null)
				return false;
		} else if (!maHanhTrinhHanhKhach.equals(other.maHanhTrinhHanhKhach))
			return false;
		if (ngayDi == null) {
			if (other.ngayDi != null)
				return false;
		} else if (!ngayDi.equals(other.ngayDi))
			return false;
		if (noiDen == null) {
			if (other.noiDen != null)
				return false;
		} else if (!noiDen.equals(other.noiDen))
			return false;
		if (noiDi == null) {
			if (other.noiDi != null)
				return false;
		} else if (!noiDi.equals(other.noiDi))
			return false;
		if (soLuongGhe == null) {
			if (other.soLuongGhe != null)
				return false;
		} else if (!soLuongGhe.equals(other.soLuongGhe))
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
		return "HanhTrinhHanhKhach [maHanhTrinhHanhKhach=" + maHanhTrinhHanhKhach + ", hanhKhach=" + hanhKhach
				+ ", noiDi=" + noiDi + ", noiDen=" + noiDen + ", soLuongGhe=" + soLuongGhe + ", ngayDi=" + ngayDi
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}
	@Override
	public int compareTo(HanhTrinhHanhKhach o) {
		// TODO Auto-generated method stub
		return this.maHanhTrinhHanhKhach.compareTo(o.maHanhTrinhHanhKhach);
	}
	
	
	
	
	
	
	
	
}

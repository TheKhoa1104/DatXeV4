package eCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class HanhTrinh {
	@Id
	public String maHanhTrinh;
	@OneToOne(fetch = FetchType.EAGER)
	public HanhKhach hanhKhach;
	public String noiDi;
	public String noiDen;
	public Date thoiGianCapNhat;
	/**
	 * 
	 */
	public HanhTrinh() {
	}
	/**
	 * @param maHanhTrinh
	 * @param hanhKhach
	 * @param noiDi
	 * @param noiDen
	 * @param thoiGianCapNhat
	 */
	public HanhTrinh(String maHanhTrinh, HanhKhach hanhKhach, String noiDi, String noiDen, Date thoiGianCapNhat) {
		this.maHanhTrinh = maHanhTrinh;
		this.hanhKhach = hanhKhach;
		this.noiDi = noiDi;
		this.noiDen = noiDen;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}
	
	public String getMaHanhTrinh() {
		return maHanhTrinh;
	}
	public void setMaHanhTrinh(String maHanhTrinh) {
		this.maHanhTrinh = maHanhTrinh;
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
		result = prime * result + ((maHanhTrinh == null) ? 0 : maHanhTrinh.hashCode());
		result = prime * result + ((noiDen == null) ? 0 : noiDen.hashCode());
		result = prime * result + ((noiDi == null) ? 0 : noiDi.hashCode());
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
		HanhTrinh other = (HanhTrinh) obj;
		if (hanhKhach == null) {
			if (other.hanhKhach != null)
				return false;
		} else if (!hanhKhach.equals(other.hanhKhach))
			return false;
		if (maHanhTrinh == null) {
			if (other.maHanhTrinh != null)
				return false;
		} else if (!maHanhTrinh.equals(other.maHanhTrinh))
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
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "HanhTrinh [maHanhTrinh=" + maHanhTrinh + ", hanhKhach=" + hanhKhach + ", noiDi=" + noiDi + ", noiDen="
				+ noiDen + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	
	
	
}

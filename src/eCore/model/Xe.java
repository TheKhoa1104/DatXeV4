package eCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Type;

@Entity
public class Xe {
@Id
	public String maXe;
@OneToOne(fetch = FetchType.EAGER)
	public TaiXe taiXe;
	public String bienSo;
	public String loaiXe;
	@Type(type = "text")
	public String moTa;
	public String hinhAnh;
	public Date thoiGianCapNhat;
	/**
	 * 
	 */
	public Xe() {
	}
	/**
	 * @param maXe
	 * @param taiXe
	 * @param bienSo
	 * @param loaiXe
	 * @param moTa
	 * @param hinhAnh
	 * @param thoiGianCapNhat
	 */
	public Xe(String maXe, TaiXe taiXe, String bienSo, String loaiXe, String moTa, String hinhAnh,
			Date thoiGianCapNhat) {
		this.maXe = maXe;
		this.taiXe = taiXe;
		this.bienSo = bienSo;
		this.loaiXe = loaiXe;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}
	public String getMaXe() {
		return maXe;
	}
	public void setMaXe(String maXe) {
		this.maXe = maXe;
	}
	public TaiXe getTaiXe() {
		return taiXe;
	}
	public void setTaiXe(TaiXe taiXe) {
		this.taiXe = taiXe;
	}
	public String getBienSo() {
		return bienSo;
	}
	public void setBienSo(String bienSo) {
		this.bienSo = bienSo;
	}
	public String getLoaiXe() {
		return loaiXe;
	}
	public void setLoaiXe(String loaiXe) {
		this.loaiXe = loaiXe;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
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
		result = prime * result + ((bienSo == null) ? 0 : bienSo.hashCode());
		result = prime * result + ((hinhAnh == null) ? 0 : hinhAnh.hashCode());
		result = prime * result + ((loaiXe == null) ? 0 : loaiXe.hashCode());
		result = prime * result + ((maXe == null) ? 0 : maXe.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((taiXe == null) ? 0 : taiXe.hashCode());
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
		Xe other = (Xe) obj;
		if (bienSo == null) {
			if (other.bienSo != null)
				return false;
		} else if (!bienSo.equals(other.bienSo))
			return false;
		if (hinhAnh == null) {
			if (other.hinhAnh != null)
				return false;
		} else if (!hinhAnh.equals(other.hinhAnh))
			return false;
		if (loaiXe == null) {
			if (other.loaiXe != null)
				return false;
		} else if (!loaiXe.equals(other.loaiXe))
			return false;
		if (maXe == null) {
			if (other.maXe != null)
				return false;
		} else if (!maXe.equals(other.maXe))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (taiXe == null) {
			if (other.taiXe != null)
				return false;
		} else if (!taiXe.equals(other.taiXe))
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
		return "Xe [maXe=" + maXe + ", taiXe=" + taiXe + ", bienSo=" + bienSo + ", loaiXe=" + loaiXe + ", moTa=" + moTa
				+ ", hinhAnh=" + hinhAnh + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}
	
	
	
	
}

package eCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import eCore.model.TaiXe;

@Entity
public class HanhTrinhTaiXe implements Comparable<HanhTrinhTaiXe>{
@Id
	public String maHanhTrinhTaiXe;
	public TaiXe taiXe;
	public String noiDi;
	public String tramDung;
	public String noiDen;
	public String soLuongGhe;
	public Date ngayDi;
	public Date thoiGian;
	public Date thoiGianCapNhat;
	
	
	
	
	/**
	 * 
	 */
	public HanhTrinhTaiXe() {
	}




	/**
	 * @param maHanhTrinhTaiXe
	 * @param taiXe
	 * @param noiDi
	 * @param tramDung
	 * @param noiDen
	 * @param soLuongGhe
	 * @param ngayDi
	 * @param thoiGian
	 * @param thoiGianCapNhat
	 */
	public HanhTrinhTaiXe(String maHanhTrinhTaiXe, TaiXe taiXe, String noiDi, String tramDung, String noiDen,
			String soLuongGhe, Date ngayDi, Date thoiGian, Date thoiGianCapNhat) {
		this.maHanhTrinhTaiXe = maHanhTrinhTaiXe;
		this.taiXe = taiXe;
		this.noiDi = noiDi;
		this.tramDung = tramDung;
		this.noiDen = noiDen;
		this.soLuongGhe = soLuongGhe;
		this.ngayDi = ngayDi;
		this.thoiGian = thoiGian;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}




	public String getMaHanhTrinhTaiXe() {
		return maHanhTrinhTaiXe;
	}




	public void setMaHanhTrinhTaiXe(String maHanhTrinhTaiXe) {
		this.maHanhTrinhTaiXe = maHanhTrinhTaiXe;
	}




	public TaiXe getTaiXe() {
		return taiXe;
	}




	public void setTaiXe(TaiXe taiXe) {
		this.taiXe = taiXe;
	}




	public String getNoiDi() {
		return noiDi;
	}




	public void setNoiDi(String noiDi) {
		this.noiDi = noiDi;
	}




	public String getTramDung() {
		return tramDung;
	}




	public void setTramDung(String tramDung) {
		this.tramDung = tramDung;
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




	public Date getThoiGian() {
		return thoiGian;
	}




	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
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
		result = prime * result + ((maHanhTrinhTaiXe == null) ? 0 : maHanhTrinhTaiXe.hashCode());
		result = prime * result + ((ngayDi == null) ? 0 : ngayDi.hashCode());
		result = prime * result + ((noiDen == null) ? 0 : noiDen.hashCode());
		result = prime * result + ((noiDi == null) ? 0 : noiDi.hashCode());
		result = prime * result + ((soLuongGhe == null) ? 0 : soLuongGhe.hashCode());
		result = prime * result + ((taiXe == null) ? 0 : taiXe.hashCode());
		result = prime * result + ((thoiGian == null) ? 0 : thoiGian.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((tramDung == null) ? 0 : tramDung.hashCode());
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
		HanhTrinhTaiXe other = (HanhTrinhTaiXe) obj;
		if (maHanhTrinhTaiXe == null) {
			if (other.maHanhTrinhTaiXe != null)
				return false;
		} else if (!maHanhTrinhTaiXe.equals(other.maHanhTrinhTaiXe))
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
		if (taiXe == null) {
			if (other.taiXe != null)
				return false;
		} else if (!taiXe.equals(other.taiXe))
			return false;
		if (thoiGian == null) {
			if (other.thoiGian != null)
				return false;
		} else if (!thoiGian.equals(other.thoiGian))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (tramDung == null) {
			if (other.tramDung != null)
				return false;
		} else if (!tramDung.equals(other.tramDung))
			return false;
		return true;
	}




	@Override
	public String toString() {
		return "HanhTrinhTaiXe [maHanhTrinhTaiXe=" + maHanhTrinhTaiXe + ", taiXe=" + taiXe + ", noiDi=" + noiDi
				+ ", tramDung=" + tramDung + ", noiDen=" + noiDen + ", soLuongGhe=" + soLuongGhe + ", ngayDi=" + ngayDi
				+ ", thoiGian=" + thoiGian + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}




	@Override
	public int compareTo(HanhTrinhTaiXe o) {
		// TODO Auto-generated method stub
		return this.maHanhTrinhTaiXe.compareTo(o.maHanhTrinhTaiXe);
	}
	
	
}

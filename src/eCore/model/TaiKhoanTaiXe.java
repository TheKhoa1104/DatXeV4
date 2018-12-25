package eCore.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
@Entity
public class TaiKhoanTaiXe extends TaiKhoan{
	@OneToOne(fetch = FetchType.EAGER)
	public TaiXe taixe;
	
	public TaiKhoanTaiXe() {
	}

	
	public TaiKhoanTaiXe(TaiXe taixe) {
		this.taixe = taixe;
	}


	public TaiXe getTaixe() {
		return taixe;
	}


	public void setTaixe(TaiXe taixe) {
		this.taixe = taixe;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((taixe == null) ? 0 : taixe.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		TaiKhoanTaiXe other = (TaiKhoanTaiXe) obj;
		if (taixe == null) {
			if (other.taixe != null)
				return false;
		} else if (!taixe.equals(other.taixe))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "TaiKhoanTaiXe [taixe=" + taixe + "]";
	}
	
	
}

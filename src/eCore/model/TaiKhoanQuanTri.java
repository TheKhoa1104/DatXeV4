package eCore.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
@Entity
public class TaiKhoanQuanTri extends TaiKhoan{
	@OneToOne(fetch = FetchType.EAGER)
	public QuanTri quantri;

	/**
	 * 
	 */
	public TaiKhoanQuanTri() {
	}

	/**
	 * @param quantri
	 */
	public TaiKhoanQuanTri(QuanTri quantri) {
		this.quantri = quantri;
	}

	public QuanTri getQuantri() {
		return quantri;
	}

	public void setQuantri(QuanTri quantri) {
		this.quantri = quantri;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((quantri == null) ? 0 : quantri.hashCode());
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
		TaiKhoanQuanTri other = (TaiKhoanQuanTri) obj;
		if (quantri == null) {
			if (other.quantri != null)
				return false;
		} else if (!quantri.equals(other.quantri))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TaiKhoanQuanTri [quantri=" + quantri + "]";
	}
	
	
}

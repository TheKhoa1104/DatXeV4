package eCore.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;


@Entity
public class TaiKhoanHanhKhach extends TaiKhoan{
	@OneToOne(fetch = FetchType.EAGER)
	public HanhKhach hanhKhach;

	/**
	 * 
	 */
	public TaiKhoanHanhKhach() {
	}

	/**
	 * @param hanhKhach
	 */
	public TaiKhoanHanhKhach(HanhKhach hanhKhach) {
		this.hanhKhach = hanhKhach;
	}

	public HanhKhach getHanhKhach() {
		return hanhKhach;
	}

	public void setHanhKhach(HanhKhach hanhKhach) {
		this.hanhKhach = hanhKhach;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((hanhKhach == null) ? 0 : hanhKhach.hashCode());
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
		TaiKhoanHanhKhach other = (TaiKhoanHanhKhach) obj;
		if (hanhKhach == null) {
			if (other.hanhKhach != null)
				return false;
		} else if (!hanhKhach.equals(other.hanhKhach))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TaiKhoanHanhKhach [hanhKhach=" + hanhKhach + "]";
	}
	
	
}

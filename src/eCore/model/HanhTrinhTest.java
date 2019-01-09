package eCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Type;

@Entity
public class HanhTrinhTest {
@Id
public String maTest;
public String noiDi;
public String noiDen;
@Type(type = "text")
public String chiTiet;
public Date thoiGianCapNhat;
/**
 * 
 */
public HanhTrinhTest() {
}
/**
 * @param maTest
 * @param noiDi
 * @param noiDen
 * @param chiTiet
 * @param thoiGianCapNhat
 */
public HanhTrinhTest(String maTest, String noiDi, String noiDen, String chiTiet, Date thoiGianCapNhat) {
	this.maTest = maTest;
	this.noiDi = noiDi;
	this.noiDen = noiDen;
	this.chiTiet = chiTiet;
	this.thoiGianCapNhat = thoiGianCapNhat;
}
public String getMaTest() {
	return maTest;
}
public void setMaTest(String maTest) {
	this.maTest = maTest;
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
public String getChiTiet() {
	return chiTiet;
}
public void setChiTiet(String chiTiet) {
	this.chiTiet = chiTiet;
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
	result = prime * result + ((chiTiet == null) ? 0 : chiTiet.hashCode());
	result = prime * result + ((maTest == null) ? 0 : maTest.hashCode());
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
	HanhTrinhTest other = (HanhTrinhTest) obj;
	if (chiTiet == null) {
		if (other.chiTiet != null)
			return false;
	} else if (!chiTiet.equals(other.chiTiet))
		return false;
	if (maTest == null) {
		if (other.maTest != null)
			return false;
	} else if (!maTest.equals(other.maTest))
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
	return "HanhTrinhTest [maTest=" + maTest + ", noiDi=" + noiDi + ", noiDen=" + noiDen + ", chiTiet=" + chiTiet
			+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
}




}

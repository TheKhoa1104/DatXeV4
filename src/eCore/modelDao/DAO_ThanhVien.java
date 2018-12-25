package eCore.modelDao;

import eCore.dao.ObjectDAO;
import eCore.model.ThanhVien;


public class DAO_ThanhVien extends ObjectDAO<ThanhVien> {
	public DAO_ThanhVien() {
		this.table = "ThanhVien";
	}
}

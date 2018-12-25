package eCore.modelDao;

import eCore.dao.ObjectDAO;
import eCore.model.TaiKhoanThanhVien;

public class DAO_TaiKhoanThanhVien extends ObjectDAO<TaiKhoanThanhVien> {
	public DAO_TaiKhoanThanhVien() {
		this.table = "TaiKhoanThanhVien";
	}
}

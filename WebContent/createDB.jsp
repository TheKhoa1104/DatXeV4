<%@page import="eCore.modelDao.DAO_Xe"%>
<%@page import="eCore.model.Xe"%>
<%@page import="eCore.model.TaiKhoanThanhVien"%>
<%@page import="eCore.modelDao.DAO_ThanhVien"%>
<%@page import="eCore.model.ThanhVien"%>
<%@page import="eCore.model.TaiKhoanHanhKhach"%>
<%@page import="eCore.modelDao.DAO_HanhKhach"%>
<%@page import="eCore.model.HanhKhach"%>
<%@page import="eCore.model.TaiKhoanQuanTri"%>
<%@page import="eCore.modelDao.DAO_QuanTri"%>
<%@page import="eCore.model.QuanTri"%>
<%@page import="eCore.modelDao.DAO_TaiXe"%>
<%@page import="eCore.model.TaiXe"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="eCore.modelDao.DAO_ChucNang"%>
<%@page import="eCore.model.ChucNang"%>
<%@page import="eCore.modelDao.DAO_NhomPhanQuyen"%>
<%@page import="eCore.model.NhomPhanQuyen"%>
<%@page import="eCore.util.Util_MD5"%>
<%@page import="eCore.modelDao.DAO_TaiKhoan"%>
<%@page import="eCore.model.TaiKhoanTaiXe"%>
<%@page import="eCore.model.TaiKhoan"%>

<%@page import="eCore.dao.ObjectDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ObjectDAO daochucnang = new DAO_ChucNang();

// 		ChucNang CN_QuanLyThongTinCoBan = new ChucNang();
// 		CN_QuanLyThongTinCoBan.setMaChucNang("CN_QuanLyThongTinCoBan");
// 		CN_QuanLyThongTinCoBan.setDuongDan("");
// 		CN_QuanLyThongTinCoBan.setHinhAnh("fa fa-wrench");
// 		CN_QuanLyThongTinCoBan.setTenHienThi("Thông tin cơ bản");
// 		CN_QuanLyThongTinCoBan.setChucNangCha(null);
// 		daochucnang.saveOrUpdate(CN_QuanLyThongTinCoBan);
		
		ChucNang DatXe = new ChucNang();
		DatXe.setMaChucNang("CN_QuanLyDatChuyen");
		DatXe.setDuongDan("");
		DatXe.setHinhAnh("fa fa-wrench");
		DatXe.setTenHienThi("Đặt chuyến");
		DatXe.setChucNangCha(null);
		daochucnang.saveOrUpdate(DatXe);
		
		ChucNang DatXe1 = new ChucNang();
		DatXe1.setMaChucNang("CN_QuanLyDatChuyenDi");
		DatXe1.setDuongDan("map.jsp");
		DatXe1.setHinhAnh("fa fa-wrench");
		DatXe1.setTenHienThi("Đặt chuyến đi");
		DatXe1.setChucNangCha(DatXe);
		daochucnang.saveOrUpdate(DatXe1);
		



		
		ChucNang CN_QuanLyTaiXe = new ChucNang();
		CN_QuanLyTaiXe.setMaChucNang("CN_QuanLyTaiXe");
		CN_QuanLyTaiXe.setDuongDan("");
		CN_QuanLyTaiXe.setHinhAnh("fa fa-wrench");
		CN_QuanLyTaiXe.setTenHienThi("Quản lý tài xế");
		CN_QuanLyTaiXe.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyTaiXe);
		
		
		ChucNang CN_QuanLyThongTinTaiXe = new ChucNang();
		CN_QuanLyThongTinTaiXe.setMaChucNang("CN_QuanLyThongTinTaiXe");
		CN_QuanLyThongTinTaiXe.setDuongDan("pages/taixes.jsp");
		CN_QuanLyThongTinTaiXe.setHinhAnh("fa fa-list-ol");
		CN_QuanLyThongTinTaiXe.setTenHienThi("Quản lý thông tin tài xế");
		CN_QuanLyThongTinTaiXe.setChucNangCha(CN_QuanLyTaiXe);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinTaiXe);
		
		ChucNang CN_KeKhaiThongTinTaiXe = new ChucNang();
		CN_KeKhaiThongTinTaiXe.setMaChucNang("CN_KeKhaiThongTinTaiXe");
		CN_KeKhaiThongTinTaiXe.setDuongDan("pages/taixe.jsp");
		CN_KeKhaiThongTinTaiXe.setHinhAnh("fa fa-paperclip");
		CN_KeKhaiThongTinTaiXe.setTenHienThi("Kê khai thông tin tài xế");
		CN_KeKhaiThongTinTaiXe.setChucNangCha(CN_QuanLyTaiXe);
		daochucnang.saveOrUpdate(CN_KeKhaiThongTinTaiXe);
		
		
		
		
		ChucNang CN_QuanTri = new ChucNang();
		CN_QuanTri.setMaChucNang("CN_QuanTri");
		CN_QuanTri.setDuongDan("");
		CN_QuanTri.setHinhAnh("fa fa-wrench");
		CN_QuanTri.setTenHienThi("Quản lý tài khoản");
		CN_QuanTri.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanTri);
		
		ChucNang CN_QuanLyThongTinQuanTri = new ChucNang();
		CN_QuanLyThongTinQuanTri.setMaChucNang("CN_QuanLyThongTinQuanTri");
		CN_QuanLyThongTinQuanTri.setDuongDan("pages/quantris.jsp");
		CN_QuanLyThongTinQuanTri.setHinhAnh("fa fa-list-ol");
		CN_QuanLyThongTinQuanTri.setTenHienThi("Quản lý thông tin quản trị");
		CN_QuanLyThongTinQuanTri.setChucNangCha(CN_QuanTri);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinQuanTri);
		
		
		ChucNang CN_KeKhaiThongTinQuanTri = new ChucNang();
		CN_KeKhaiThongTinQuanTri.setMaChucNang("CN_KeKhaiThongTinQuanTri");
		CN_KeKhaiThongTinQuanTri.setDuongDan("pages/quantri.jsp");
		CN_KeKhaiThongTinQuanTri.setHinhAnh("fa fa-paperclip");
		CN_KeKhaiThongTinQuanTri.setTenHienThi("Kê khai thông tin quản trị");
		CN_KeKhaiThongTinQuanTri.setChucNangCha(CN_QuanTri);
		daochucnang.saveOrUpdate(CN_KeKhaiThongTinQuanTri);
		
		
		
		
		
		ChucNang CN_QuanLyHanhKhach = new ChucNang();
		CN_QuanLyHanhKhach.setMaChucNang("CN_QuanLyHanhKhach");
		CN_QuanLyHanhKhach.setDuongDan("");
		CN_QuanLyHanhKhach.setHinhAnh("fa fa-wrench");
		CN_QuanLyHanhKhach.setTenHienThi("Quản lý hành khách");
		CN_QuanLyHanhKhach.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyHanhKhach);
		
		ChucNang CN_QuanLyThongTinHanhKhach = new ChucNang();
		CN_QuanLyThongTinHanhKhach.setMaChucNang("CN_QuanLyThongTinHanhKhach");
		CN_QuanLyThongTinHanhKhach.setDuongDan("pages/hanhkhachs.jsp");
		CN_QuanLyThongTinHanhKhach.setHinhAnh("fa fa-list-ol");
		CN_QuanLyThongTinHanhKhach.setTenHienThi("Quản lý thông tin hành khách");
		CN_QuanLyThongTinHanhKhach.setChucNangCha(CN_QuanLyHanhKhach);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinHanhKhach);
		
		
		ChucNang CN_KeKhaiThongTinHanhKhach = new ChucNang();
		CN_KeKhaiThongTinHanhKhach.setMaChucNang("CN_KeKhaiThongTinHanhKhach");
		CN_KeKhaiThongTinHanhKhach.setDuongDan("pages/hanhkhach.jsp");
		CN_KeKhaiThongTinHanhKhach.setHinhAnh("fa fa-paperclip");
		CN_KeKhaiThongTinHanhKhach.setTenHienThi("Kê khai thông tin Hành khách");
		CN_KeKhaiThongTinHanhKhach.setChucNangCha(CN_QuanLyHanhKhach);
		daochucnang.saveOrUpdate(CN_KeKhaiThongTinHanhKhach);
		
		
		
		
		
		
		
		//quản lý chức năng và tài khoản
		
		ChucNang CN_QuanLyChucNangVaTaiKhoan = new ChucNang();
		CN_QuanLyChucNangVaTaiKhoan.setMaChucNang("eCore_QuanLyChucNangVaTaiKhoan");
		CN_QuanLyChucNangVaTaiKhoan.setDuongDan("null");
		CN_QuanLyChucNangVaTaiKhoan.setHinhAnh("fa fa-filter");
		CN_QuanLyChucNangVaTaiKhoan.setTenHienThi("Chức năng và tài khoản");
		CN_QuanLyChucNangVaTaiKhoan.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyChucNangVaTaiKhoan);
		
		ChucNang CN_QuanLyTaiKhoanTaiXe = new ChucNang();
		CN_QuanLyTaiKhoanTaiXe.setMaChucNang("eCore_CN_QuanLyTaiKhoanTaiXe");
		CN_QuanLyTaiKhoanTaiXe.setDuongDan("eCore/pages/taikhoansinhviens.jsp");
		CN_QuanLyTaiKhoanTaiXe.setHinhAnh("fa fa-users");
		CN_QuanLyTaiKhoanTaiXe.setTenHienThi("Quản lý tài khoản tài xế");
		CN_QuanLyTaiKhoanTaiXe.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyTaiKhoanTaiXe);
		
		
		ChucNang CN_QuanLyTaiKhoanQuanTri = new ChucNang();
		CN_QuanLyTaiKhoanQuanTri.setMaChucNang("eCore_CN_QuanLyTaiKhoanQuanTri");
		CN_QuanLyTaiKhoanQuanTri.setDuongDan("eCore/pages/taikhoanquantris.jsp");
		CN_QuanLyTaiKhoanQuanTri.setHinhAnh("fa fa-users");
		CN_QuanLyTaiKhoanQuanTri.setTenHienThi("Quản lý tài khoản quản trị");
		CN_QuanLyTaiKhoanQuanTri.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyTaiKhoanQuanTri);
		
		ChucNang CN_QuanLyTaiKhoanHanhKhach = new ChucNang();
		CN_QuanLyTaiKhoanHanhKhach.setMaChucNang("eCore_CN_QuanLyTaiKhoanQuanTri");
		CN_QuanLyTaiKhoanHanhKhach.setDuongDan("eCore/pages/taikhoanquantris.jsp");
		CN_QuanLyTaiKhoanHanhKhach.setHinhAnh("fa fa-users");
		CN_QuanLyTaiKhoanHanhKhach.setTenHienThi("Quản lý tài khoản hành khách");
		CN_QuanLyTaiKhoanHanhKhach.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyTaiKhoanHanhKhach);
		
		
		
		
		
		ChucNang CN_QuanLyChucNang = new ChucNang();
		CN_QuanLyChucNang.setMaChucNang("eCore_CN_QuanLyChucNang");
		CN_QuanLyChucNang.setDuongDan("pages/chucnangs.jsp");
		CN_QuanLyChucNang.setHinhAnh("fa fa-share-alt");
		CN_QuanLyChucNang.setTenHienThi("Quản lý chức năng");
		CN_QuanLyChucNang.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyChucNang);
		
		ChucNang CN_QuanLyPhanQuyen = new ChucNang();
		CN_QuanLyPhanQuyen.setMaChucNang("kTXCore_1_3_CN_QuanLyPhanQuyen");
		CN_QuanLyPhanQuyen.setDuongDan("kTXCore/pages/nhomphanquyens.jsp");
		CN_QuanLyPhanQuyen.setHinhAnh("fa fa-shield");
		CN_QuanLyPhanQuyen.setTenHienThi("Quản lý phân quyền");
		CN_QuanLyPhanQuyen.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyPhanQuyen);
		
		
		
		
		
		
		//HanhTrinhHanhKhach
		ChucNang CN_HanhTrinh = new ChucNang();
		CN_HanhTrinh.setMaChucNang("CN_HanhTrinh");
		CN_HanhTrinh.setDuongDan("");
		CN_HanhTrinh.setHinhAnh("fa fa-wrench");
		CN_HanhTrinh.setTenHienThi("Quản lý hành trình");
		CN_HanhTrinh.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_HanhTrinh);
		
		ChucNang CN_HanhTrinhHanhKhach = new ChucNang();
		CN_HanhTrinhHanhKhach.setMaChucNang("CN_HanhTrinhHanhKhach");
		CN_HanhTrinhHanhKhach.setDuongDan("pages/hanhtrinhs.jsp");
		CN_HanhTrinhHanhKhach.setHinhAnh("fa fa-list-ol");
		CN_HanhTrinhHanhKhach.setTenHienThi("Quản lý thông tin hành trình khách");
		CN_HanhTrinhHanhKhach.setChucNangCha(CN_HanhTrinh);
		daochucnang.saveOrUpdate(CN_HanhTrinhHanhKhach);
		
		
		
// 		// quản lý thành viên
// 		ChucNang CN_QuanLyThanhVien = new ChucNang();
// 		CN_QuanLyThanhVien.setMaChucNang("QuanLyThanhVien");
// 		CN_QuanLyThanhVien.setDuongDan("null");
// 		CN_QuanLyThanhVien.setHinhAnh("fa fa-filter");
// 		CN_QuanLyThanhVien.setTenHienThi("Quản lý thành viên");
// 		CN_QuanLyThanhVien.setChucNangCha(null);
// 		daochucnang.saveOrUpdate(CN_QuanLyThanhVien);
		
// 		ChucNang CN_QLThanhVien = new ChucNang();
// 		CN_QLThanhVien.setMaChucNang("QLThanhVien");
// 		CN_QLThanhVien.setDuongDan("pages/thanhviens.jsp");
// 		CN_QLThanhVien.setHinhAnh("fa fa-share-alt");
// 		CN_QLThanhVien.setTenHienThi("Thành viên");
// 		CN_QLThanhVien.setChucNangCha(CN_QuanLyThanhVien);
// 		daochucnang.saveOrUpdate(CN_QLThanhVien);

		//Phan Quyen Cua Tai Xe

		TaiXe tx = new TaiXe();
		tx.setMaTaiXe("001");
		tx.setHoTen("Le Nhat Tung");
		tx.setEmail("tungit07@gmail.com");
		ObjectDAO dao2 = new DAO_TaiXe();
		dao2.saveOrUpdate(tx);

		
		Xe x = new Xe();
		x.setMaXe("001");
		x.setLoaiXe("BMW");
		ObjectDAO dao10 = new DAO_Xe();
		dao10.saveOrUpdate(x);
		
		ChucNang CN_QuanLyXe = new ChucNang();
		CN_QuanLyXe.setMaChucNang("QuanLyXe");
		CN_QuanLyXe.setDuongDan("null");
		CN_QuanLyXe.setHinhAnh("fa fa-filter");
		CN_QuanLyXe.setTenHienThi("Quản lý xe");
		CN_QuanLyXe.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyXe);
		
		ChucNang QLXe = new ChucNang();
		QLXe.setMaChucNang("QLXe");
		QLXe.setDuongDan("pages/xes.jsp");
		QLXe.setHinhAnh("fa fa-share-alt");
		QLXe.setTenHienThi("Quản lý thông tin xe");
		QLXe.setChucNangCha(CN_QuanLyXe);
		daochucnang.saveOrUpdate(QLXe);
		
		
		

		NhomPhanQuyen nhomPhanQuyen1 = new NhomPhanQuyen();
		nhomPhanQuyen1.setMaNhomPhanQuyen("taixe");
		nhomPhanQuyen1.setTenNhomPhanQuyen("Tài Xế");
		Set<ChucNang> cn1 = new HashSet<ChucNang>();
// 		cn1.add(CN_QuanLyThongTinCoBan);
		
		cn1.add(CN_QuanLyTaiXe);
		cn1.add(CN_QuanLyThongTinTaiXe);
		cn1.add(CN_KeKhaiThongTinTaiXe);
		cn1.add(CN_QuanLyXe);
		cn1.add(QLXe);
		nhomPhanQuyen1.setChucNangs(cn1);
		ObjectDAO daonqt = new DAO_NhomPhanQuyen();
		daonqt.saveOrUpdate(nhomPhanQuyen1);

		TaiKhoanTaiXe tk = new TaiKhoanTaiXe();
		tk.setMaDangNhap(tx.getEmail());
		tk.setEmail(tx.getEmail());
		tk.setMatKhau(Util_MD5.md5("123456"));
		tk.setTaixe(tx);
		tk.setNhomPhanQuyen(nhomPhanQuyen1);
		ObjectDAO dao3 = new DAO_TaiKhoan();
		dao3.saveOrUpdate(tk);

		//tai khoan quan tri
		

		

		NhomPhanQuyen nhomPhanQuyen2 = new NhomPhanQuyen();
		nhomPhanQuyen2.setMaNhomPhanQuyen("quantri");
		nhomPhanQuyen2.setTenNhomPhanQuyen("Quản Trị");
		Set<ChucNang> cn2 = new HashSet<ChucNang>();
// 		cn2.add(CN_QuanLyThongTinCoBan);
		cn2.add(CN_QuanLyChucNangVaTaiKhoan);
		cn2.add(CN_QuanLyTaiXe);
		cn2.add(CN_QuanLyThongTinTaiXe);
		cn2.add(CN_QuanLyHanhKhach);
		cn2.add(CN_QuanLyThongTinHanhKhach);
		cn2.add(CN_QuanTri);
		cn2.add(CN_QuanLyThongTinQuanTri);
// 		cn2.add(CN_QuanLyThongTinQuanTri);
// 		cn2.add(CN_KeKhaiThongTinQuanTri);
// 		cn2.add(CN_QuanLyTaiKhoanQuanTri);
// 		cn2.add(CN_QuanLyThongTinTaiXe);
// 		cn2.add(CN_QuanLyThongTinHanhKhach);
		cn2.add(CN_QuanLyChucNang);
		cn2.add(CN_QuanLyPhanQuyen);
		
		
		
		
		cn2.add(CN_QuanLyChucNang);
		nhomPhanQuyen2.setChucNangs(cn2);
		ObjectDAO daoqt = new DAO_NhomPhanQuyen();
		daoqt.saveOrUpdate(nhomPhanQuyen2);

		QuanTri qt = new QuanTri();
		qt.setMaQuanTri("001");
		qt.setHoTen("Phan The Khoa");
		qt.setEmail("bachduong567@gmail.com");
		ObjectDAO dao4 = new DAO_QuanTri();
		dao4.saveOrUpdate(qt);

		TaiKhoanQuanTri tkqt = new TaiKhoanQuanTri();
		tkqt.setMaDangNhap(qt.getEmail());
		tkqt.setEmail(qt.getEmail());
		tkqt.setMatKhau(Util_MD5.md5("123456"));
		tkqt.setQuantri(qt);
		tkqt.setNhomPhanQuyen(nhomPhanQuyen2);
		ObjectDAO dao5 = new DAO_TaiKhoan();
		dao5.saveOrUpdate(tkqt);

		//phan quyen cua hanh khach
		HanhKhach hk = new HanhKhach();
		hk.setMaHanhKhach("001");
		hk.setHoTen("Mai Van Cong");
		hk.setEmail("mvc@gmail.com");
		ObjectDAO dao6 = new DAO_HanhKhach();
		dao2.saveOrUpdate(hk);
		
		
		
		
		
		NhomPhanQuyen nhomPhanQuyen3 = new NhomPhanQuyen();
		nhomPhanQuyen3.setMaNhomPhanQuyen("hanhkhach");
		nhomPhanQuyen3.setTenNhomPhanQuyen("Hành Khách");
		Set<ChucNang> cn3 = new HashSet<ChucNang>();
		cn3.add(CN_QuanLyHanhKhach);
		cn3.add(CN_QuanLyThongTinHanhKhach);
		cn3.add(CN_KeKhaiThongTinHanhKhach);
		cn3.add(DatXe);
		cn3.add(DatXe1);
		cn3.add(CN_HanhTrinh);
		cn3.add(CN_HanhTrinhHanhKhach);
// 		cn3.add(CN_QuanLyThongTinCoBan);
// 		cn3.add(CN_QuanLyThongTinHanhKhach);
// 		cn3.add(CN_KeKhaiThongTinHanhKhach);
		nhomPhanQuyen3.setChucNangs(cn3);
		ObjectDAO daonhk = new DAO_NhomPhanQuyen();
		daonhk.saveOrUpdate(nhomPhanQuyen3);
		
		
		TaiKhoanHanhKhach tkhk = new TaiKhoanHanhKhach();
		tkhk.setMaDangNhap(hk.getEmail());
		tkhk.setEmail(hk.getEmail());
		tkhk.setMatKhau(Util_MD5.md5("123456"));
		tkhk.setHanhKhach(hk);
		tkhk.setNhomPhanQuyen(nhomPhanQuyen3);
		ObjectDAO dao7 = new DAO_TaiKhoan();
		dao7.saveOrUpdate(tkhk);

		
// 		TaiKhoanQuanTri tkqt = new TaiKhoanQuanTri();
// 		tkqt.setMaDangNhap(qt.getEmail());
// 		tkqt.setEmail(qt.getEmail());
// 		tkqt.setMatKhau(Util_MD5.md5("123456"));
// 		tkqt.setQuantri(qt);
// 		tkqt.setNhomPhanQuyen(nhomPhanQuyen2);
// 		ObjectDAO dao5 = new DAO_TaiKhoan();
// 		dao5.saveOrUpdate(tkqt);
		

// ThanhVien tv = new ThanhVien();
// 		tv.setMaTV("TV01");
// 		tv.setTenTV("Nguyen Van Hieu");
// 		tv.setEmail("nguyenhieu225@gmail.com");
// 		ObjectDAO dao8 = new DAO_ThanhVien();
// 		dao8.saveOrUpdate(tv);
		
		
				
// 				ChucNang CN_QLTheThanhVien = new ChucNang();
// 				CN_QLTheThanhVien.setMaChucNang("QLTheThanhVien");
// 				CN_QLTheThanhVien.setDuongDan("pages/thethanhviens.jsp");
// 				CN_QLTheThanhVien.setHinhAnh("fa fa-share-alt");
// 				CN_QLTheThanhVien.setTenHienThi("Thẻ Thành viên");
// 				CN_QLTheThanhVien.setChucNangCha(CN_QuanLyThanhVien);
// 				daochucnang.saveOrUpdate(CN_QLTheThanhVien);
				
// 				ChucNang CN_QuanLyPhieuGiamSatTV = new ChucNang();
// 				CN_QuanLyPhieuGiamSatTV.setMaChucNang("QuanLyPhieuGiamSatTV");
// 				CN_QuanLyPhieuGiamSatTV.setDuongDan("pages/phieugiamsattvs.jsp");
// 				CN_QuanLyPhieuGiamSatTV.setHinhAnh("fa fa-share-alt");
// 				CN_QuanLyPhieuGiamSatTV.setTenHienThi("Phiếu giám sát thành viên");
// 				CN_QuanLyPhieuGiamSatTV.setChucNangCha(CN_QuanLyThanhVien);
// 				daochucnang.saveOrUpdate(CN_QuanLyPhieuGiamSatTV);
				
			//end
			// quản lý nhân viên
			
// 			NhomPhanQuyen nhomPhanQuyentv = new NhomPhanQuyen();
// 		nhomPhanQuyentv.setMaNhomPhanQuyen("thanhvien");
// 		nhomPhanQuyentv.setTenNhomPhanQuyen("Thành viên");
// 		Set<ChucNang> chs4 = new HashSet<ChucNang>();
		
		
// 		chs4.add(CN_QuanLyThanhVien);
// 		chs3.add(CN_QuanLyPhieuGiamSatTV);
		
// 		chs3.add(CN_QuanLyHistory);
// 		chs3.add(CN_QuanLyLichSuTap);
		
// 		nhomPhanQuyentv.setChucNangs(chs4);
// 		ObjectDAO daonpqtv = new DAO_NhomPhanQuyen();
// 		daonpqtv.saveOrUpdate(nhomPhanQuyentv);
		
// 		TaiKhoanThanhVien tktv = new TaiKhoanThanhVien();
// 		tktv.setMaDangNhap(tv.getEmail());
// 		tktv.setEmail(tv.getEmail());
// 		tktv.setMatKhau(Util_MD5.md5("123456"));
// 		tktv.setThanhVien(tv);
// 		tktv.setNhomPhanQuyen(nhomPhanQuyentv);
// 		ObjectDAO daotv = new DAO_TaiKhoan();
// 		daotv.saveOrUpdate(tktv);
		
		
	%>

</body>
</html>
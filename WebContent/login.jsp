<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>DatXe</title>

<!-- Bootstrap Core CSS -->
<link href="content/css_scripts/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="content/css_scripts/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="content/css_scripts/bootstrap/css/sb-admin-2.css"
	rel="stylesheet">

<link
	href="content/css_scripts/bootstrap/css/sbadmin2-sidebar-toggle.css"
	rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link href="content/css_scripts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<%
	String err = request.getSession().getAttribute("err") + "";
	err = err.equals("null") ? "" : err;
%>
<style>
#bg {
	position: fixed;
	top: 0;
	left: 0;
	/* Preserve aspet ratio */
	min-width: 100%;
	min-height: 100%;
	max-height: 100vh;
	max-width: 100vh;
	z-index: -1;
}

</style>
<body>
	<img src="content/images/car	.jpg" id="bg" alt="">
	<div class="container-fluid" style="margin: 0; margin-top: 20;">
		<div class="row" style="padding-top: 30px;">
			<div class="col-xs-4 col-xs-offset-8">
				<div class="login-panel panel panel-default" style="margin: 0px;">
					<div class="panel-heading" style="text-align: center;">
						<p class="panel-title">
							<img src="content/images/logo.png" width="50px" height="50px" /><br />
							ĐỒ ÁN TỐT NGHIỆP <br /> Hệ thống Quản lý đặt xe
						</p>
					</div>
					<div class="panel-body">
						<form role="form" action="dangNhap.action" method="post">
							<fieldset>
								<div class="form-group" style="color: red; text-align: center;"><%=err%></div>
								<div class="form-group">Sử dụng email UTC2</div>
								<div class="form-group">
									<a
										href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/eUSmart3/OAuth2Callback&response_type=code&client_id=604162500762-8cc1fi8t3gkr6ramoch0dm57hrqpomea.apps.googleusercontent.com&approval_prompt=force"
										class="btn btn-danger" style="width: 100%"> <i
										class="fa fa-google-plus"></i> Đăng nhập
									</a>
								</div>
								<div class="form-group">
									<hr />
									Hoặc dùng tài khoản eUSmart
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Tài khoản"
										name="maDangNhap" type="email" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Mật khẩu"
										name="matKhau" type="password" value="">
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<div class="form-group">
									<button type="submit" class="btn  btn-success btn-block">Đăng
										nhập</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<hr />
			<p style="color: white;">
				Bản quyền thuộc UTC2 <br /> Phát triển dự án: Sinh viên Phan Thế Khoa
				& GVHD<br /> Liên hệ kỹ thuật: Sinh viên - Phòng 6D3, CBGV - Phòng
				2D3<br />Địa chỉ: 450, Lê Văn Việt, P. Tăng Nhơn Phú A, Q.9, TP.
				HCM, ĐT: (028).3896.6798
			</p>
			<hr />
		</div>
	</div>
	<!-- jQuery -->
	<script src="content/css_scripts/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="content/css_scripts/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="content/css_scripts/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="content/css_scripts/bootstrap/js/sb-admin-2.js"></script>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#menu-toggle").click(
							function(e) {
								e.preventDefault();

								$("#wrapper").toggleClass("toggled");

								$('#wrapper.toggled').find("#sidebar-wrapper")
										.find(".collapse").collapse('hide');

							});
				});
	</script>
</body>

</html>

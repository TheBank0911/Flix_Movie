<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
.form {
	position: relative;
	display: flex;
	flex-direction: column;
	border-radius: 0.75rem;
	background-color: #fff;
	color: rgb(97, 97, 97);
	box-shadow: 20px 20px 30px rgba(0, 0, 0, .05);
	width: 22rem;
	margin-bottom: 40px;
	background-clip: border-box;
}

.header {
	position: relative;
	background-clip: border-box;
	background-color: #1e88e5;
	background-image: linear-gradient(to top right, #1e88e5, #42a5f5);
	margin: 10px;
	border-radius: 0.75rem;
	overflow: hidden;
	color: #fff;
	box-shadow: 0 0 #0000, 0 0 #0000, 0 0 #0000, 0 0 #0000,
		rgba(33, 150, 243, .4);
	height: 7rem;
	letter-spacing: 0;
	line-height: 1.375;
	font-weight: 600;
	font-size: 1.9rem;
	font-family: Roboto, sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
}

.inputs {
	padding: 1.5rem;
	gap: 1rem;
	display: flex;
	flex-direction: column;
}

.input-container {
	display: flex;
	flex-direction: column;
	gap: 1rem;
	min-width: 200px;
	width: 100%;
	height: 2.75rem;
	position: relative;
}

.input {
	border: 1px solid rgba(128, 128, 128, 0.61);
	outline: 0;
	color: rgb(69, 90, 100);
	font-weight: 400;
	font-size: .9rem;
	line-height: 1.25rem;
	padding: 0.75rem;
	background-color: transparent;
	border-radius: .375rem;
	width: 100%;
	height: 100%;
}

.input:focus {
	border: 1px solid #1e88e5;
}

.checkbox-container {
	display: inline-flex;
	align-items: center;
}

.checkboxt {
	position: relative;
	overflow: hidden;
	padding: .55rem;
	border-radius: 999px;
	display: flex;
	align-items: center;
	cursor: pointer;
	justify-content: center;
	background-color: rgba(0, 0, 0, 0.027);
	height: 35px;
	width: 35px;
}

.checkboxt input {
	width: 100%;
	height: 100%;
	cursor: pointer;
}

.checkbox-text {
	cursor: pointer;
}

.sigin-btn {
	text-transform: uppercase;
	font-weight: 700;
	font-size: .75rem;
	line-height: 1rem;
	text-align: center;
	padding: .75rem 1.5rem;
	background-color: #1e88e5;
	background-image: linear-gradient(to top right, #1e88e5, #42a5f5);
	border-radius: .5rem;
	width: 100%;
	outline: 0;
	border: 0;
	color: #fff;
}

.signup-link {
	line-height: 1.5;
	font-weight: 300;
	font-size: 0.875rem;
	display: flex;
	align-items: center;
	justify-content: center;
}

.signup-link a, .forget {
	line-height: 1.5;
	font-weight: 700;
	font-size: .875rem;
	margin-left: .25rem;
	color: #1e88e5;
}

.forget {
	text-align: right;
	font-weight: 600;
}

body {
	background: lightgray;
}

.container {
	display: flex;
	justify-content: center;
}

.main {
	display: flex;
	justify-content: center;
	padding-bottom:60px;
	margin-bottom: 60px;
}

</style>
<c:url var="url" value="/indexServlet" />

<main>
	<div class="container">
		<form class="form" action="/Flix_Movie/login" method="post"
			style="margin-top: 60px;">
			<div class="header">Đăng nhập</div>
			<c:if
	test="${messagelg=='Vui lòng nhập đầy đủ thông tin!' || messagelg =='Sai mật khẩu!'||messagelg=='Tài khoản không tồn tại!'}">
	<div style="width: 100%; float: right;margin-top: 10px" class="alert alert-danger"
		role="alert">
		<img alt="" src="views/images/cross.png" style="color: red;">
		${messagelg}
	</div>
</c:if>
<c:if test="${messagelg=='Đăng nhập thành công'}">
	<div style="width: 100%; float: right;margin-top: 10px" class="alert alert-success"
		role="alert">
		<img alt="" src="views/images/check.png" style="color: red;">
		${messagelg}
	</div>
</c:if>
			<div class="inputs">
				<input placeholder="Tên đăng nhập" value="${usernamelg}"
					name="usernamelg" class="input" type="text"> <input
					placeholder="Mật khẩu" class="input" value="${passwordlg}"
					name="passwordlg" type="password">
				<div class="checkbox-container">
					<label class="checkbox"> <input type="checkbox"
						name="remember" id="checkbox">
					</label> <label for="checkboxt" class="checkbox-text">Nhớ tôi</label>
				</div>
				<button class="sigin-btn">Đăng nhập</button>
				<a class="forget" href="./indexServlet?action=quenmatkhau">Quên
					mật khẩu ?</a>
				<p class="signup-link">
					Bạn chưa có tài khoản? <a href="./indexServlet?action=dangky">Đăng
						kí</a>
				</p>
			</div>
		</form>
	</div>

</main>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
.form {
	display: flex;
	flex-direction: column;
	gap: 10px;
	max-width: 500px;
	background-color: #fff;
	padding: 20px;
	border-radius: 20px;
	margin-bottom: 70px;
	/* position: relative; */
}

.title {
	font-size: 28px;
	color: royalblue;
	font-weight: 600;
	letter-spacing: -1px;
	position: relative;
	display: flex;
	align-items: center;
	padding-left: 30px;
}

.title::before, .title::after {
	position: absolute;
	content: "";
	height: 16px;
	width: 16px;
	border-radius: 50%;
	left: 0px;
	background-color: royalblue;
}

.title::before {
	width: 18px;
	height: 18px;
	background-color: royalblue;
}

.title::after {
	width: 18px;
	height: 18px;
	animation: pulse 1s linear infinite;
}

.flex {
	display: flex;
	width: 100%;
	gap: 6px;
}

.submit {
	border: none;
	outline: none;
	background-color: rgb(175, 43, 7);
	padding: 10px;
	border-radius: 10px;
	color: #fff;
	font-size: 16px;
	transform: .3s ease;
}

.submit:hover {
	background-color: rgb(157, 29, 29);
}

@
keyframes pulse {from { transform:scale(0.9);
	opacity: 1;
}

to {
	transform: scale(1.8);
	opacity: 0;
}

}

/*  */
.group {
	position: relative;
}

.form .group label {
	font-size: 14px;
	color: rgb(99, 102, 102);
	position: absolute;
	top: -10px;
	left: 10px;
	background-color: #fff;
	transition: all .3s ease;
}

.form .group input {
	padding: 10px;
	border-radius: 5px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	margin-bottom: 20px;
	outline: 0;
	width: 100%;
	background-color: transparent;
}

.form .group input:placeholder-shown+label {
	top: 10px;
	background-color: transparent;
}

.form .group input:focus {
	border-color: #3366cc;
}

.form .group input:focus+label {
	top: -10px;
	left: 10px;
	background-color: #fff;
	color: #3366cc;
	font-weight: 600;
	font-size: 14px;
}

.container {
	display: flex;
	justify-content: center;
	padding-top: 60px;
	
}
</style>
<c:if test="${messagecn=='Lỗi cập nhật tài khoản!'}">
	<div style="width: 400px; float: right; margin-top: 10px"
		class="alert alert-danger" role="alert">
		<img alt="" src="views/images/cross.png" style="color: red;">
		${messagecn}
	</div>
</c:if>
<c:if test="${messagecn=='Cập nhật tài khoản thành công!'}">
	<div style="width: 400px; float: right; margin-top: 10px"
		class="alert alert-success" role="alert">
		<img alt="" src="views/images/check.png" style="color: red;">
		${messagecn}
	</div>
</c:if>
<main style="padding-bottom: 80px">
<div class="container">
	<form class="form" method="post" action="/Flix_Movie/edit_profile">
		<p class="title">Thông tin</p>
		<div class="flex">
			<div class="group">
				<input placeholder="" name="username" value="${user.id}"
					type="text" required="" readonly="readonly"> <label for="name">Tên đăng
					nhập</label>
			</div>

			<div class="group">
				<input placeholder="" name="password" value="${user.password}"
					type="password" readonly="readonly"> <label for="name">Mật
					khẩu</label>
			</div>
		</div>

		<label>
			<div class="group">
				<input placeholder="" name="fullname" value="${user.fullname}"
					type="text" required=""> <label for="name">Họ và
					tên</label>
			</div>
		</label> <label>
			<div class="group">
				<input placeholder="" name="email" value="${user.email}"
					type="text" required=""> <label for="name">Email</label>
			</div>
		</label>

		<button class="submit">Cập nhật</button>
	</form>
</div>

</main>

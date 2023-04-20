<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
.project-tab {
	padding: 10%;
	margin-top: -8%;
}

.project-tab #tabs {
	background: #007b5e;
	color: #eee;
}

.project-tab #tabs h6.section-title {
	color: #eee;
}

.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active
	{
	color: #0062cc;
	background-color: transparent;
	border-color: transparent transparent #f3f3f3;
	border-bottom: 3px solid !important;
	font-size: 16px;
	font-weight: bold;
}

.project-tab .nav-link {
	border: 1px solid transparent;
	border-top-left-radius: 0.25rem;
	border-top-right-radius: 0.25rem;
	color: #0062cc;
	font-size: 16px;
	font-weight: 600;
}

.project-tab .nav-link:hover {
	border: none;
}

.project-tab thead {
	background: #f3f3f3;
	color: #333;
}

.project-tab a {
	text-decoration: none;
	color: #333;
	font-weight: 600;
}

section {
	display: flex;
	justify-content: center;
}

.responsive-table li {
	border-radius: 3px;
	padding: 25px 30px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 25px;
}

.responsive-table .table-header {
	background-color: #95a5a6;
	font-size: 14px;
	text-transform: uppercase;
	letter-spacing: 0.03em;
}

.responsive-table .table-row {
	background-color: #fff;
	box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
}

.responsive-table .col-1 {
	flex-basis: 10%;
}

.responsive-table .col-2 {
	flex-basis: 40%;
}

.responsive-table .col-3 {
	flex-basis: 25%;
}

.responsive-table .col-4 {
	flex-basis: 25%;
}

@media all and (max-width: 767px) {
	.responsive-table .table-header {
		display: none;
	}
	.responsive-table li {
		display: block;
	}
	.responsive-table .col {
		flex-basis: 100%;
	}
	.responsive-table .col {
		display: flex;
		padding: 10px 0;
	}
	.responsive-table .col:before {
		color: #6c7a89;
		width: 200px;
		padding-right: 50px;
		content: attr(data-label);
		flex-basis: 70%;
		text-align: right;
	}
}

/*  */
img {
	max-width: 100%;
	display: block;
}

input {
	appearance: none;
	border-radius: 0;
}

.card {
	margin: 2rem auto;
	display: flex;
	flex-direction: column;
	width: 100%;
	max-width: 425px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 10px 20px 0 rgba(153, 153, 153, .25);
	padding: 0.75rem;
}

.card-image {
	border-radius: 8px;
	overflow: hidden;
	display: flex;
	justify-content: center;
	background-repeat: no-repeat;
	background-size: 150%;
	background-position: 0 5%;
	position: relative;
}

.card-heading {
	position: absolute;
	left: 10%;
	top: 15%;
	right: 10%;
	font-size: 1.75rem;
	font-weight: 700;
	color: #735400;
	line-height: 1.222;
}

.card-heading small {
	display: block;
	font-size: 0.75em;
	font-weight: 400;
	margin-top: 0.25em;
}

.card-form {
	padding: 0 1rem 0 1rem ;
}

.input {
	display: flex;
	flex-direction: column-reverse;
	position: relative;
	padding-top: 1.5rem;
}

.input+.input {
	margin-top: 1.5rem;
}

.input-label {
	color: #8597a3;
	position: absolute;
	top: 1.5rem;
	transition: 0.25s ease;
}

.input-field {
	border: 0;
	z-index: 1;
	background-color: transparent;
	border-bottom: 2px solid #eee;
	font: inherit;
	font-size: 1.125rem;
	padding: 0.25rem 0;
}

.input-field:focus, .input-field:valid {
	outline: 0;
	border-bottom-color: #1f55e8;
}

.input-field:focus+.input-label, .input-field:valid+.input-label {
	color: #6658d3;
	transform: translateY(-1.5rem);
}

.action {
	margin-top: 2rem;
}

.action-button {
	font: inherit;
	font-size: 1.25rem;
	padding: 9px;
	width: 100%;
	font-weight: 500;
	background-color: #1f55e8;
	border-radius: 6px;
	color: #fff;
	border: 0;
}

.action-buttondl:focus {
	outline: 0;
}
.action-buttondl {
	font: inherit;
	font-size: 1.25rem;
	padding: 9px;
	width: 100%;
	font-weight: 500;
	margin-top:10px;
	background-color: red;
	border-radius: 6px;
	color: #fff;
	border: 0;
}

.action-button:focus {
	outline: 0;
}
.card-info {
	padding: 1rem 1rem;
	text-align: center;
	font-size: 0.875rem;
	color: #8597a3;
}

.card-info a {
	display: block;
	color: #6658d3;
	text-decoration: none;
}
</style>

<section id="tabs" class="project-tab"
	style="padding-left: 0; padding-right: 0;">
	<div class="container"
		style="padding: 0; margin-left: 0; margin-right: 0;">
		<div class="row">
			<div class="col-md-12">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#nav-home" role="tab"
							aria-controls="nav-home" aria-selected="true">User Edittion</a> <a
							class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
							href="#nav-profile" role="tab" aria-controls="nav-profile"
							aria-selected="false">User List</a>

					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						
						<div class="card">
							<div class="card-image">
								<img src="views/images/user.png" alt="" width="100px"
									height="100px">

							</div>
							<c:if test="${messageed=='Vui lòng nhập đầy đủ thông tin!'||messageed=='Lỗi cập nhật tài khoản!'||messageed=='Xóa thất bại!'}">
<div style="width: 100%; margin-top: 10px" class="alert alert-danger"
		role="alert">
		 ${messageed}
	</div>
</c:if>
<c:if test="${messageed=='Cập nhật tài khoản thành công!'||messageed=='Xóa thành công!'}">
<div style="width: 100%;margin-top: 10px" class="alert alert-success"
		role="alert">
		 ${messageed}
	</div>
</c:if>
							<form class="card-form"  method="post">
								<div class="input">
									<input type="text" name="id" value="${User.id}" class="input-field" required readonly="readonly"/> <label
										class="input-label">Tên đăng nhập</label>
								</div>
								<div class="input">
									<input type="text" value="${User.fullname}" name="fullname" class="input-field" required />
									<label class="input-label">Họ và tên</label>
								</div>
								<div class="input">
									<input type="text" name="password" value="${User.password}" class="input-field" required />
									<label class="input-label">Mật khẩu </label>
								</div>
								<div class="input">
									<input type="text" name="email" value="${User.email}" class="input-field" required />
									<label class="input-label">Email</label>
								</div>
								<input type="hidden" name="admin" class="input-field" value="${User.admin}" required />
								
									<div class="action">
									<button class="action-button" formaction="/Flix_Movie/edituser">Cập nhật</button>
									<button class="action-buttondl" formaction="/Flix_Movie/delete">Xóa</button>
								</div>
								
							</form>
							
						</div>

					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<form action="" method="post">
						<ul class="responsive-table" style="margin-top: 20px;">
							<li class="table-header">
								<div class="col col-2">Tên đăng nhập</div>
								<div class="col col-3">Họ và tên</div>
								<div class="col col-2">Mật khẩu</div>
								<div class="col col-4">Email</div>
								<div class="col col-1">Edit</div>

							</li>
							<c:forEach var="listuser" items="${listusers}">
								<li class="table-row">
									<div class="col col-2" data-label="Tên đăng nhập">${listuser.id}</div>
									<div class="col col-3" data-label="Họ và tên">${listuser.fullname}</div>
									<div class="col col-2" data-label="Mật khẩu">${listuser.password}</div>
									<div class="col col-4" data-label="Email">${listuser.email}</div>
									<div class="col col-1" data-label="Edit">
										<button class="btn btn-primary" formaction="./Flix_Movie?id=${listuser.id}">Edit</button>
									</div>
								</li>
							</c:forEach>
						</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
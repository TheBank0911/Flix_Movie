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
	color: #d7d0d0;
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
		padding-right: 10px;
		content: attr(data-label);
		flex-basis: 50%;
		text-align: right;
	}
}

.card-header {
	text-align: center;
	background-color: white;
}

/*  */
button {
	display: flex;
	padding: 5px;
	width: 100px;
	align-items: center;
	justify-content: center;
	background-color: #eeeeee4b;
	border-radius: 3px;
	letter-spacing: 1px;
	transition: all 0.2s linear;
	cursor: pointer;
	border: none;
	background: #fff;
}

button:hover {
	box-shadow: 9px 9px 33px #d1d1d1, -9px -9px 33px #ffffff;
	transform: translateY(-2px);
}

main {
	height: 1000px;
}

footer {
	position: static;
}
</style>
<main>
	<section id="tabs" class="project-tab"
		style="padding-left: 0; padding-right: 0">
		<div class="container"
			style="padding: 0; margin-left: 0; margin-right: 0">
			<div class="row">
				<div class="col-md-12">
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<a class="nav-item nav-link ${active1}" id="nav-home-tab"
								data-toggle="tab" href="#nav-home" role="tab"
								aria-controls="nav-home" aria-selected="true">Yêu thích</a> <a
								class="nav-item nav-link ${active2}" id="nav-profile-tab"
								data-toggle="tab" href="#nav-profile" role="tab"
								aria-controls="nav-profile" aria-selected="false">Người yêu
								thích</a> <a class="nav-item nav-link ${active3}"
								id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
								role="tab" aria-controls="nav-contact" aria-selected="false">Chia
								sẻ</a>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show ${active1}" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<ul class="responsive-table"
								style="margin-top: 20px; padding-left: 0;">
								<li class="table-header">
									<div class="col col-3">Title</div>
									<div class="col col-3">Số lượt thích</div>
									<div class="col col-3">Từ ngày</div>
									<div class="col col-3">Đến ngày</div>
								</li>
								<c:forEach var="procfavorite" items="${listProcFavorite}">
								<li class="table-row">
									<div class="col col-3" data-label="Job Id">${procfavorite[0]}</div>
									<div class="col col-3" data-label="Customer Name">${procfavorite[1]}</div>
									<div class="col col-3" data-label="Amount">${procfavorite[2]}</div>
									<div class="col col-3" data-label="Payment Status">${procfavorite[3]}</div>
								</li>
								</c:forEach>
							</ul>
						</div>
						<div class="tab-pane fade show ${active2}" id="nav-profile"
							role="tabpanel" aria-labelledby="nav-profile-tab">
							<form method="post">
								<div class="form-group row"
									style="padding: 0; margin-top: 30px;">
									<div class="col-sm-10">
										<select name="titleUser" id="inputState" class="form-control">
											<c:forEach var="vdlist" items="${videolist}">
												<option value="${vdlist.title}">${vdlist.title}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-2">
										<button formaction="./procuser">
											<span>Search</span>
										</button>
									</div>
							</form>


						</div>
						<ul class="responsive-table"
							style="margin-top: 20px; padding-left: 0;">
							<li class="table-header">
								<div class="col col-3">Tên đăng nhập</div>
								<div class="col col-3">Họ và tên</div>
								<div class="col col-3">Email</div>
								<div class="col col-3">Favorite</div>
							</li>
							<c:forEach var="pVideo" items="${listProcUser}">
								<li class="table-row">
									<div class="col col-3" data-label="Job Id">${pVideo[0]}</div>
									<div class="col col-3" data-label="Customer Name">${pVideo[1]}</div>
									<div class="col col-3" data-label="Amount">${pVideo[2]}</div>
									<div class="col col-3" data-label="Payment Status">${pVideo[3]}</div>

								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="tab-pane fade show ${active3}" id="nav-contact"
						role="tabpanel" aria-labelledby="nav-contact-tab">
						<form method="post">
							<div class="form-group col-sm-12"
								style="padding: 0; margin-top: 30px;">

								

									<div class="form-group row"
										style="padding: 0; margin-top: 30px;">
										<div class="col-sm-10">
											<select name="titlevd" id="inputState" class="form-control">
												<c:forEach var="vdlist" items="${videolist}">
													<option value="${vdlist.title}">${vdlist.title}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-sm-2">
											<button formaction="./procshare">
												<span>Search</span>
											</button>
										</div>
						</form>

					</div>
				</div>
				</select>
				<ul class="responsive-table"
					style="margin-top: 20px; padding-left: 0;">
					<li class="table-header">
						<div class="col col-3">Người chia sẻ</div>
						<div class="col col-3">Email chia sẻ</div>
						<div class="col col-3">Email nhận</div>
						<div class="col col-3">Ngày chia sẻ</div>
					</li>
					<c:forEach var="procshare" items="${listProcShare}">
						<li class="table-row">
							<div class="col col-3" data-label="Job Id">${procshare[0]}</div>
							<div class="col col-3" data-label="Customer Name">${procshare[1]}</div>
							<div class="col col-3" data-label="Amount">${procshare[2]}</div>
							<div class="col col-3" data-label="Payment Status">${procshare[3]}</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		</div>
		
	</section>
</main>

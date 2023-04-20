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

.panel {
	margin: 100px auto 40px;
	max-width: 500px;
	text-align: center;
}

.button_outer {
	background: #83ccd3;
	border-radius: 30px;
	text-align: center;
	height: 50px;
	width: 200px;
	display: inline-block;
	transition: 0.2s;
	position: relative;
	overflow: hidden;
}

.image-upload-one {
	grid-area: img-u-one;
	display: flex;
	justify-content: center;
}

.image-upload-two {
	grid-area: img-u-two;
	display: flex;
	justify-content: center;
}

.image-upload-three {
	grid-area: img-u-three;
	display: flex;
	justify-content: center;
}

.image-upload-four {
	grid-area: img-u-four;
	display: flex;
	justify-content: center;
}

.image-upload-five {
	grid-area: img-u-five;
	display: flex;
	justify-content: center;
}

.image-upload-six {
	grid-area: img-u-six;
	display: flex;
	justify-content: center;
}

.image-upload-container {
	display: grid;
	grid-template-areas:
		'img-u-one img-u-two img-u-three img-u-four img-u-five img-u-six';
}

.center {
	display: inline;
	margin: 3px;
}

.form-input {
	width: 282px;
	padding: 3px;
	border: 2px dashed dodgerblue;
}

.form-input input {
	display: none;
}

.form-input label {
	display: block;
	width: 270px;
	height: auto;
	max-height: 250px;
	border-radius: 10px;
	cursor: pointer;
}

.form-input img {
	width: 270px;
	height: 250px;
	margin: 2px;
}

.imgRemove {
	position: relative;
	bottom: 267px;
	left: 88%;
	background-color: transparent;
	border: none;
	font-size: 30px;
	outline: none;
}

.imgRemove::after {
	content: ' \21BA';
	color: #fff;
	font-weight: 900;
	border-radius: 8px;
	cursor: pointer;
}

.small {
	color: #fff;
}

@media only screen and (max-width: 700px) {
	.image-upload-container {
		grid-template-areas: 'img-u-one img-u-two img-u-three'
			'img-u-four img-u-five img-u-six';
	}
}

/* .container {
      max-width: 1000px;
      margin-left: auto;
      margin-right: auto;
      padding-left: 10px;
      padding-right: 10px;
    } */
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
							aria-controls="nav-home" aria-selected="true">Video Edittion</a>
						<a class="nav-item nav-link" id="nav-profile-tab"
							data-toggle="tab" href="#nav-profile" role="tab"
							aria-controls="nav-profile" aria-selected="false">Video List</a>

					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<form action="" method="post" enctype="multipart/form-data">
							<c:if
								test="${vd=='Vui lòng nhập đầy đủ thông tin!'||vd=='Cập nhật thất bại!'||vd=='Thêm thất bại!'||vd=='Xóa không thành công!'}">
								<div style="width: 100%; margin-top: 10px"
									class="alert alert-danger" role="alert">${vd}</div>
							</c:if>
							<c:if test="${vd=='Cập nhật thành công!'||vd=='Thêm thành công!'||vd=='Xóa thành công!'}">
								<div style="width: 100%; margin-top: 10px"
									class="alert alert-success" role="alert">${vd}</div>
							</c:if>
							<div class="container row">

								<div class="col-sm-4" style="margin-top: 70px;">

									<div class="container row">

										<div class="image-upload-container">
											<div class="image-upload-one">
												<div class="center">
													<div class="form-input">
														<label for="file-ip-1"> <img
															id="file-ip-1-preview"
															src="./views/images/${Video.poster}">
															<button type="button" class="imgRemove"
																onclick="myImgRemove(1)"></button>
														</label> <input type="file" name="img_one" id="file-ip-1"
															accept="image/*" onchange="showPreview(event, 1);">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-8" style="margin-top: 80px">
									<div class="form-group mb-4">
										<label for="inputName">Link</label> <input type="text"
											class="form-control" name="href" id="inputName"
											value="${Video.href}" />
									</div>

									<div class="form-group mb-4">
										<label for="inputName">Tiêu đề</label> <input type="text"
											class="form-control" name="title" id="inputName"
											value="${Video.title}" />
									</div>

									<div class="form-group mb-4">
										<label for="inputName">Lượt xem</label> <input type="text"
											class="form-control" name="views" id="inputName"
											value="${Video.views}" readonly="readonly"/>
									</div>
									<div class="form-check form-check-inline mb-4">
										<input class="form-check-input"
											${Video.active==true?'checked':'' } type="radio"
											id="inlineCheckbox1" name="active" value="true" /> <label
											class="form-check-label" for="inlineCheckbox1">Hoạt
											động</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											id="inlineCheckbox2" name="active"
											${Video.active==false?'checked':'' } value="false" /> <label
											class="form-check-label" for="inlineCheckbox2">Không
											hoạt động</label>
									</div>
								</div>
								<div class="col-sm-12 mb-4">
									<div class="form-group">
										<label for="exampleFormControlTextarea1">Mô tả</label>
										<textarea class="form-control" name="descriptions"
											id="exampleFormControlTextarea1" rows="3">${Video.descriptions}</textarea>
									</div>
									<button class="btn btn-info" formaction="./createvd">Create</button>
									<button  class="btn btn-info" formaction="./updatevd?id=${Video.id}">Update</button>

									<button  class="btn btn-info" formaction="./edit_video">Reset</button>
									<button  class="btn btn-danger" formaction="./deletevd?id=${Video.id}">Delete</button>
								</div>

							</div>
						</form>
					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<form action="" method="post">
							<ul class="responsive-table" style="margin-top: 20px;">
								<li class="table-header">
									<div class="col col-4">Tiêu đề</div>
									<div class="col col-3">Ảnh</div>
									<div class="col col-2">Lượt xem</div>
									<div class="col col-2">Trạng thái</div>

									<div class="col col-1">Sửa</div>
								</li>
								<c:forEach var="list" items="${lists}">
									<li class="table-row">
										<div class="col col-4" data-label="Tiêu đề">${list.title}</div>
										<div class="col col-3" data-label="Ảnh">${list.poster}</div>
										<div class="col col-2" data-label="Lượt xem">${list.views}</div>
										<div class="col col-2" data-label="Trạng thái">${list.active}</div>
										<div class="col col-1" data-label="Chỉnh sửa">
											<button formaction="./edit?id=${list.id} "
												class="btn btn-primary">Edit</button>
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



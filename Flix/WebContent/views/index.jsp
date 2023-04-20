<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="css/index.css" rel="stylesheet">
<link href="css/quanlivideo.css" rel="stylesheet">
<title>Flix Movie</title>
<style type="text/css">
body {
	background-color: #e8eaee;
}
</style>
</head>
<body>
	<jsp:include page="/views/jsp/menu.jsp"></jsp:include>
<c:if
	test="${change=='Vui lòng nhập đầy đủ thông tin!'||change=='Đổi mật khẩu không thành công!'||change=='Mật khẩu hiện tại không đúng!'||change=='Mật khẩu xác nhận không trùng khớp!'}">
	<div style="width: 400px; float: right;" class="alert alert-danger"
		role="alert">
		${change}
	</div>
</c:if>
<c:if test="${change=='Đổi mật khẩu thành công!'}">
	<div style="width: 400px; float: right;" class="alert alert-success"
		role="alert">
		${change}
	</div>
</c:if>

	<main>
		<c:choose>
			<c:when test="${action==null}"><%@include
					file="jsp/trangchu.jsp"%></c:when>
			<c:when test="${action=='logout'}"><%@include
					file="jsp/trangchu.jsp"%></c:when>
			<c:when test="${action=='lienhe'}"><%@include
					file="jsp/lienhe.jsp"%></c:when>
			<c:when test="${action=='dangky'}"><%@include
					file="jsp/dangky.jsp"%></c:when>
			<c:when test="${action=='dangnhap'}"><%@include
					file="jsp/dangnhap.jsp"%></c:when>
			<c:when test="${action=='qlvideo'}"><%@include
					file="jsp/quanlivideo.jsp"%></c:when>
			<c:when test="${action=='thongtin'}"><%@include
					file="jsp/thongtin.jsp"%></c:when>
			<c:when test="${action=='quenmatkhau'}"><%@include
					file="jsp/quenmatkhau.jsp"%></c:when>
			<c:when test="${action=='trangchitiet'}"><%@include
					file="jsp/trangchitiet.jsp"%></c:when>
			<c:when test="${action=='qlnguoidung'}"><%@include
					file="jsp/quanliuser.jsp"%></c:when>
			<c:when test="${action=='doimatkhau'}"><%@include
					file="jsp/doimatkhau.jsp"%></c:when>
			<c:when test="${action=='thongke'}"><%@include
					file="jsp/thongke.jsp"%></c:when>
			<c:when test="${action=='yeuthich'}"><%@include
					file="jsp/yeuthich.jsp"%></c:when>
			<c:when test="${action=='chiase'}"><%@include
					file="jsp/chiase.jsp"%></c:when>

		</c:choose>
	</main>
	<jsp:include page="/views/jsp/footer.jsp"></jsp:include>
	<script>
		var number = 1;
		do {
			function showPreview(event, number) {
				if (event.target.files.length > 0) {
					let src = URL.createObjectURL(event.target.files[0]);
					let preview = document.getElementById("file-ip-" + number
							+ "-preview");
					preview.src = src;
					preview.style.display = "block";
				}
			}
			function myImgRemove(number) {
				document.getElementById("file-ip-" + number + "-preview").src = "https://i.ibb.co/ZVFsg37/default.png";
				document.getElementById("file-ip-" + number).value = null;
			}
			number++;
		} while (number < 5);
	</script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>
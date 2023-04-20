<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#"><img src="views/images/logo2.png" alt="" width="40px" /></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="./indexServlet">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./indexServlet?action=lienhe">Liên hệ</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            Video
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <div>
              <a class="dropdown-item" href="./indexServlet?action=yeuthich">Video đã thích</a>
              <a class="dropdown-item" href="./indexServlet?action=chiase">Video đã chia sẻ</a>
        </li>
         <c:if test="${sessionScope.user.admin==true}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            Quản lí
          </a>
         
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="./indexServlet?action=qlvideo">Quản lí video</a>
            <a class="dropdown-item" href="./indexServlet?action=qlnguoidung">Người dùng</a>
            <a class="dropdown-item" href="./indexServlet?action=thongke">Thống kê</a>
          </div>
        </li>
</c:if>
      </ul>
      <ul class="nav navbar-nav navbar-right" style="margin-right: 68px;">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            <c:if test="${user==null}">
            Tài khoản
            </c:if>
            <c:if test="${user!=null}">
           ${user.fullname}
            </c:if>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <c:if test="${user==null}">
           <div>
              <a class="dropdown-item" href="./indexServlet?action=dangnhap">Đăng nhập</a>
              <a class="dropdown-item" href="./indexServlet?action=dangky">Đăng ký</a>
              <a class="dropdown-item" href="./indexServlet?action=quenmatkhau">Quên mật khẩu</a>
            </div>
          </c:if>
           <c:if test="${user!=null}">
            <div>
              <a class="dropdown-item" href="./indexServlet?action=logout">Đăng xuất</a>
              <a class="dropdown-item" href="./indexServlet?action=thongtin">Thông tin cá nhân</a>
              <a class="dropdown-item" href="./indexServlet?action=doimatkhau">Đổi mật khẩu</a>
            </div>
            </c:if>
          </div>
        </li>
      </ul>
    </div>
  </nav>
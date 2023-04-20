<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
    .form {
      display: flex;
      flex-direction: column;
      gap: 10px;
      width: 400px;
      background-color: #fff;
      border-radius: 20px;
      padding: 30px 20px;
      margin-bottom:40px;
      box-shadow: 100px 100px 80px rgba(0, 0, 0, 0.03)
    }

    .title {
      color: black;
      font-weight: bold;
      text-align: center;
      font-size: 20px;
      margin-bottom: 4px;
    }

    .sub {
      text-align: center;
      color: black;
      font-size: 14px;
      width: 100%;
    }

    .sub.mb {
      margin-bottom: 1px;
    }

    .sub a {
      color: rgb(23, 111, 211);
    }

    .avatar {
      height: 50px;
      width: 50px;
      background-color: rgb(23, 111, 211);
      border-radius: 50%;
      align-self: center;
      padding: 6px;
      cursor: pointer;
      box-shadow: 12.5px 12.5px 10px rgba(0, 0, 0, 0.015), 100px 100px 80px rgba(0, 0, 0, 0.03);
    }

    .form button {
      align-self: flex-end;
    }

    .input,
    button {
      border: none;
      outline: none;
      width: 100%;
      padding: 16px 10px;
      background-color: rgb(247, 243, 243);
      border-radius: 10px;
      box-shadow: 12.5px 12.5px 10px rgba(0, 0, 0, 0.015), 100px 100px 80px rgba(0, 0, 0, 0.03);
    }

    button {
      margin-top: 12px;
      background-color: rgb(23, 111, 211);
      color: #fff;
      text-transform: uppercase;
      font-weight: bold;
    }

    .input:focus {
      border: 1px solid rgb(23, 111, 211);
    }

    #file {
      display: none;
    }

    .fab {
      display: flex;
      justify-content: center;
      align-items: center;
      border: none;
      background: #95cde4;
      height: 40px;
      width: 90px;
    }

    .fab:hover {
      cursor: pointer;
    }

    .fa-twitter {
      color: #8860d0;
    }

    .fa-facebook {
      color: #1775f1;
    }

    .fa-google {
      color: #cb5048;
    }

    body {
      background: lightgray;
    }

    .container {
      display: flex;
      justify-content: center;
      margin-top: 60px
    }
  </style>


  <div class="container">
  
    <form class="form" action="/Flix_Movie/signup" method="post">
      <span class="title">Đăng kí</span>
      <div class="row mx-auto">
        <div class="col-4">
          <i class="fa fa-twitter"></i>
        </div>
        <div class="col-4">
          <i class="fa fa-facebook"></i>
        </div>
        <div class="col-4">
          <i class="fa fa-google"></i>
        </div>
      </div>
      <c:if test="${messagesu=='Vui lòng nhập đầy đủ thông tin!'||messagesu=='Lỗi đăng ký!'}">
<div style="width: 100%; float: right;margin-top: 10px" class="alert alert-danger"
		role="alert">
		<img alt="" src="views/images/cross.png" style="color: red;"> ${messagesu}
	</div>
</c:if>
<c:if test="${messagesu=='Đăng ký thành công!'}">
<div style="width: 100%; float: right;margin-top: 10px" class="alert alert-success"
		role="alert">
		<img alt="" src="views/images/check.png" style="color: red;"> ${messagesu}
	</div>
</c:if>
      <input type="text" class="input" name="id" placeholder="Tên đăng nhập">
       <input type="password" class="input" name="password" placeholder="Mật khẩu">
      <input type="text" class="input" name="fullname" placeholder="Họ và tên">
      <input type="email" class="input" name="email" placeholder="Email">
     
      <input type="hidden" class="input" name="admin" placeholder="admin" value="false">
      <span class="sub">Bạn đã có tài khoản ? <a href="./indexServlet?action=dangnhap">Đăng nhập</a></span>
      <button>Đăng kí</button>
    </form>
  </div>
  
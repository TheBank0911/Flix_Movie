<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    	 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>

        .button {
            display: inline-block;
            padding: 14px 30px;
            text-decoration: none;
            color: #04AA6D;
            letter-spacing: 1.2px;
            font-size: 14px;
            border: 1px solid #04AA6D;
            border-radius: 7px;
            margin-right: 20px;
            transition: 0.15s ease-in-out;
        }
        
        a.focus,
        .button {
            color: white;
            background: #04AA6D;
        }
        
        a.focus:hover,
        .button:hover {
            cursor: pointer;
            color: #1bf1dc;
        }
        
        a.active {
            color: #16f1dc;
            font-weight: 500;
        }
        
        .map {
            position: fixed;
            width: 100vw;
            height: 100vh;
        }
        
        .map:after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: linear-gradient(45deg, rgba(7, 45, 72, 0.8), rgba(195, 195, 195, 0.8));
        }
        
        .content {
            top: 60px;
            height: calc(100vh - 60px);
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: auto;
            padding: 20px 0 20px 0;
        }
        
        .contact {
            width: 80%;
            max-width: 1080px;
            display: flex;
            box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.28);
            border-radius: 5px;
            overflow: hidden;
        }
        
        .other {
            width: 60%;
            background-image: url(/images/AdobeStock_324968258-1024x684.jpeg);
            background-size: cover;
            background-position: center;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
        }
        
        .other:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: linear-gradient(45deg, rgb(36, 51, 66), rgba(36, 51, 66, 0.81));
        }
        
        .form {
            width: 40%;
            background-color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        
        .form h1 {
            text-align: center;
            margin-bottom: 20px;
            width: 100%;
        }
        
        .form form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        
        .flex-rev {
            display: flex;
            flex-direction: column-reverse;
            margin-bottom: 10px;
            width: 100%;
        }
        
        .flex-rev input,
        .flex-rev textarea {
            border: none;
            background-color: #e6e6e6;
            padding: 12px 10px;
            font-size: 16px;
            resize: none;
            margin-top: 7px;
            margin-bottom: 16px;
            border-radius: 5px;
            color: #243342;
            outline-color: #243342;
            outline-width: thin;
            -webkit-appearance: none;
        }
        
        .flex-rev textarea {
            height: 150px;
        }
        
        .button {
            -webkit-appearance: none;
            margin-right: 0;
        }
        
        .info {
            position: relative;
            padding: 20px;
        }
        
        .info h2 {
            color: #16f1dc;
            font-size: 34px;
        }
        
        .info h3 {
            color: white;
            letter-spacing: 1.2px;
            margin-top: 20px;
        }
        
        .svg-wrap {
            display: flex;
            margin-top: 10px;
        }
        
        .svg-wrap a {
            border: 0;
            padding: 0;
            display: flex;
            color: #bbbbbb;
            font-size: 16px;
            justify-content: center;
            align-items: center;
            font-style: italic;
        }
        
        .svg-wrap a:hover {
            background-color: transparent;
            cursor: pointer;
        }
        
        @media screen and (max-width: 900px) {
            .content {
                padding: 10px 0 0;
                display: block;
            }
            .map {
                display: none;
            }
            .contact {
                width: 100%;
                flex-direction: column-reverse;
                border-radius: 0;
                box-shadow: 0px 0px 0px 0px;
            }
            .other {
                width: 100%;
                padding: 20px 0;
            }
            .form {
                width: 100%;
            }
        }
        
        @media screen and (max-height: 660px) {
            .content {
                align-items: flex-start;
            }
        }
    </style>

    <section>
    <c:if test="${lh=='Lỗi!'}">
<div style="width: 400px; float: right; margin-top: 10px" class="alert alert-danger"
		role="alert">
		<img alt="" src="views/images/cross.png" style="color: red;"> ${lh}
	</div>
</c:if>
<c:if test="${lh=='Thành công!'}">
<div style="width: 400px; float: right; margin-top: 10px" class="alert alert-success"
		role="alert">
		<img alt="" src="views/images/check.png" style="color: red;"> ${lh}
	</div>
</c:if>
        <div class="content">
            <div class="contact">
                <div class="other">
                    <div class="info" >
                        <h2>Liên hệ</h2>
                        <h3><a href="#"><i class="fa fa-envelope-o fa-2x"></i></a></h3>
                        <div class="svg-wrap">
                            <a href="mailto:connor@connorgaunt.com">
                  lebichvicm2020@gmail.com</a>
                        </div>
                        <h3><a href="#"><i class="fa fa-map-marker fa-2x"></i></a></h3>
                        <div class="svg-wrap">
                            <a href="mailto:connor@connorgaunt.com">
                                288 Đ. Nguyễn Văn Linh, Phường An Khánh, Ninh Kiều, Cần Thơ</a>
                        </div>
                        <h3><a href="#"><i class="fa fa-phone-square fa-2x"></i></a></h3>
                        <div class="svg-wrap">
                            <a href="mailto:connor@connorgaunt.com">
                  + 0857255723</a>
                        </div>
                    </div>
                </div>
                <div class="form" onsubmit="reset(); return false;">
                    <h1>Hỗ trợ</h1>
                    <form method="post" action="/Flix_Movie/support">
                        <div class="flex-rev">
                            <input type="text" placeholder="Nhập họ tên của bạn...." name="fullname" id="name" />
                            <label id="name" for="name">Họ và tên</label>
                        </div>
                        <div class="flex-rev">
                            <input type="email" placeholder="connor@connorgaunt.com" name="email" id="email" />
                            <label id="email" for="email">Email</label>
                        </div>
    
                        <div class="flex-rev">
                            <textarea id="message" placeholder="Lời nhắn..." name="body" id="message" /></textarea>
                            <label for="message">Góp ý</label>
                        </div>
                        <button id="btn" class="button">Gửi</button>
                    </form>
                  
                </div>
            </div>
        </div>
    </section>
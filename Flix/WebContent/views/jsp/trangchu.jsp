<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<style>
 /*  */
     .banner {
      margin-bottom: 20px;
      margin-top: 10px;
      display: flex;
      justify-content: center;
    }

    /*  */
    article {
      width: 100%;
      justify-content: center;
      padding-top: 5px;
      padding-bottom: 20px;
    }

    /*  */
    .button {
      --primary-color: #2550eb;
      --secondary-color: #fff;
      --hover-color: #111;
      --arrow-width: 10px;
      --arrow-stroke: 2px;
      box-sizing: border-box;
      border: 0;
      border-radius: 20px;
      color: var(--secondary-color);
      padding: 1em 1.8em;
      background: var(--primary-color);
      display: flex;
      transition: 0.2s background;
      align-items: center;
      gap: 0.6em;
      font-weight: bold;
    }

    .button .arrow-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .button .arrow {
      margin-top: 1px;
      width: var(--arrow-width);
      background: var(--primary-color);
      height: var(--arrow-stroke);
      position: relative;
      transition: 0.2s;
    }

    .button .arrow::before {
      content: "";
      box-sizing: border-box;
      position: absolute;
      border: solid var(--secondary-color);
      border-width: 0 var(--arrow-stroke) var(--arrow-stroke) 0;
      display: inline-block;
      top: -3px;
      right: 3px;
      transition: 0.2s;
      padding: 3px;
      transform: rotate(-45deg);
    }

    .button:hover {
      background-color: var(--hover-color);
    }

    .button:hover .arrow {
      background: var(--secondary-color);
    }

    .button:hover .arrow:before {
      right: 0;
    }

    /* card */
    .card {
      max-width: 400px;
      border-radius: 0.5rem;
      background-color: #fff;
      box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
      border: 1px solid transparent;
    }

    .content {
      padding: 1.1rem;
    }

    .image {
      object-fit: cover;
      width: 100%;
      height: 150px;
      background-color: rgb(239, 205, 255);
    }

    .title {
      color: #111827;
      font-size: 1.125rem;
      line-height: 1.75rem;
      font-weight: 600;
    }

    .desc {
      margin-top: 0.5rem;
      color: #6B7280;
      font-size: 0.875rem;
      line-height: 1.25rem;
    }

    .action {
      display: inline-flex;
      margin-top: 1rem;
      color: #ffffff;
      font-size: 0.875rem;
      line-height: 1.25rem;
      font-weight: 500;
      align-items: center;
      gap: 0.25rem;
      background-color: #2563EB;
      padding: 4px 8px;
      border-radius: 4px;
    }

    .action span {
      transition: .3s ease;
    }

    .action:hover span {
      transform: translateX(4px);

    }

    /*  */
    body {

      background-color: #e8eaee;
    }

    /* button */
    .btnn {
      margin-left: 15px;
      width: 140px;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: space-evenly;
      text-transform: uppercase;
      letter-spacing: 1px;
      border: none;
      position: relative;
      background-color: transparent;
      transition: .2s cubic-bezier(0.19, 1, 0.22, 1);
      opacity: 0.6;

    }

    .btnn::after {
      content: '';
      border-bottom: 3px double rgb(55, 57, 57);
      width: 0;
      height: 100%;
      position: absolute;
      margin-top: -5px;
      top: 0;
      left: 5px;
      visibility: hidden;
      opacity: 1;
      transition: .2s linear;
    }

    .btnn .icon {
      transform: translateX(0%);
      transition: .2s linear;
      animation: attention 1.2s linear infinite;
    }

    .btnn:hover::after {
      visibility: visible;
      opacity: 0.7;
      width: 90%;

    }

    .btnn:hover {
      letter-spacing: 2px;
      opacity: 1;
      outline: none;
    }

    .btnn:hover>.icon {
      transform: translateX(30%);
      animation: none;

    }

    @keyframes attention {
      0% {
        transform: translateX(0%);

      }

      50% {
        transform: translateX(30%);

      }
    }

    /* button */
    button {
      position: relative;
      display: inline-block;
      cursor: pointer;
      outline: none;
      border: 0;
      vertical-align: middle;
      text-decoration: none;
      background: transparent;
      padding: 0;
      font-size: inherit;
      font-family: inherit;

    }

    button.learn-more {
      width: 12rem;
      height: auto;
      outline: none;
    }

    button.learn-more .circle {
      transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
      position: relative;
      display: block;
      margin: 0;
      width: 3rem;
      height: 3rem;
      background: #898cae;
      border-radius: 1.625rem;

    }

    button.learn-more .circle .icon {
      transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
      position: absolute;
      top: 0;
      bottom: 0;
      margin: auto;
      background: #fff;

    }

    button.learn-more .circle .icon.arrow {
      transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
      left: 0.625rem;
      width: 1.125rem;
      height: 0.125rem;
      background: none;
    }

    button.learn-more .circle .icon.arrow::before {
      position: absolute;
      content: "";
      top: -0.29rem;
      right: 0.0625rem;
      width: 0.625rem;
      height: 0.625rem;
      border-top: 0.125rem solid #fff;
      border-right: 0.125rem solid #fff;
      transform: rotate(45deg);
    }

    button.learn-more .button-text {
      transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      padding: 0.75rem 0;
      margin: 0 0 0 1.85rem;
      color: #282936;
      font-weight: 700;
      line-height: 1.6;
      text-align: center;
      text-transform: uppercase;
    }

    button:hover .circle {
      width: 100%;

    }

    button:hover .circle .icon.arrow {
      background: #fff;
      transform: translate(1rem, 0);

    }

    button:hover .button-text {
      color: #fff;

    }

    /* search */
    .wave-group {
      position: relative;
    }

    .wave-group .input {
      font-size: 16px;
      padding: 10px 10px 10px 5px;
      display: block;
      width: 400px;
      border: none;
      border-bottom: 1px solid #515151;
      background: transparent;
    }

    .wave-group .input:focus {
      outline: none;
    }

    .wave-group .label {
      color: #999;
      font-size: 18px;
      font-weight: normal;
      position: absolute;
      pointer-events: none;
      left: 5px;
      top: 10px;
      display: flex;
    }

    .wave-group .label-char {
      transition: 0.2s ease all;
      transition-delay: calc(var(--index) * .05s);
    }

    .wave-group .input:focus~label .label-char,
    .wave-group .input:valid~label .label-char {
      transform: translateY(-20px);
      font-size: 14px;
      color: #505052;
    }

    .wave-group .bar {
      position: relative;
      display: block;
      width: 200px;
    }

    .wave-group .bar:before,
    .wave-group .bar:after {
      content: '';
      height: 2px;
      width: 0;
      bottom: 1px;
      position: absolute;
      background: #505052;
      transition: 0.2s ease all;
      -moz-transition: 0.2s ease all;
      -webkit-transition: 0.2s ease all;
    }

    .wave-group .bar:before {
      left: 100%;
    }

    .wave-group .bar:after {
      right: 0;
    }

    .wave-group .input:focus~.bar:before,
    .wave-group .input:focus~.bar:after {
      width: 100%;
    }

    /*  */
    .list {
      margin-left: 15px;
      margin-top: 25px;
      margin-bottom: 10px;
    }

    .listvd {
      width: 140px;
      height: 45px;
      font-size: 23px;
      border: none;
      outline: none;
      background: transparent;
      color: black;
      font-family: 'Times New Roman', Times, serif;
      font-weight: 700;
      /* position: relative; */
      transition: all 0.5s;
      z-index: 1;
    }

    .labell::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 5px;
      height: 100%;
      background-color: black;
      z-index: -1;
      transition: all 0.5s;
    }

    /* different */
    .different {
      margin-left: 15px;
      margin-top: 15px;
      margin-bottom: 10px;
      
    }
</style>
	 <div class="banner">
      <div class="wave-group">
        <input required="" type="text" class="input">
        <span class="bar"></span>
        <label class="label">
          <span class="label-char" style="--index: 0">S</span>
          <span class="label-char" style="--index: 1">e</span>
          <span class="label-char" style="--index: 2">a</span>
          <span class="label-char" style="--index: 3">r</span>
          <span class="label-char" style="--index: 4">c</span>
          <span class="label-char" style="--index: 5">h</span>

        </label>
      </div>

    </div>
    <div class="list"> <button class="listvd"><label class="labell" style="margin-bottom: 0;">Phổ biến</label>

    </div>
    <div class="row" style="width: 100%">
    <c:forEach var="list" items="${lists}">
    <div class="col-sm-3">
    <div class="card" style="height: 450px;margin-bottom: 20px">
    <img class="card-img-top" src="views/images/${list.poster}" alt="Card image" height="225px">
    <div class="card-body">
      <h4 class="card-title">${list.title}</h4>
      <c:if test="${user!=null}">
       <button class="learn-more" style="position: absolute; bottom: 15px;">
            <span class="circle" aria-hidden="true">
              <span class="icon arrow"></span>
            </span>
            
           <a  href="./indexServlet?action=trangchitiet&idvideo=${list.id}" style="text-decoration: none;"> <span class="button-text " >Xem ngay </span></a>
          </button>
      </c:if>
      
    </div>
    </div>
    </div>
    </c:forEach>
    </div>
   
    <button class="btnn" data-toggle="collapse" data-target="#demo">
      Xem thêm <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" height="15px" width="15px"
        class="icon">
        <path stroke-linejoin="round" stroke-linecap="round" stroke-miterlimit="10" stroke-width="1.5" stroke="#292D32"
          d="M8.91016 19.9201L15.4302 13.4001C16.2002 12.6301 16.2002 11.3701 15.4302 10.6001L8.91016 4.08008"></path>
      </svg>
    </button>
    <div id="demo" class="collapse">
   <div class="row" style="width: 100%;margin-top: 20px;">
    <c:forEach var="list" items="${lists}">
    <div class="col-sm-3">
    <div class="card" style="height: 450px;margin-bottom: 20px">
    <img class="card-img-top" src="views/images/${list.poster}" alt="Card image" height="225px">
    <div class="card-body">
      <h4 class="card-title">${list.title}</h4>
     <c:if test="${user!=null}">
       <button class="learn-more" style="position: absolute; bottom: 15px;">
            <span class="circle" aria-hidden="true">
              <span class="icon arrow"></span>
            </span>
            
           <a  href="./indexServlet?action=trangchitiet&idvideo=${list.id}" style="text-decoration: none;"> <span class="button-text " >Xem ngay </span></a>
          </button>
      </c:if>
    </div>
    </div>
    </div>
    </c:forEach>
    </div>
    </div>
    <div class="different">
      <button class="listvd" style="margin-bottom: 10px"><label class="labell" style="margin-bottom: 0;margin-left: 22px;"> Video khác</label>
      </button>
      <div class="row" style="width: 100%">
    <c:forEach var="list" items="${lists}">
    <div class="col-sm-3">
    <div class="card" style="height: 450px;margin-bottom: 20px">
    <img class="card-img-top" src="views/images/${list.poster}" alt="Card image" height="225px">
    <div class="card-body">
      <h4 class="card-title">${list.title}</h4>
      <c:if test="${user!=null}">
       <button class="learn-more" style="position: absolute; bottom: 15px;">
            <span class="circle" aria-hidden="true">
              <span class="icon arrow"></span>
            </span>
            
           <a  href="./indexServlet?action=trangchitiet&idvideo=${list.id}" style="text-decoration: none;"> <span class="button-text " >Xem ngay </span></a>
          </button>
      </c:if>
    </div>
    </div>
    </div>
    </c:forEach>
    </div>
    </div>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
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
      padding: 2rem 1rem 0;
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

    .input-field:focus,
    .input-field:valid {
      outline: 0;
      border-bottom-color: #1f55e8;
    }

    .input-field:focus+.input-label,
    .input-field:valid+.input-label {
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


  
 <div class="card" style="margin-top: 80px">
    <div class="card-image">
      <img src="views/images/change-password-icon.png" alt="" width="100px" height="100px">

    </div>
    <form class="card-form" method="post">
      <div class="input">
        <input type="text" name="passold" class="input-field" required />
        <label class="input-label">Mật khẩu hiện tại</label>
      </div>
      <div class="input">
        <input type="text" name="passnew" class="input-field" required />
        <label class="input-label">Mật khẩu mới</label>
      </div>
      <div class="input">
        <input type="text" name="passconfirm" class="input-field" required />
        <label class="input-label">Xác nhận mật khẩu mới</label>
      </div>
      <div class="action">
        <button class="action-button" formaction="./change">Lưu</button>
      </div>
    </form>
  </div>


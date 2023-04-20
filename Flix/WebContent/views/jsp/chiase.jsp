<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
/*  */
main {
	width: 100%;
	
	justify-content: center;
	padding-top: 5px;
	padding-bottom: 20px;
	position: relative;
}

/*  */
.button { -
	-primary-color: #2550eb; -
	-secondary-color: #fff; -
	-hover-color: #111; -
	-arrow-width: 10px; -
	-arrow-stroke: 2px;
	box-sizing: border-box;
	border: 0;
	border-radius: 20px;
	color: var(- -secondary-color);
	padding: 1em 1.8em;
	background: var(- -primary-color);
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
	width: var(- -arrow-width);
	background: var(- -primary-color);
	height: var(- -arrow-stroke);
	position: relative;
	transition: 0.2s;
}

.button .arrow::before {
	content: "";
	box-sizing: border-box;
	position: absolute;
	border: solid var(- -secondary-color);
	border-width: 0 var(- -arrow-stroke) var(- -arrow-stroke) 0;
	display: inline-block;
	top: -3px;
	right: 3px;
	transition: 0.2s;
	padding: 3px;
	transform: rotate(-45deg);
}

.button:hover {
	background-color: var(- -hover-color);
}

.button:hover .arrow {
	background: var(- -secondary-color);
}

.button:hover .arrow:before {
	right: 0;
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

@
keyframes attention { 0% {
	transform: translateX(0%);
}

50
%
{
transform
:
translateX(
30%
);
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
	color: rgb(225, 45, 45);
}

footer {
	margin-top: 20px;
}
footer{
      position: static;
      }
</style>
<main style="height: 1000px">
	<div class="content">
		<div class="list">
			<button class="listvd">
				<label class="labell" style="margin-bottom: 0;">Video chia
					sẻ</label>
		</div>

		<div class="row" style="width: 100%">
			<c:forEach var="listshare" items="${listshares}">
				<div class="col-sm-3">
					<div class="card" style="height: 400px; margin-bottom: 10px">
						<img class="card-img-top"
							src="views/images/${listshare.video.poster}" alt="Card image"
							height="225px">
						<div class="card-body">
							<h4 class="card-title">${listshare.video.title}</h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>



		</div>

		</div>
	</div>


</main>
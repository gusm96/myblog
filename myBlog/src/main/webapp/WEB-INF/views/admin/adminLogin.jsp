<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>

<style>
html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>

</head>
<body class="text-center">
	<main class="form-signin w-100 m-auto">
		<form id="loginContainer" method="post">
			<h1 class="h3 mb-3 fw-normal">관리자 모드 로그인</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="아이디를 입력하세요." name="admin_id"> <label
					for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="비밀번호를 입력하세요." name="admin_pw"> <label
					for="floatingPassword">비밀번호</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					아이디 저장
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary loginBtn" type="submit">로그인</button>
		</form>
	</main>
</body>
<script>
	$("#loginContainer").on("keyup", function(key) {
		if (key.keyCode == 13) {
			$("#loginContainer").submit();
		}
	})
</script>
</html>
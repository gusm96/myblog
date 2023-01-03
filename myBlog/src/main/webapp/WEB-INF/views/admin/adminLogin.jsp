<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
</head>
<body>
	<div id="loginContainer">
		<form method="POST">
			<div>
				<label>아이디</label><input type="text" name="admin_id"
					placeholder="아이디를 입력하세요." required/>
			</div>
			<div>
				<label>비밀번호</label><input type="password" name="admin_pw"
					placeholder="비밀번호를 입력하세요." required/>
			</div>
			<div>
				<button class="loginBtn">로그인</button>
			</div>
		</form>
	</div>
</body>
<script>
	$("#loginContainer").on("keyup", function(key) {
		if (key.keyCode == 13) {
			$("#loginContainer").submit();
		}
	})
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을 수 없습니다</title>
</head>
<body>
	<h1>페이지를 찾을 수 없습니다.</h1>
	<span>${e}</span>
	<a href="${pageContext.request.contextPath}">홈으로 돌아가기</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:if test="${not empty board}">
	<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<title>${board.title}</title>
	</head>
	<body class="d-flex flex-column min-vh-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2">
					<%@include file="/WEB-INF/views/frame/sidebar.jsp"%>
				</div>
				<div class="col-md-10">
					<%@ include file="/WEB-INF/views/board/boardDetail.jsp"%>
				</div>
			</div>
		</div>
	</body>
</c:if>
<c:if test="${empty board}">
	<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<link src="/resources/css/cover.css">
<title>게시글이 존재하지 않습니다.</title>
	</head>
	<body class="d-flex h-100 text-center text-bg-dark">
		<div
			class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
			<main class="px-3">
				<h1>게시글이 존재하지 않습니다.</h1>
				<p class="lead">해당 게시글은 존제하지 않는 게시글이거나 작성자에 의해 게시글을 보여줄 수 없습니다.</p>
				<p class="lead">
					<button
						class="backBtn btn btn-lg btn-light fw-bold border-white bg-white">돌아가기</button>
				</p>
			</main>
		</div>
		<script>
			$(".backBtn").click(function() {
				history.go(-1);
			});
		</script>
	</body>
</c:if>
</html>
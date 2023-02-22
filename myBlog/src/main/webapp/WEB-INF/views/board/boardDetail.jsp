<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty board}">
<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>${board.title}</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<%@ include file="/WEB-INF/views/frame/sidebar.jsp"%>
			</div>
			<div class="col-md-9">
				<h1>${board.title }</h1>
			</div>
		</div>
	</div>

</body>
	</html>
</c:if>
<c:if test="${empty board }">
	<script>
		alert("해당 게시글이 존재하지 않습니다.");
		location.go(-1);
	</script>
</c:if>
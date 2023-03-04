<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp" %>
<meta charset="UTF-8">
<title>${board.title}</title>
</head>
<body>
	<div class="container">
		<!-- header -->
		<div class="row">
			<%@ include file="/WEB-INF/views/frame/header.jsp"%>
		</div>
		<!-- main -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-9">
				<%@include file="/WEB-INF/views/board/boardDetail.jsp" %>
			</div>
			<div class="col-md-2">
				<!-- nav -->
				<%@include file="/WEB-INF/views/frame/nav.jsp"%>
			</div>
		</div>
		<!-- footer -->
		<div class="row">
			<%@include file="/WEB-INF/views/frame/footer.jsp" %>
		</div>
	</div>
</body>
</html>
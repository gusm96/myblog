<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>My Blog</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<style>
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<%@ include file="/WEB-INF/views/frame/header.jsp"%>
		</div>
		<div class="row">
			<!-- anything -->
			<div class="col-md-2"></div>
			<!-- board list -->
			<div class="col-md-8">
				<c:if test="${not empty board}">
					<c:forEach items="${board}" var="b">
						<div>
							<div>${b.title}</div>
							<div>
								<p>${b.upload_date}</p>
							</div>
						</div>
						<hr>
					</c:forEach>
				</c:if>
			</div>
			<!-- nav -->
			<div class="col-md-2">
				<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
			</div>
		</div>
		<div class="row">
			<!-- footer -->
			<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
		</div>
	</div>
</body>
</html>

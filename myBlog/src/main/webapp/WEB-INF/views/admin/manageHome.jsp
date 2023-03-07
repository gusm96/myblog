<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<div class="container">
		<div class="row">
			<div class="col-md-2"><%@ include
					file="/WEB-INF/views/frame/sidebar.jsp"%></div>
			<div class="col-md-10" style="margin-top: 50px;">
				<div class="row"><%@include
						file="/WEB-INF/views/frame/header.jsp"%></div>
				<div class="row">
					<c:if test="${not empty board}">
						<div id="board_list">
							<h4>최신 게시글</h4>
							<hr>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody class="">
									<c:forEach items="${board}" var="b">
										<fmt:parseDate value="${b.upload_date}" var="parseDateValue"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${parseDateValue}" var="uploadDate"
											pattern="yyyy-MM-dd" />
										<tr>
											<td>${b.bidx}</td>
											<td><a href="${pageContext.request.contextPath}/manage/${b.bidx}">${b.title }</a></td>
											<td>${uploadDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
					<c:if test="${empty board}">
						<div id="board_list">
							<h1>최신 게시글이 존재하지 않습니다.</h1>
						</div>
					</c:if>
				</div>
				<div class="row">
					<%@include file="/WEB-INF/views/frame/footer.jsp"%>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
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
<%@ include file="/WEB-INF/views/frame/pagination.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<%@ include file="/WEB-INF/views/frame/navContainer.jsp"%>
			</div>
			<div class="col">
				<!-- Controller 에서 Board를 담은 Model을 보내 주었다면 게시글 리스트 표시  -->
				<c:if test="${not empty board}">
					<div id="board_list">
						<table>
							<caption>${boardType}</caption>
							<thead>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
							</thead>
							<tbody>
								<c:forEach items="${board}" var="b">
									<fmt:parseDate value="${b.upload_date}" var="parseDateValue"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${parseDateValue}" var="uploadDate"
										pattern="yyyy-MM-dd" />
									<tr>
										<td>${b.bidx}</td>
										<td><a
											href="${pageContext.request.contextPath}/board/${b.bidx}">${b.title }</a></td>
										<td>${uploadDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="pageContainer"></div>
					</div>
				</c:if>
				<c:if test="${empty board}">
					<div id="board_list">
						<h1>게시글이 존재하지 않습니다.</h1>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>

</html>
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
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
	crossorigin="anonymous"></script>
</head>
<body>
	<main>
		<div id="nav_container">
			<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark"
				style="width: 280px;">
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
					<svg class="bi pe-none me-2" width="40" height="32">
						<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">Sidebar</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#" class="nav-link active"
						aria-current="page"> <svg class="bi pe-none me-2" width="16"
								height="16">
								<use xlink:href="#home"></use></svg> Home
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/board/upload"
						class="nav-link text-white"> <svg class="bi pe-none me-2"
								width="16" height="16">
								<use xlink:href="#speedometer2"></use></svg> 게시글 작성
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/board/java?page=1"
						class="nav-link text-white"> <svg class="bi pe-none me-2"
								width="16" height="16">
								<use xlink:href="#table"></use></svg> Java
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/board/js?page=1"
						class="nav-link text-white"> <svg class="bi pe-none me-2"
								width="16" height="16">
								<use xlink:href="#grid"></use></svg> JavaScript
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/board/sql?page=1"
						class="nav-link text-white"> <svg class="bi pe-none me-2"
								width="16" height="16">
								<use xlink:href="#people-circle"></use></svg> Sql
					</a></li>
				</ul>
				<hr>
				<div class="dropdown">
					<a href="#"
						class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"> <img
						src="https://github.com/mdo.png" alt="" width="32" height="32"
						class="rounded-circle me-2"> <strong>mdo</strong>
					</a>
					<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
						style="">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Sign out</a></li>
					</ul>
				</div>
			</div>
		</div>
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
				<div id="pageContainer">
					<div id="firstBtn">
						<button>처음</button>
					</div>
					<div id="backBtn">
						<button>이전</button>
					</div>
					<div id="pageNum">
						<c:forEach items="${pagenum}" var="page">
							<a
								href="${pageContext.request.contextPath}/admin/board/${boardType}?page=${page}">${page}</a>
						</c:forEach>
					</div>
					<div id="nextBtn">
						<button>다음</button>
					</div>
					<div id="lastBtn">
						<button>끝</button>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty board}">
			<div id="board_list">
				<h1>게시글이 존재하지 않습니다.</h1>
			</div>
		</c:if>
	</main>
	<script>
		
	<%@ include file="/resources/js/pageBtn.js" %>
		
	</script>
</body>

</html>
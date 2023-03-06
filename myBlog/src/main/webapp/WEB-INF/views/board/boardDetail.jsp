<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1 class="text-left">${board.title }</h1>
	<hr>
	<div class="content">${board.content}</div>
	<button class ="backBtn">뒤로가기</button>
	<c:if test="${not empty admin}">
		<a
			href="${pageContext.request.contextPath}/manage/newpost/${board.bidx}"><button>수정하기</button></a>
	</c:if>
</div>
<script>
	$(".backBtn").click(function () {
		history.go(-1);
	})
</script>

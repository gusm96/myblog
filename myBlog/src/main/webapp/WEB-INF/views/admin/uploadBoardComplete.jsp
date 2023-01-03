<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result > 0 }">
	<!-- 성공 alert() -->
	<script>
		alert("게시글 작성 완료.");
		location.href = "${pageContext.request.contextPath}"
	</script>
</c:if>
<c:if test="${result == 0}">
	<script>
		alert("게시글 작성 실패.");
		history.go(-1);
	</script>
</c:if>
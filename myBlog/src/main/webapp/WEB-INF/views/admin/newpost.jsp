<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시글 작성</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- Fontawesome -->
<script src="https://kit.fontawesome.com/9cdfdf3db8.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#summernote")
								.summernote(
										{
											height : 500,
											minHeight : null,
											maxHeight : null,
											focus : true,
											placeholder : "게시글을 작성하세요.",
											lang : "Ko-KR",
											tabsize : 2,
											callbacks : {
												onImageUpload : function(files) {
													for (var i = files.length - 1; i >= 0; i--) {
														sendImageFile(files[i],
																this);
													}
												},
											},
										});
						function sendImageFile(file, editor) {
							data = new FormData();
							data.append("file", file);
							$
									.ajax({
										data : data,
										type : "POST",
										url : "${pageContext.request.contextPath}/manage/newpost/uploadImageFile",
										contentType : false,
										processData : false,
										success : function(data) {
											setTimeout(function() {
												$(editor)
														.summernote(
																"insertImage",
																data.url);
											}, 4000); // 이미지 업로드 시간 문제 때문에 임시로 처리.. 배포시 수정
										},
									});
						}
						$("#board_type").val('${post.board_type}').prop(
								"selected", true);
					});
</script>
</head>
<body class="d-flex flex-column min-vh-100">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<%@include file="/WEB-INF/views/frame/sidebar.jsp"%>
			</div>
			<div class="col-md-10">
				<c:if test="${not empty post}">
					<form method="POST">
						<input type="hidden" name="bidx" value="${post.bidx}" />
						<div class="row">
							<div class="col-md-1"
								style="text-align: center; font-weight: bold">제목</div>
							<div class="col-md-8" style="padding: 0">
								<input type="text" name="title" required style="width: 100%"
									required value="${post.title}" />
							</div>
							<div class="col-md-3" style="padding: 0">
								<select name="board_type" id="board_type" class="form-select"
									aria-label="Default select example" required>
									<option value="1">Java</option>
									<option value="2">JavaScript</option>
									<option value="3">SQL</option>
								</select>
							</div>
						</div>
						<textarea id="summernote" name="content" required>${post.content}</textarea>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary me-md-2" type="submit">
								수정하기</button>
							<button class="btn btn-primary" type="reset">리셋</button>
						</div>
					</form>
				</c:if>
				<c:if test="${empty post}">
					<form method="POST">
						<div class="row">
							<div class="col-md-1"
								style="text-align: center; font-weight: bold">제목</div>
							<div class="col-md-8" style="padding: 0">
								<input type="text" name="title" required style="width: 100%"
									required />
							</div>
							<div class="col-md-3" style="padding: 0">
								<select name="board_type" id="board_type" class="form-select"
									aria-label="Default select example" required>
									<option selected>게시글 유행을 선택하세요.</option>
									<option value="1">Java</option>
									<option value="2">JavaScript</option>
									<option value="3">SQL</option>
								</select>
							</div>
						</div>
						<textarea id="summernote" name="content" required></textarea>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary me-md-2" type="submit">
								작성하기</button>
							<button class="btn btn-primary" type="reset">리셋</button>
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>

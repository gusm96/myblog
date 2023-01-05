<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500,
			minHeight : null,
			maxHeight : null,
			focus : true,
			placeholder : "게시글을 작성하세요.",
			lang : "Ko-KR",
			tabsize : 2,

		});
	});
</script>

</head>
<body>
	<div class="container">
		<form method="POST">
			<div class="row">
				<div class="col-md-1" style="text-align: center; font-weight: bold">
					제목</div>
				<div class="col-md-8" style="padding: 0">
					<input type="text" name="title" required style="width: 100%"
						required />
				</div>
				<div class="col-md-2" style="padding: 0">
					<select name="board_type" id="board_type"
						class="form-select" aria-label="Default select example" required>
						<option selected>게시글 유행을 선택하세요.</option>
						<option value="1">공지사항</option>
						<option value="2">이벤트</option>
					</select>
				</div>
			</div>
			<textarea id="summernote" name="content" required></textarea>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary me-md-2" type="submit">작성하기
				</button>
				<button class="btn btn-primary" type="reset">리셋</button>
			</div>
		</form>
	</div>
</body>
</html>
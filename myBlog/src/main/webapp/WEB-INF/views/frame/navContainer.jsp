<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
	<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
	
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
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}" class="nav-link active"
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
				<li><a class="dropdown-item"
					href="${pageContext.request.contextPath}/admin/logout">Sign out</a></li>
			</ul>
		</div>
	</div>
</div>

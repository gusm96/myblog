<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<style>
  .sidebar {
    height: 100vh;
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.9));
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    box-shadow: 5px 7px 25px #999;
  }

  .bottom-border {
    border-bottom: 2px groove #eee;
  }

  .sidebar-link {
    transition: all 0.4s;
  }

  .sidebar-link:hover {
    background-color: #444;
    border-radius: 5px;
  }

  .current {
    background-color: #f44336;
    border-radius: 7px;
    box-shadow: 2px 5px 10px #111;
  }
</style>
<nav class="navbar navbar-expand-md navbar-light">
  <button
    class="navbar-toggler ml-auto mb-2 bg-light"
    type="button"
    data-toggle="collapse"
    data-target="#sidebar"
  >
    <span class="navbar-toggle-icon"></span>
  </button>
  <div class="collapse navbar-collapse text-center" id="sidebar">
    <div class="container-fluid">
      <div class="row">
        <!-- sidebar-->
        <div class="col-lg-2 sidebar fixed-top">
          <span
            class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4 bottom-border"
            ><a href="${pageContext.request.contextPath}/manage" class="text-white">Management</a></span
          >
          <ul class="navbar-nav flex-column mt-4">
            <li class="nav-item">
              <a
                href="${pageContext.request.contextPath}/manage/newpost"
                class="nav-link text-white p-3 mb-2 sidebar-link"
                ><i class="fas fa-file-alt text-white fa-lg mr-3"></i>게시글
                작성</a
              >
            </li>
            <li class="nav-item">
              <a
                href="${pageContext.request.contextPath}/manage/board/java?page=1"
                class="nav-link text-white p-3 mb-2 sidebar-link"
                ><i class="fa-brands fa-java text-white fa-lg mr-3"></i>Java</a
              >
            </li>
            <li class="nav-item">
              <a
                href="${pageContext.request.contextPath}/manage/board/js?page=1"
                class="nav-link text-white p-3 mb-2 sidebar-link"
                ><i class="fa-brands fa-js text-white fa-lg mr-3"></i
                >JavaScript</a
              >
            </li>
            <li class="nav-item">
              <a
                href="${pageContext.request.contextPath}/manage/board/sql?page=1"
                class="nav-link text-white p-3 mb-2 sidebar-link"
                ><i class="fa-solid fa-database text-white fa-lg mr-3"></i
                >SQL</a
              >
            </li>
          </ul>
          <div class="col-lg-12 align-items-end">
            <%--
            <a
              class="text-white p-3 mb-2"
              href="${pageContext.request.contextPath}/logout/admin"
              style="text-decoration: none"
              >관리자 모드 종료</a
            >
            --%>
            <button
              type="button"
              class="btn btn-primary"
              data-bs-toggle="modal"
              data-bs-target=".modal"
            >
              관리자 모드 종료
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</nav>

<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">관리자 모드 종료</h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <p>정말로 관리자 모드를 종료하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
          취소
        </button>
        <button type="button" class="btn btn-primary">
          <a
            class="text-white"
            href="${pageContext.request.contextPath}/logout/admin"
            style="text-decoration: none"
            >종료</a
          >
        </button>
      </div>
    </div>
  </div>
</div>

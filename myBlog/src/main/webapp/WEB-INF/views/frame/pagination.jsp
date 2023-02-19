<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty board.page}">
  <div id="pageContainer" class="container bg-primary center-block" style="width:600px"></div>
  <script>
    var nowPage = new URL(location.href).searchParams.get("page");
    $(document).ready(function () {
      getPagination(nowPage);
      $(".firstPageBtn").click(function () {
    	  var params =new URLSearchParams(location.search);
    	  params.set("page", 1);
 		location.href = location.pathname + "?" +params.toString();
      });
      $(".prevBtn").click(function () {
    	  var params =new URLSearchParams(location.search);
    	  params.set("page", parseInt(nowPage) -1);
 		location.href = location.pathname + "?" +params.toString();
      });
      
      $(".nextBtn").click(function () {
    	  var params =new URLSearchParams(location.search);
    	  params.set("page", parseInt(nowPage) +1);
 		location.href = location.pathname + "?" +params.toString();
      });
      $(".lastPageBtn").click(function () {
    	  var params =new URLSearchParams(location.search);
    	  params.set("page", "${board.page.totalPage}");
 		location.href = location.pathname + "?" +params.toString();
      });
    });
    function getPagination(nowPage) {
      var totalPage = "${board.page.totalPage	}";
      var pageContainer = document.createElement("ul");
      pageContainer.className += "pagination";
      var pageGroup = Math.ceil(nowPage / 10);
      var firstPage = pageGroup * 10 - 9;
      var lastPage = totalPage <= 10 ? totalPage : pageGroup * 10;
      if (lastPage > totalPage) {
        lastPage = totalPage;
      }
      if (nowPage > 1) {
        pageContainer.innerHTML +=
          "<li class='page-item firstPageBtn'><a class='page-link' href='#'>처음</a></li>";
        pageContainer.innerHTML +=
          "<li class='page-item prevBtn'><a class='page-link' href='#'>이전</a></li>";
      }
      for (var i = firstPage; i <= lastPage; i++) {
        pageContainer.innerHTML +=
          "<li class='page-item'><a class ='page-link' href='#' id='" +
          i +
          "'>" +
          i +
          "</a></li>";
      }
      if (nowPage != totalPage && totalPage != 1) {
        pageContainer.innerHTML +=
          "<li class='page-item nextBtn'><a class='page-link' href='#'>다음</a></li>";
        pageContainer.innerHTML +=
          "<li class='page-item lastPageBtn'><a class='page-link' href='#'>끝</a></li>";
      }
      document.getElementById("pageContainer").appendChild(pageContainer);
    }
  </script>
</c:if>

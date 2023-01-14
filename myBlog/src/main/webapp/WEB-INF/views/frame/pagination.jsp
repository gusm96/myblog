<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty page}">
  <script>
    $(document).ready(function (nowPage) {
     var totalBoardCnt = ${page.totalBoardCnt};
     var totalPage = ${page.totalPage};
     var nowPage = ${page.nowPage};
     var viewCnt = ${page.viewCnt};
     var viewPageCnt = ${page.viewPageCnt};
        if(totalBoardCnt <= viewCnt) return;
        var pageGroup = Math.ceil(nowPage/ viewPageCnt);

        var lastPage = pageGroup * viewPageCnt;
        if(lastPage > totalPage) lastPage = totalPage;
        var firstPage = lastPage - (viewPageCnt - 1) <= 0 ? 1 : lastPage - (viewPageCnt - 1);
        var pageContainer = document.createDocumentFragment();
        var allpreli = document.createElement("li");
        allpreli.insertAdjacentHTML("beforeend", `<button id="firstBtn">&lt;&lt;</button>`);
        var preli = document.createElement("li");
        preli.insertAdjacentHTML("beforeend", `<button id="backBtn">&lt;</button>`);
        pageContainer.appendChild(allpreli);
        pageContainer.appendChild(preli);
        for (let i = firstPage; i <= lastPage; i++){
        	var li = document.createElement("li");
            li.insertAdjacentHTML("beforeend", "<a href='${pageContext.request.contextPath}/admin/board/${boardType}?page="+i+"'>"+i+"</a>");
            pageContainer.appendChild(li);
        }

        if (lastPage <= totalPage){
        	var allendli = document.createElement('li');
    	  allendli.insertAdjacentHTML("beforeend", `<button id='lastBtn'>&gt;&gt;</button>`);

    	  var endli = document.createElement('li');
    	  endli.insertAdjacentHTML("beforeend", `<button id='nextBtn'>&gt;</button>`);

    	  pageContainer.appendChild(endli);
    	  pageContainer.appendChild(allendli);
        }
        document.getElementById('pageContainer').appendChild(pageContainer);
        $("#firstBtn").click(function (e) {
            e.preventDefault();
            location.href =
                "${pageContext.request.contextPath}/admin/board/${boardType}?page=1";
        });

            $("#nextBtn").click(function (e) {
            e.preventDefault();

            const pageNum = ${page.nowPage} + 1;
            if(pageNum > totalPage){
                alert("마지막 페이지 입니다!!")
                return;
            }
            location.href =
                "${pageContext.request.contextPath}/admin/board/${boardType}?page=" +
                pageNum;
        });

        $("#backBtn").click(function (e) {
            e.preventDefault();
            const pageNum = ${page.nowPage} - 1;
            if(pageNum <= 1){
                alert("첫 번째 페이지 입니다!!")
                return;
            }
            location.href =
                "${pageContext.request.contextPath}/admin/board/${boardType}?page=" +
                pageNum;
        });
        $("#lastBtn").click(function (e) {
            e.preventDefault();
            location.href="${pageContext.request.contextPath}/admin/board/${boardType}?page="+lastPage;
        });
    });
  </script>
</c:if>

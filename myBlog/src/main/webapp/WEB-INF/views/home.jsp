<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <title>My Blog</title>
    <%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <%@ include file="/WEB-INF/views/frame/header.jsp"%>
      </div>
      <div class="row">
        <!-- anything -->
        <div class="col-md-1"></div>
        <!-- board list -->
        <div class="col-md-9">
        	<h4>Lates Posts</h4>
        	<hr>
          <c:if test="${not empty board}">
            <ul class="list-group list-group-flush">
              <c:forEach items="${board}" var="b">
                <fmt:parseDate
                  value="${b.upload_date}"
                  var="parsedDate"
                  pattern="yyyy-MM-dd HH:mm:ss"
                />
                <fmt:formatDate
                  value="${parsedDate}"
                  var="uploadDate"
                  pattern="yyyy.MM.dd"
                />
                <li class="list-group-item">
                  <span>${uploadDate} |</span>
                  <a href="${pageContext.request.contextPath}/board/${b.bidx}"
                    >${b.title}</a
                  >
                </li>
              </c:forEach>
            </ul>
          </c:if>
        </div>
        <!-- nav -->
        <div class="col-md-2">
          <%@ include file="/WEB-INF/views/frame/nav.jsp"%>
        </div>
      </div>
      <div class="row">
        <!-- footer -->
        <%@ include file="/WEB-INF/views/frame/footer.jsp"%>
      </div>
    </div>
  </body>
</html>

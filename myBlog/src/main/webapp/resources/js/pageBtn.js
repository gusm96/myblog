function getParameterByName(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
  return results == null
    ? ""
    : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$("#firstBtn").click(function (e) {
  e.preventDefault();
  location.href =
    "${pageContext.request.contextPath}/admin/board/${boardType}?page=1";
});

$("#nextBtn").click(function (e) {
  e.preventDefault();
  const pageNum = parseInt(getParameterByName("page")) + 1;
  location.href =
    "${pageContext.request.contextPath}/admin/board/${boardType}?page=" +
    pageNum;
});

$("#backBtn").click(function (e) {
  e.preventDefault();
  const pageNum = parseInt(getParameterByName("page")) - 1;
  location.href =
    "${pageContext.request.contextPath}/admin/board/${boardType}?page=" +
    pageNum;
});
$("#lastBtn").click(function (e) {
  e.preventDefault();
});

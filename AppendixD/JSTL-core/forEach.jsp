<%@page language="java" contentType="text/html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html><head><title>forEach</title></head><body>
<c:forEach items="${pageContext.request.headerNames}" var="current">
  <c:out value="${current}"/><br/>
  </c:forEach>
</body></html>

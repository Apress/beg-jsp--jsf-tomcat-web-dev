<%@page language="java" contentType="text/html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html><head><title>forTokens</title></head><body>
<c:forTokens items="ab, cd%ef&&;gh" delims="&; ,%" var="tok">
  <c:out value="${tok}"/>
  </c:forTokens>
</body></html>

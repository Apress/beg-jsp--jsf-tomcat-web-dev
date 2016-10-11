<%@page language="java" contentType="text/html"%>
<html><head><title>Includes</title></head><body>
<table border="1">
  <tr><th>incl B</th><th>incl C</th><th>C is with</th></tr>
  <tr><td>act</td><td>act</td><td><jsp:include page="d/b_act.jsp"/></td></tr>
  <tr><td>act</td><td>dir</td><td><jsp:include page="d/b_dir.jsp"/></td></tr>
  <tr><td>dir</td><td>act</td><td><%@include file="d/b_act.jsp"%></td></tr>
  <tr><td>dir</td><td>dir</td><td><%@include file="d/b_dir.jsp"%></td></tr>
  </table>
</body></html>
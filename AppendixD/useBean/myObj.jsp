<%@page language="java" contentType="text/html"%>
<%@page import="java.util.*, myPkg.MyClass"%>
<html><head><title>myObj</title></head><body>
<jsp:useBean id="obj" class="myPkg.MyClass" scope="session">
  <jsp:setProperty name="obj" property="i" value="11"/>
  </jsp:useBean>
<jsp:getProperty name="obj" property="i"/>
<jsp:setProperty name="obj" property="i" value="22"/>
<jsp:getProperty name="obj" property="i"/>
</body></html>

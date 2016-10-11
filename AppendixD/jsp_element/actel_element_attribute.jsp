<%@page language="java" contentType="text/html"%>
<html
  xmlns="http://www.w3c.org/1999/xhtml"
  xmlns:jsp="http://java.sun.com/JSP/Page"
  >
<head><title>Action elements: element, attribute</title></head>
<body>
<jsp:element name="myElem">
  <jsp:attribute name="myElemAttr">myElemAttr's value</jsp:attribute>
  <jsp:body>myElem's body</jsp:body>
  </jsp:element>
<br/>
<jsp:include page="text.txt"/>
<br/>
<jsp:include>
  <jsp:attribute name="page">text.txt</jsp:attribute>
  </jsp:include>
</body>
</html>
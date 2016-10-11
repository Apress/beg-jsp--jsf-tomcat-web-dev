<%@page language="java" contentType="text/xml"%>
<%@page import="javax.xml.soap.SOAPMessage"%>
<%@page import="javax.xml.soap.SOAPEnvelope"%>
<%@page import="javax.xml.soap.Name"%>
<%@page import="javax.xml.soap.SOAPBody"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  // The following variables are used by myMess_create_mess.jspf
  SOAPMessage mess;  SOAPEnvelope env;  SOAPBody body;
  %><%@include file="myMess_create_mess.jspf"%><%
  int n = request.getContentLength();
  byte[] bytes = new byte[n];
  request.getInputStream().read(bytes);
  String question = new String(bytes);
  pageContext.setAttribute("question", question);
  %>
<x:parse doc="${question}" varDom="dom"/>
<x:choose>
  <x:when select="count($dom//*[name()='my:reqTime']) = 1">
    <%@page import="javax.xml.soap.SOAPBodyElement"%>
    <%@page import="java.util.GregorianCalendar"%>
    <%
      Name bodyElemName = env.createName("time", "my", "myMess.xsd");
      SOAPBodyElement be = body.addBodyElement(bodyElemName);
      GregorianCalendar cal = new GregorianCalendar();
      be.addTextNode(cal.getTime().toString());
      %>
    </x:when>
  <x:otherwise>
    <% body.addFault().setFaultString("Unknown request"); %>
    </x:otherwise>
  </x:choose>
<%
  ByteArrayOutputStream baos = new ByteArrayOutputStream(1024);
  mess.writeTo(baos);
  out.print(baos.toString());
  %>
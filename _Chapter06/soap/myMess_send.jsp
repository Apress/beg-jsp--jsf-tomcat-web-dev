<%@page language="java" contentType="text/html"%>
<%@page import="javax.xml.soap.SOAPMessage"%>
<%@page import="javax.xml.soap.SOAPEnvelope"%>
<%@page import="javax.xml.soap.Name"%>
<%@page import="javax.xml.soap.SOAPBody"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.xml.soap.SOAPConnectionFactory"%>
<%@page import="javax.xml.soap.SOAPConnection"%>
<html><head><title>Send SOAP message</title></head><body>
<%
  // The following variables are set by myMess_create_mess.jspf
  SOAPMessage mess;  SOAPEnvelope env;  SOAPBody body;
  %><%@include file="myMess_create_mess.jspf"%><%
  Name bodyElemName = env.createName("reqTime", "my", "myMess.xsd");
  body.addBodyElement(bodyElemName);
  ByteArrayOutputStream baos = new ByteArrayOutputStream(1024);
  mess.writeTo(baos);
  out.println("<b>---------- Request message ----------</b>");
  out.println(baos.toString().replaceAll("<", "<br/>&lt;") + "<br/>&nbsp;");
  SOAPConnectionFactory cf = SOAPConnectionFactory.newInstance();
  SOAPConnection conn = cf.createConnection();
  SOAPMessage answer = conn.call(mess,
      "http://localhost:8080/tests/myMess_reply.jsp");
  conn.close();
  baos.reset();
  answer.writeTo(baos);
  out.println("<br/><b>---------- Response message ----------</b>");
  out.println(baos.toString().replaceAll("<", "<br/>&lt;") + "<br/>&nbsp;");
  %>
</body></html>

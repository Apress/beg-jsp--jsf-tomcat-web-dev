<%@page language="java" contentType="text/html"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="myPkg.ParsingExceptionHandler"%>
<%@page import="java.io.File"%>
<html><head><title>Validate starfleet.xml</title></head><body>
<%
  File docFile = new File("webapps/xml-validate/xml/enterprises.xml");
  DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
  dbf.setValidating(true);
  DocumentBuilder db = dbf.newDocumentBuilder();
  ParsingExceptionHandler handler = new ParsingExceptionHandler();
  db.setErrorHandler(handler);
  try {
    Document doc = db.parse(docFile);
    }
  catch (Exception e) {
    // Sax exception already trapped in the handler.
    }
  if (handler.errorLevel == null) {
    out.println("The document is valid.");
    }
  else {
    out.println(
        "*** Validation " + handler.errorLevel + ": "
      + handler.parsingException
      );
    }
  %>
</body></html>

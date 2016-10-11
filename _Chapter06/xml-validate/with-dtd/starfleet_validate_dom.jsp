<%@page language="java" contentType="text/html"%>
<%@page import="org.apache.xerces.parsers.DOMParser"%>
<%@page import="myPkg.ParsingExceptionHandler"%>
<html><head><title>Validate (DOM) starfleet.xml</title></head><body>
<%
  ParsingExceptionHandler handler = new ParsingExceptionHandler();
  DOMParser parser = new DOMParser();
  parser.setFeature("http://xml.org/sax/features/validation", true);
  parser.setErrorHandler(handler);
  try {
    parser.parse("webapps/xml-validate/xml/enterprises.xml");
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

<%@page language="java" contentType="text/html"%>
<%@page import="org.apache.xerces.parsers.SAXParser"%>
<%@page import="myPkg.ParsingExceptionHandler"%>
<html><head><title>Validate (SAX) starfleet.xml</title></head><body>
<%
  ParsingExceptionHandler handler = new ParsingExceptionHandler();
  SAXParser parser = new SAXParser();
  parser.setFeature("http://xml.org/sax/features/validation", true);
  parser.setFeature("http://apache.org/xml/features/validation/schema", true);
  parser.setFeature(
    "http://apache.org/xml/features/validation/schema-full-checking", true);
//  parser.setProperty(
//"http://apache.org/xml/properties/schema/external-noNamespaceSchemaLocation",
//          "http://localhost:8080/xml-validate/xsd/starfleet.xsd");
  parser.setErrorHandler(handler);
  try {
    parser.parse("webapps/xml-validate/xml/enterprises_schema.xml");
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

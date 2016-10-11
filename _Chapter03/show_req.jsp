<%@page import="java.io.*, java.util.*"%>
<%
  out.println("Method: " + request.getMethod() + "</br>");
  Enumeration  pars = request.getParameterNames();
  while (pars.hasMoreElements()) {
    String   parName = (String)pars.nextElement();
    String[] parValues = request.getParameterValues(parName);
    out.print(parName + " =");
    for (int k = 0; k < parValues.length; k++) {
      out.print(" '" + parValues[k] + "'");
      }
    out.println("</br>");
    }
  %>
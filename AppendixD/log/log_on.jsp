<%@page language="java" contentType="text/html"%>
<%@ page import="MyClasses.*"%>
<html><head><title>Switch the log ON</title></head><body>
<%
  MyLog log = (MyLog)application.getAttribute("logFile");
  if (log == null) {
    try {
      log = new MyLog("logs/mylog.log");
      application.setAttribute("logFile", log);
      log.println("Logging enabled");
      out.println("Logging enabled");
      }
    catch (Exception e) {
      out.println(e.getMessage());
      }
    }
  else {
    log.println("Attempt to enable logging");
    out.println("Logging was already enabled");
    }
  %>
</body></html>

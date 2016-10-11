<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<html><head><title>XLS - ODBC test</title></head><body>
<%
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
  Connection conn = DriverManager.getConnection ("jdbc:odbc:tab");
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery("select * from [zzz$]");
  %><table border= "1"><%
  ResultSetMetaData resMetaData = rs.getMetaData();
  int nCols = resMetaData.getColumnCount();
  %><tr><%
  for (int kCol = 1; kCol <= nCols; kCol++) {
    out.print("<td><b>" + resMetaData.getColumnName(kCol) + "</b></td>");
    }
  %></tr><%
  while (rs.next()) {
    %><tr><%
    for (int kCol = 1; kCol <= nCols; kCol++) {
      out.print("<td>" + rs.getString(kCol) + "</td>");
      }
    %></tr><%
    }
  %></table><%
  conn.close();
  %>
</body></html>
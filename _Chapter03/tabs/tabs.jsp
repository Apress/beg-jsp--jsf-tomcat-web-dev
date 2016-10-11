<%@page language="java" contentType="text/html"%>
<%
  final char HOME = 'H', TEST = 'T', NUM = '1';
  String     s = request.getParameter("t");
  char       p = (s != null && s.length() > 0) ? s.charAt(0) : HOME;
  %>
<html>
<head>
  <title>Tabs with CSS</title>
  <link rel="stylesheet" type="text/css" href="tabs.css"/>
  </head>
<body>
<p>This appears above the tabs</p>
<div class="tabs">
  <ul>
    <li <% if (p == HOME) out.print("id=\"on\""); %>>
      <a href="tabs.jsp?t=<%=HOME%>"><span>Home</span></a>
      </li>
    <li <% if (p == TEST) out.print("id=\"on\""); %>>
      <a href="tabs.jsp?t=<%=TEST%>"><span>Test</span></a>
      </li>
    <li <% if (p == NUM) out.print("id=\"on\""); %>>
      <a href="tabs.jsp?t=<%=NUM%>"><span>123456789 abcdef</span></a>
      </li>
    </ul>
  </div>
<p>
  &nbsp<br/>
  This appears below the tabs
  </p>
</body>
</html>

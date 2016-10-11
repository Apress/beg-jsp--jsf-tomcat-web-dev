<%@page language="java" contentType="text/html"%>
<html>
<head>
  <title>Check date/time sequence in form</title>
  <script type="text/javascript">
    var now = new Date();
    var thisDay   = now.getDate() - 1;
    var thisMonth = now.getMonth();
    var thisYear  = now.getYear();
    if (thisYear < 2000) thisYear += 1900; //for some browsers
    var firstYear = thisYear - 2;
    var lastYear = thisYear + 2;
    </script>
  <script type="text/javascript" src="dates.js"></script>
  </head>
<body>
<form name="f" action="">
  <table border="0">
    <tr><td>&nbsp;</td>
      <td>Year</td><td>Month</td><td>Day</td>
      <td>&nbsp;</td>
      </tr>
<%  for (int k = 1, kMax = 2; k <= kMax; k++) { %>
<%    String upd = "updateMonthDays('f', '"+k+"')"; %>
      <tr>
        <td>Date <%=k%>:</td>
        <td>
          <select name="yy<%=k%>" onchange="<%=upd%>">
            <script type="text/javascript">
              for (var jy = firstYear; jy <= lastYear; jy++) {
                document.writeln("<option>" + jy + "</option>");
                }
              </script>
            </select>
          </td>
        <td>
          <select name="mm<%=k%>" onchange="<%=upd%>">
<%          for (int jm = 1; jm <= 12; jm++) { %>
              <option><%=jm%></option>
<%            } %>
            </select>
          </td>
        <td>
          <select name="dd<%=k%>">
<%          for (int jd = 1; jd <= 31; jd++) { %>
              <option><%=jd%></option>
<%            } %>
            </select>
          </td>
        <td>
          <input type="button" name="today<%=k%>"
            value="Today" onclick="selectToday('f', '<%=k%>')"/>
<%        int k1 = k; int k2 = k + 1; if (k2 > kMax) k2 = 1; %>
          <input type="button" name="same_day"
             value="<%=k1%> -> <%=k2%>"
             onclick="copyDay('f', '<%=k1%>', '<%=k2%>')"/>
          </td>
        </tr>
      <script type="text/javascript">
        selectToday('f', '<%=k%>')
        </script>
<%    } /* for (int k.. */ %>
    </table>
  </form>
</body>
</html>

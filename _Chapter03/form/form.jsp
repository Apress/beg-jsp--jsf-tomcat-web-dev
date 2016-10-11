<%@page language="java" contentType="text/html"%>
<%
  String    t_ = request.getParameter("t");
  if (t_ == null) t_ = "";
  String    p_ = request.getParameter("p");
  if (p_ == null) p_ = "";
  String[]  abc_ = request.getParameterValues("abc");
  boolean   abc_a = false;
  boolean   abc_b = false;
  boolean   abc_c = false;
  if (abc_ != null) {
    for (int k = 0; k < abc_.length; k++) {
      if (abc_[k].length() == 1) {
        switch (abc_[k].charAt(0)) {
          case 'a': abc_a = true;
                    break;
          case 'b': abc_b = true;
                    break;
          case 'c': abc_c = true;
                    break;
          }
        }
      }
    }
  String    yn_ = request.getParameter("yn");
  boolean   yn_y = false;
  boolean   yn_n = false;
  if (yn_ != null) {
      yn_y = (yn_.equals("y"));
      yn_n = (yn_.equals("n"));
    }
  String    ta_ = request.getParameter("ta");
  if (ta_ == null) ta_ = "Default text";
  String    w_ = request.getParameter("w");
  if (w_ == null) w_ = "";
  String    h_ = request.getParameter("h");
  if (h_ == null) h_ = "";
  String    food_ = request.getParameter("food");
  if (food_ == null) food_ = "spaghetti";
  /*
   *  Here process the input
   */
  %>
<html>
<head>
  <title>Example of input form</title>
  <style type="text/css">
    td.h {font-size: 120%; font-weight: bold}
    </style>
  </head>
<body>
<form action="">
  <input type="hidden" name="agent" value="007"/>
  <table  cellpadding="5" border="1" rules="all">
    <tr>
      <td class="h">Element</td><td class="h">Attribute</td>
      <td class="h">Result</td></tr>
    <tr>
      <td>input</td><td>type="text"</td>
      <td><input type="text" name="t" value="<%=t_%>"/></td>
      </tr>
    <tr>
      <td>input</td><td>type="password"</td>
      <td><input type="password" name="p" value="<%=p_%>"/></td>
      </tr>
    <tr>
      <td>input</td><td>type="checkbox"</td>
      <td>
        <input type="checkbox" value="a" name="abc"
          <%=(abc_a)?"checked":""%>
          >A</input>
        <input type="checkbox" value="b" name="abc"
          <%=(abc_b)?"checked":""%>
          >B</input>
        <input type="checkbox" value="c" name="abc"
          <%=(abc_c)?"checked":""%>
          >C</input>
        </td>
      </tr>
    <tr>
      <td>input</td><td>type="radio"</td>
      <td>
        <input type="radio" name="yn" value="y"
          <%=(yn_y)?"checked":""%>
          >yes</input>
        <input type="radio" name="yn" value="n"
          <%=(yn_n)?"checked":""%>
          >no</input>
        </td>
      </tr>
    <tr>
      <td>input</td><td>type="file"</td>
      <td><input type="file" name="f"/></td>
      </tr>
    <tr>
      <td>input</td><td>type="submit"</td>
      <td><input type="submit"/></td>
      </tr>
    <tr>
      <td>input</td><td>type="reset"</td>
      <td><input type="reset"/></td>
      </tr>
    <tr>
      <td>input</td><td>type="button"</td>
      <td><input type="button" value="click me" name="b"/></td>
      </tr>
    <tr>
      <td>textarea</td><td></td>
      <td><textarea name="ta"><%=ta_%></textarea></td>
      </tr>
    <tr>
      <td>fieldset</td><td></td>
      <td><fieldset>
        <legend>Dimensions:</legend>
        Width <input type="text" size="3" name="w" value="<%=w_%>"/>
        Height <input type="text" size="3" name="h" value="<%=h_%>"/>
        </fieldset></td>
      </tr>
    <tr>
      <td>select / option</td><td></td>
      <td><select name="food">
        <option value="pizza"
          <%=(food_.equals("pizza"))?"selected":""%>
          >Pizza</option>
        <option value="spaghetti"
          <%=(food_.equals("spaghetti"))?"selected":""%>
          >Spaghetti</option>
        </select></td>
      </tr>
    </table>
  </form>
</body>
</html>

<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="ISO-8859-1" indent="yes"/>
<xsl:template match="/">
<html><head>
  <title>Styling starfleet.xml</title>
  <style>th {text-align:left}</style>
  </head>
<body>
<h2><xsl:value-of select="starfleet/title"/></h2>
<table border="1">
  <tr><th>Name</th><th>S/N</th><th>Class</th><th>Captain</th></tr>
  <xsl:for-each select="starfleet/starship">
    <xsl:sort select="class/@name"/>
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td><xsl:value-of select="@sn"/></td>
      <td><xsl:value-of select="class/@name"/></td>
      <td><xsl:value-of select="captain"/></td>
      </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
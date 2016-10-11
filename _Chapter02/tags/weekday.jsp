<%@page language="java" contentType="text/html"%>
<%@taglib uri="/WEB-INF/tlds/wow.tld" prefix="wow"%>
<html><head><title>weekday tag</title></head><body>
weekday today: <wow:weekday/><br/>
weekday ${param.d}: <wow:weekday date="${param.d}"/><br/>
weekdayBody today: <wow:weekdayBody></wow:weekdayBody><br/>
weekdayBody ${param.d}: <wow:weekdayBody>${param.d}</wow:weekdayBody><br/>
</body></html>

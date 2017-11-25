<%@ page import="jsptest.HelloTest" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="jsptest" class="jsptest.HelloTest" scope="page" />
<html>
<body>
<%=jsptest.getName()%>
</body>
</html>
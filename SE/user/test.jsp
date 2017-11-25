<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<html>
<body>
<%=UserAccountController.getUserName((String)session.getAttribute("sessionID"))%>
</body>
</html>
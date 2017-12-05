<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%
	// 관리자로 되어있는지 확인, 안되어 있으면 메인 화면으로 이동
	if(session.getAttribute("sessionID") == null ||
        !UserAccountController.isUserSeller((String)session.getAttribute("sessionID")))
	{
		response.sendRedirect("/SE/index.jsp?seller");
        return;
	}
%>
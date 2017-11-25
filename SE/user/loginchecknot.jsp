<%
	// 로그인 되어있는지 확인, 되어 있으면 메인 화면으로 이동
	if(session.getAttribute("sessionID") != null)
	{
		response.sendRedirect("/SE/index.jsp?error");
		return;
	}
%>
<%
	// 로그인 되어있는지 확인, 안되어 있으면 로그인 화면으로 이동
	if(session.getAttribute("sessionID") == null)
	{
		String requestURL = request.getRequestURL().toString();
		String queryString = request.getQueryString();
		if (queryString != null) requestURL += "?" + queryString;

		response.sendRedirect("/SE/user/login.jsp?login&next="+requestURL);
		return;
	}
%>
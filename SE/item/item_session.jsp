<%
	String itemId = request.getParameter("itemId");
	
	String sessionItem = (String)session.getAttribute("sessionItem");
	
	// 관리자로 되어있는지 확인, 안되어 있으면 메인 화면으로 이동
	if(sessionItem == null)
	{
		if (itemId != null)
			session.setAttribute("sessionItem", itemId);
	}
%>
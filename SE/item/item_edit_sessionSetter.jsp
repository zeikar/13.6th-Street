<%
	String itemId = request.getParameter("itemId");
	
	session.removeAttribute("sessionItem");
	session.setAttribute("sessionItem", itemId);
	
	response.sendRedirect("/SE/item/item_edit.jsp");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>


<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	boolean checker = false;
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String str[] = request.getParameterValues("itemBox");
	Item temp;
	
	if (str != null)
	{		
		for (int i = 0; i < str.length; i++)
		{	
			checker = ItemController.deleteItem(reqUserId, str[i]);
			
			if (!checker)	
				break;
		}
	}
	
	if (checker)
	{
		String nextURL = "item_supervise.jsp?item_deleteSuccess";
		response.sendRedirect(nextURL);
	}
	
	else
	{
		String nextURL = "item_supervise.jsp?item_deleteFailed";
		response.sendRedirect(nextURL);
	}
%>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>
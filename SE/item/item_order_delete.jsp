<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String reqItemId = request.getParameter("itemId");	
	String postPageUrl = request.getParameter("postPage");
	
	OrderController.orderDelete(reqUserId, reqItemId);
%>
	<div style = "text-align : center;">
<%
	try
	{
		response.sendRedirect("/SE/item/order_list.jsp?deleteSuccess");
	}
	
	catch (Exception e)
	{
		out.println("Class name : " + e.getStackTrace().getClass().getName() + "<br>");
		out.println(e.toString());
		response.sendRedirect("/SE/item/order_list.jsp?deleteFailed");
	}
%>
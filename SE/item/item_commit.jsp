<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/user/admincheck.jsp"%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>
<%@ page import="Item.ItemController" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	boolean checker = false;
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String str[] = request.getParameterValues("itemBox");
	
	ArrayList<String> itemIds = new ArrayList<String>();
	Item temp;
	
	if (str != null)
	{		
		for (int i = 0; i < str.length; i++)
			itemIds.add(str[i]);
	}
	
	if (ItemController.confirmItem(itemIds))
		response.sendRedirect("item_reg_list.jsp?item_acceptSuccess");
	
	else
		response.sendRedirect("item_reg_list.jsp?item_acceptFailed");
%>
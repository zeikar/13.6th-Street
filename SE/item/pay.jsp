<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String reqUserId = (String)session.getAttribute("sessionID");
	
	ArrayList<Item> itemList = new ArrayList<Item>();
	
	int maxNumber = Integer.parseInt(request.getParameter("listMaxNumber"));
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	
	Item temp;
	
	try
	{
		for (int i = 0; i < maxNumber; i++)
		{
			temp = ItemController.getItem(request.getParameter("item" + i));
			
			if (temp != null)
				itemList.add(temp);
		}
		
		
		OrderController.pay(reqUserId, itemList, totalPrice);

		
		response.sendRedirect("order_list.jsp?paySuccess");
	}
	
	catch (Exception e)
	{
		response.sendRedirect("order_list.jsp?payFailed");
	}
%>
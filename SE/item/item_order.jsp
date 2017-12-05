<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file = "/user/logincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%@ page import="Order.OrderController" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String reqItemId = request.getParameter("itemId");	
	
	String search_value = request.getParameter("search_text");
	String encodeValue = URLEncoder.encode(search_value);
	
	String search_type = request.getParameter("search_type");
	
	String inputValue = request.getParameter("search_price");
	
	String ishome = request.getParameter("home");
	String iscart = request.getParameter("cart");
	
	int search_price = 0;
	
	if (inputValue != null && !inputValue.equals("0"))
		search_price = Integer.parseInt(inputValue);
		
	String search_seller = request.getParameter("search_seller_id");
	
	String url = "/SE/item/item_search.jsp?search_text=" + encodeValue;
	
	if (ishome != null)
		url = "/SE/item/item_search.jsp?search_text=";
		
	else
	{
		if (search_type != null)
			url = url + "&search_type=" + search_type;
		
		if (search_price > 0)
			url = url + "&search_price=" + search_price;
		
		if (search_seller != null)
		{
			String encodeSellerId = URLEncoder.encode(search_seller);
			url = url + "&search_seller_id=" + encodeSellerId;
		}
	}
	
	String item_reg_user = ItemController.getItem(reqItemId).itemRegUserId;
	
	boolean checker = false;
	
	try
	{
		if (iscart != null)
			response.sendRedirect("/SE/item/order_list.jsp");
	
		// 중복
		if (item_reg_user.equals(reqUserId))
		{
			url = url + "&SellerOrderInterrupt";
			response.sendRedirect(url);
		}
		
		else if (reqUserId == null)
		{
			url = url + "&item_orderDuplicate";
			response.sendRedirect(url);
		}
		 
		else
		{
			checker = OrderController.orderItem(reqUserId, reqItemId);
			
			if (checker)
			{
				url = url + "&item_orderSuccess";
				response.sendRedirect(url);
			}
			
			else
			{
				url = url + "&item_orderFailed";
				response.sendRedirect(url);
			}
		}
	}
	
	catch (Exception e)
	{
		out.println("Class name : " + e.getStackTrace().getClass().getName() + "<br>");
		out.println(e.toString());
	}
%>
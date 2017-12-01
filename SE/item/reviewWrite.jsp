<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.net.URLEncoder" %>

<%@include file="/common/header.jsp"%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%@ page import="Review.ReviewController" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("euc-kr");
	
	boolean checker = true;
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String itemId = request.getParameter("item_id");
	String context = new String(request.getParameter("reviewContext").getBytes("8859_1"), "UTF-8");
	
	/**/
	String search_value = request.getParameter("search_text");
	String encodedValue = URLEncoder.encode(search_value);
	
	String search_type = request.getParameter("search_type");
	
	String inputValue = request.getParameter("search_price");
	
	String ishome = request.getParameter("home");
	String iscart = request.getParameter("cart");
	
	int search_price = 0;
	
	if (inputValue != null && !inputValue.equals("0"))
		search_price = Integer.parseInt(inputValue);
		
	String search_seller = request.getParameter("search_seller_id");
	
	String url = "search_text=";
		
	if (search_value != null)
	{		
		if (!search_value.equals("null"))
			url = url + encodedValue;
	}
	
	if (search_type != null)
		url = url + "&search_type=" + search_type;
	
	if (search_price > 0)
		url = url + "&search_price=" + search_price;
	
	if (search_seller != null)
		url = url + "&search_seller_id=" + search_seller;
	
	if (ishome != null)
		url = url + "&home";
	
	if (iscart != null)
		url = url + "&cart";
	
	/**/
	
	checker = ReviewController.writeReview(reqUserId, itemId, context);
	
	if (checker)
	{
		response.sendRedirect("item_show_detail.jsp?reviewSuccess&itemId=" + itemId + "&" + url);
	}
	
	else
	{
		response.sendRedirect("item_show_detail.jsp?reviewFailed&itemId=" + itemId + "&" + url);
	}
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file = "/user/logincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<%@ page import="java.net.URLEncoder" %>

<%@ page import="Report.ReportController" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	boolean checker = false;
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String targetItem = request.getParameter("itemId");
	String context = request.getParameter("report_context");
	String encodedContext = URLEncoder.encode(context);
	
	String reason = request.getParameter("report_reason");
	String encodedReason = URLEncoder.encode(reason);
	
	
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
	
	if (ReportController.reportItem(reqUserId, targetItem, reason, context))
	{
		response.sendRedirect("/SE/item/item_show_detail.jsp?success&itemId=" + targetItem + "&" + url);
	}
	
	else
	{
		response.sendRedirect("/SE/item/item_show_detail.jsp?failed&itemId=" + targetItem + "&" + url);
	}
%>
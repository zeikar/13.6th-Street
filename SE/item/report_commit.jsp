<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/user/admincheck.jsp"%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>
<%@ page import="Report.ReportController" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	boolean checker = false;
	
	String number[] = request.getParameterValues("reportNumber");
	ArrayList<String> seletedReportNumber = new ArrayList<String>();
	
	if (number != null)
	{		
		for (int i = 0; i < number.length; i++)
			seletedReportNumber.add(number[i]);
	}
	
	ArrayList<String> itemIdList = new ArrayList<String>();
	ArrayList<String> userIdList = new ArrayList<String>();
	ArrayList<String> dateList = new ArrayList<String>();
	
	String tempItem, tempUser, tempDate;
	
	for (String itor : seletedReportNumber)
	{
		tempItem = request.getParameter("reportItem" + itor);
		tempUser = request.getParameter("reportUser" + itor);
		tempDate = request.getParameter("reportDate" + itor);
		
		itemIdList.add(tempItem);
		userIdList.add(tempUser);
		dateList.add(tempDate);
	}
	
	for (String itor : itemIdList)
	{
		checker = ReportController.acceptReport(itor);
		
		if (checker == false)
			break;
	}
	
	if (checker)
		response.sendRedirect("item_report_list.jsp?reportCommitSuccess");
	
	else
		response.sendRedirect("item_report_list.jsp?reportCommitFailed");
%>
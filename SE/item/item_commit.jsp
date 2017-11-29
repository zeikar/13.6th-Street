<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

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
	{
%>
	<div style = "text-align : center;">
		선택한 물품들이 승인되었습니다. <br><br>
<%
	}
	
	else
	{
%>
	<div style = "text-align : center;">
		선택한 물품들이 승인에 실패하였습니다. <br><br>
<%
	}
%>
		<form action = "/SE/item/item_reg_list.jsp">
			<button> 확인 </button>
		</form>
	</div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
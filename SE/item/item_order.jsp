<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<%@ page import="Order.OrderController" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String reqItemId = request.getParameter("itemId");	
	String postPageUrl = request.getParameter("postPage");
	String search_text = request.getParameter("searchName");
	
	boolean checker = OrderController.orderItem(reqUserId, reqItemId);
%>
	<div style = "text-align : center;">
<%
	try
	{
		if (checker)
		{
%>
			장바구니에 등록되었습니다. <br><br>
			
			<form action = "<%= postPageUrl%>">
				<input type = "hidden" name = "search_text" value = "<%= search_text %>">
				<button> 확인 </button>
			</form>
<%
		}
		
		else
		{
%>
			이미 장바구니에 존재하는 상품이거나 존재하지 않는 상품입니다. <br><br>
			
			<form action = "<%= postPageUrl%>">
				<input type = "hidden" name = "search_text" value = "<%= search_text %>">
				<button> 확인 </button>
			</form>
<%
		}
	}
	
	catch (Exception e)
	{
		out.println("Class name : " + e.getStackTrace().getClass().getName() + "<br>");
		out.println(e.toString());
	}
%>
	</div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
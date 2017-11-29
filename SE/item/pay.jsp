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
	
	for (int i = 0; i < maxNumber; i++)
	{
		temp = ItemController.getItem(request.getParameter("item" + i));
		
		if (temp != null)
			itemList.add(temp);
		
		OrderController.pay(reqUserId, itemList, totalPrice);
	}
%>
	<div style = "text-align : center;">
<%
	try
	{
%>
		주문이 완료 되었습니다! <br><br>
		
		<form action = "/SE/item/order_list.jsp">
			<button> 장바구니 화면으로 </button>
		</form>
		
		<form action = "/SE/index.jsp">
			<button> 메인 화면으로 </button>
		</form>
<%
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
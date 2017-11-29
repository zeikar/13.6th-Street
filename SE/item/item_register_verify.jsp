<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>


<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String reqName = request.getParameter("name");	
	String reqType = request.getParameter("itemtype");
	String reqRegId = request.getParameter("regid");
	
	String reqImage = request.getParameter("image");
	int reqPrice = Integer.parseInt(request.getParameter("price"));
	
	String reqExplain = request.getParameter("explanation");
	
	boolean checker = false;
	
	Item input;
	
	input = ItemController.itemCreateFactoryMethod(reqUserId, reqImage, reqName, reqPrice, reqExplain, reqType, reqRegId);
	
	out.write(input.getType());
	checker = ItemController.requestItem(reqUserId, input);
	
	if (checker)
	{
%>
	<div style = "text-align : center;">
		물품 등록이 완료되었습니다. <br><br>
<%
	}
	
	else
	{
%>
	<div style = "text-align : center;">
		물품 등록 중 에러가 발생하였습니다. <br><br>
<%
	}
%>
		<form action = "/SE/item/item_register.jsp">
			<button> 확인 </button>
		</form>
	</div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
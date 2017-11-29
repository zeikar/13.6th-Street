<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>


<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String reqUserId = (String)session.getAttribute("sessionID");
	String editItemId = (String)session.getAttribute("sessionItem");
	
	String reqName = request.getParameter("name");	
	String reqType = request.getParameter("itemtype");
	String reqRegId = request.getParameter("regid");
	
	String reqImage = request.getParameter("image");
	int reqPrice = Integer.parseInt(request.getParameter("price"));
	
	String reqExplain = request.getParameter("explanation");
	
	boolean checker = false;
	
	Item target = ItemController.getItem(editItemId);
	
	target.name = reqName;
	target.setType(reqType);
	target.setRegId(reqRegId);
	
	target.itemImage = reqImage;
	target.price = reqPrice;
	
	target.explanation = reqExplain;
	
	checker = ItemController.updateItem(reqUserId, target);
	
	if (checker)
	{
%>
	<div style = "text-align : center;">
		물품 정보 수정이 완료되었습니다. <br><br>
<%
	}
	
	else
	{
%>
	<div style = "text-align : center;">
		물품 정보 수정 권한이 없습니다. <br><br>
<%
	}
%>
		<form action = "/SE/item/item_supervise.jsp">
			<button> 확인 </button>
		</form>
	</div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
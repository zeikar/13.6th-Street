<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>


<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	boolean checker = false;
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String str[] = request.getParameterValues("itemBox");
	Item temp;
	
	if (str != null)
	{		
		for (int i = 0; i < str.length; i++)
		{			
			checker = ItemController.deleteItem(reqUserId, str[i]);
			
			if (!checker)	
				break;
		}
	}
	
	if (checker)
	{
%>
	<div style = "text-align : center;">
		선택한 아이템들이 제거되었습니다. <br><br>
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
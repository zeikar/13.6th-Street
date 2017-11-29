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
		선택한 물품이 반려되었습니다. <br><br>
<%
	}
	
	else
	{
%>
	<div style = "text-align : center;">
		선택한 물품 반려가 실패하였습니다. <br><br>
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
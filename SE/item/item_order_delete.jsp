<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String reqUserId = (String)session.getAttribute("sessionID");
	
	String reqItemId = request.getParameter("itemId");	
	String postPageUrl = request.getParameter("postPage");
	
	OrderController.orderDelete(reqUserId, reqItemId);
%>
	<div style = "text-align : center;">
<%
	try
	{
%>
		장바구니에서 제거되었습니다. <br><br>
		
		<form action = "<%= postPageUrl%>">
			<button> 확인 </button>
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
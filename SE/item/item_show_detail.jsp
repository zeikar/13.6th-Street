<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/common/header.jsp"%>

<%@ page import="Item.Item"%>
<%@ page import="Item.ItemController" contentType="text/html; charset=UTF-8" %>

<style>
	img 
	{
		display: block;
		max-width: 50%;
		height: auto;
	}
</style>

<div class = "container">
	<h1> 물품 상세 보기 </h1>
	
	<div class = "row" style = "height : 30px;"> </div>
	
	<div class="col-sm-10 col-sm-offset-1" style = "border : solid grey 5px; border-radius : 15px; padding : 10px;">
<%
	request.setCharacterEncoding("UTF-8");
	
	String LoginedUser = (String)session.getAttribute("sessionID");
	
	String itemId = request.getParameter("itemId");
	String postPageUrl = request.getParameter("postPage");
	String search_value = request.getParameter("searchName");
	
	try
	{
		Item targetItem = ItemController.getItem(itemId);
	
		if (targetItem != null)
		{
%>
	
		<div class = "col-sm-3"">
			<div style = "width : 100%; height : 30%; border : solid grey 1px;">
				<img src = "/SE/pictures/Item/<%= targetItem.itemImage %>" class = "img-responsive">
			</div>
			
			<div style = "height : 10px;"> </div>
			
			<div style = "width : 100%; height : 30%; text-align : center; font-size : 20pt;">
				<%= targetItem.name %>
			</div>
			
			<div class = "row" style = "height : 10px;"> </div>
			
			<div style = "width : 100% height : 30%; text-align : center; font-size : 15pt;">
				판매자 : <%= targetItem.itemRegUserId %> <br>
			</div>
		</div>
		
		<div class = "col-sm-7" style = "font-size : 15pt; padding : 10px;">
			상품 이름 : <%= targetItem.name %> <br>
			상품 타입 : <%= targetItem.getType() %> <br>
			상품 가격 : <%= targetItem.price %> 원 <br>
			현재 상태 : <%= targetItem.itemState %> <br>
			공식 등록 번호 : <%= targetItem.getRegId() %> <br><br>
			
			<span style = "font-size : 20pt;"> 상세 설명 </span>
			
			<br>
				&nbsp&nbsp&nbsp<%= targetItem.explanation %>
		</div>
		
		<div class = "col-sm-2" style = "text-align : center;">
<%
		if (LoginedUser != null)
		{
%>
			<form action = "/SE/item/item_order.jsp" method = "post">
				<input type = "hidden" name = "searchName" value = "<%=search_value%>">
				<input type = "hidden" name = "itemId" value = "<%=itemId%>">
				<input type = "hidden" name = "postPage" value = "/SE/item/item_search.jsp">
				<button class="btn btn-default" type="submit" title = "장바구니에 담기"> <i class="glyphicon glyphicon-shopping-cart" style = "font-size : 30pt;"></i> </button> <br>
			</form>
			
			<br>
			
			<form action = "/SE/item/item_report.jsp" method = "post">
				<input type = "hidden" name = "searchName" value = "<%=search_value%>">
				<input type = "hidden" name = "itemId" value = "<%=itemId%>">
				<input type = "hidden" name = "postPage" value = "/SE/item/item_search.jsp">
				<button class="btn btn-default" type="submit" title = "신고하기"> <i class="glyphicon glyphicon-alert" style = "font-size : 30pt;"></i> </button> <br>
			</form>
<%
		}
		
		else
		{
%>
			
			<button class="btn btn-default" title = "장바구니에 담기" onclick = "alert('로그인 이후 사용하실 수 있습니다!')"> <i class="glyphicon glyphicon-shopping-cart" style = "font-size : 30pt;"></i> </button>
			<br><br>
			<button class="btn btn-default" title = "신고하기" onclick = "alert('로그인 이후 사용하실 수 있습니다!')"> <i class="glyphicon glyphicon-alert" style = "font-size : 30pt;"></i> </button> <br>
<%
		}
%>
		</div>
	
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
	
	<div class="col-sm-10 col-sm-offset-1" style = "border : solid grey 1px; padding : 10px;">
		리뷰란!!
	</div>
</div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file = "/user/logincheck.jsp"%>

<%@ include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>

<%@ page import="Item.Item"%>
<%@ page import="Order.Order"%>

<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("euc-kr");
	
	boolean searchFlag = false;
	
	String LoginedUser = (String)session.getAttribute("sessionID");
%>

<style>
.itemTable:hover
{
	cursor : pointer;
	background-color : #EAEAEA;
}
</style>

<script>
function selectItem(strId, itemId)
{
	var target = document.getElementById(strId);
	var targetValue = document.getElementById(strId + "Value");
	
	if (targetValue.value == "")
	{
		targetValue.value = itemId;
		target.style.backgroundColor = "#EAEAEA";
	}
	
	else
	{
		targetValue.value = "";
		target.style.backgroundColor = "white";
	}
}
</script>

<div class="container">
	<div class="row">
		<section class="content">
			<h1> 장바구니 </h1>
			
<%
            if(request.getParameter("paySuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 결제 </strong>를 성공적으로 마쳤습니다.
            </div>
<%
            }

            if(request.getParameter("payFailed") != null)
            {
%>
			<div class="alert alert-danger alert-dismissable fade in">
                <strong> 결제 </strong>에 실패하였습니다.
            </div>
<%
            }
%>




<%
            if(request.getParameter("deleteSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 주문 </strong>을 제거하였습니다!
            </div>
<%
            }

            if(request.getParameter("deleteFailed") != null)
            {
%>
			<div class="alert alert-danger alert-dismissable fade in">
                <strong> 주문 </strong>을 제거하는데 실패하였습니다.
            </div>
<%
            }
%>




<%
            if(request.getParameter("underflow") != null)
            {
%>
			<div class="alert alert-danger alert-dismissable fade in">
                <strong> 최소 </strong> 하나의 주문을 선택하셔야 합니다.
            </div>
<%
            }
%>


			
			<div class = "row" style = "height : 30px;"> </div>
			
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">			
					<div class="panel-body">
						<div class="pull-right">
							<div class = "row">		
								<div class = "col-sm-8">
									
								</div>
							</div>
						</div>
								
<%		
	try
	{
		int numbering = 0;
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		orderList = OrderController.orderShow(LoginedUser);
		
		for (Order itor : orderList)
			itor.orderItem = ItemController.getItem(itor.getItemId());
		
		if (orderList.size() == 0)
		{
%>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
									<tr>
										<td>
											장바구니가 비어있습니다. <br>
										</td>
									</tr>
<%
		}
		
		else
		{
%>
						<div class = "table-container">
							<table class="table table-filter">
								<tbody>
<%
			for (Order itor : orderList)
			{
%>
										<tr class = "itemTable" id = "item<%= numbering%>th">
											<td>
												<div class = "media" onclick = "location.href = '/SE/item/item_show_detail.jsp?cart&itemId=<%=itor.orderItem.getId()%>'">
													<div class = "media-left">
														<img src = "/SE/pictures/Item/<%= itor.orderItem.itemImage %>" style = "width : 120px; height : 120px;" class="media-photo">
													</div>
													
													<div class = "media-body">
														<h4> <%= itor.orderItem.name %> </h4>
														
														<p class="summary"> 종류 : <%= itor.orderItem.getType() %> </p>
														<p> 판매자 : <%= itor.orderItem.itemRegUserId %> </p>
														
														<div class = "pull-right">
															<%= itor.orderItem.price %>원
														</div>
													</div>
													
													<div class = "media-right">
														
													</div>
												</div>
											</td>
											
											<td class = "align-middle">				
												<form action = "/SE/item/item_show_detail.jsp?cart" method = "post">
													<input type = "hidden" name = "itemId" value = "<%=itor.orderItem.getId()%>">
													<button class="btn btn-default" type="submit" title = "자세히 보기"> <i class="glyphicon glyphicon-search"></i> </button>
												</form>
												
												<form action = "/SE/item/item_order_delete.jsp" method = "post">
													<input type = "hidden" name = "itemId" value = "<%=itor.orderItem.getId()%>">
													<input type = "hidden" name = "postPage" value = "<%=request.getRequestURI()%>">
													<button class="btn btn-default" type="submit" title = "장바구니에서 제거"> <i class="	glyphicon glyphicon-trash"></i> </button>
												</form>
												
												<button class="btn btn-default" type="submit" title = "선택" onclick = "selectItem('item<%=numbering%>th', '<%=itor.orderItem.getId()%>')">
													<i class="	glyphicon glyphicon-ok"></i>
												</button>
											</td>
										</tr>
<%
				numbering++;
			}
%>
										<tr>
											<td class = "pull-right">
												<form action = "/SE/item/order_pay.jsp" method = "post">
													<button class="btn btn-default" type="submit" title = "결제하기"> 선택 항목 결제하기 </button>
													
													<input type = "hidden" name = "listMaxNumber" value = "<%=numbering%>">
<%
			for (int i = 0; i < numbering; i++)
			{
%>
													<input type = "hidden" id = "item<%=i%>thValue" name = "item<%=i%>">
<%
			}
%>
												</form>
											</td>
										</tr>
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
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>


<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
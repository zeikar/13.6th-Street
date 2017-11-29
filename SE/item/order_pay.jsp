<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<style>
.itemTable:hover
{
	background-color : #EAEAEA;
}
</style>

<%
    String name = UserAccountController.getUserName(userId);
    int userPoint = UserAccountController.getUserPoint(userId);
    String creditCardNumber = UserAccountController.getUserCreditCardNumber(userId);
	
    if(creditCardNumber.equals("null"))
        creditCardNumber = "";

    String bankAccountNumber = UserAccountController.getUserBankAccountNumber(userId);
	
    if(bankAccountNumber.equals("null"))
        bankAccountNumber = "";
	
	ArrayList<Item> itemList = new ArrayList<Item>();
	
	int maxNumber = Integer.parseInt(request.getParameter("listMaxNumber"));
	Item temp;
	
	int totalPoint = 0;
	
	for (int i = 0; i < maxNumber; i++)
	{
		temp = ItemController.getItem(request.getParameter("item" + i));
		
		if (temp != null)
		{
			totalPoint += temp.price;
			itemList.add(temp);
		}
	}
%>

<div class="container">
    <div class="row">
        <h2> 상품 결제 </h2>

        <%
        if(request.getParameter("success") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong> 결제 완료! </strong> 저희 13.6th Street를 이용해 주셔서 감사합니다.
        </div>
        <%
        }
        %>
        <%
        if(request.getParameter("error") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong>결제에 실패하였습니다.</strong> 다시 한 번 확인해 주시기 바랍니다.
        </div>
        <%
        }
        %>
        
        <hr />
		
		<form method="post" action="pay.jsp">

            <div class="panel panel-default">
                <div class="panel-heading"> 현재 결제 과정에 있는 물품 목록입니다. </div>
				
                <div class="panel-body">
				
					<div class = "table-container">
						<table class="table table-filter">
							<tbody>
								<input type = "hidden" name = "listMaxNumber" value = "<%=maxNumber%>">
								<input type = "hidden" name = "totalPrice" value = "<%=totalPoint%>">

<%
			int i = 0;
			
			for (Item itor : itemList)	
			{
%>
								<input type = "hidden" name = "item<%=i%>" value = "<%=itor.getId()%>">
								
								<tr class = "itemTable">
									<td>
										<div class = "media">
											<div class = "media-left">
												<img src = "/SE/pictures/Item/<%= itor.itemImage %>" style = "width : 120px; height : 120px;" class="media-photo">
											</div>
											
											<div class = "media-body" style = "padding-left : 50px;">
												<h4> <%= itor.name %> </h4>
												
												<p class="summary"> 종류 : <%= itor.getType() %> </p>
												<p> 판매자 : <%= itor.itemRegUserId %> </p>
												
												<div class = "pull-right">
													<%= itor.price %> 포인트
												</div>
											</div>
											
											<div class = "media-right"> </div>
										</div>
									</td>
								</tr>								
<%
				i++;
			}
%>
							</tbody>
						</table>
					</div>
                </div>
				
				<div class="panel-default">
					<div class="panel-heading" style = "text-align : right; font-size : 15pt;"> 소모 포인트 : <span id = "point_total"> <%= totalPoint%> </span></div>
				</div>
				
				<div class="panel-default" style = "text-align : right; font-size; 15pt;">
					<div class="panel-heading"><%=name%> 님이 소유 중인 포인트 : <span id = "point_user"> <%= userPoint%> </span> </div>
				</div>
            </div>
			
			<div class = "panel panel-default">
				<div class = "panel-heading" style = "text-align : left; font-size : 15pt;">
<%
			if (userPoint >= totalPoint)
			{
%>
					결제후 남는 포인트 : <%= userPoint - totalPoint %>
<%
			}
			
			else
			{
%>
					<font color = "red"> 결제 불가! </font>
<%
			}
%>
				</div>
				
				<div class = "panel-body">					
					<div class = "panel-default" style = "text-align : right; padding-right : 15px;">
<%
			if (userPoint >= totalPoint)
			{
%>
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">결제</button>
<%	
			}
			
			else
			{
%>
						<button type="button" disabled="disabled" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">결제</button>
<%
			}
%>
						<input type = "button" class="btn btn-info btn-lg" onclick = "cancel()" value = "취소">
					</div>
				</div>
			</div>
			
			<hr />

			<!-- Trigger the modal with a button -->
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">결제 확인</h4>
                        </div>
						
                        <div class="modal-body">
                            <p><%=name%> 님이 요청하신 결제 내역은 다음과 같습니다.</p>
							
							<p> 물품 내역 <br>
<%
				for (Item itor : itemList)	
				{
%>
							&nbsp&nbsp&nbsp<%= itor.name %> <br>
<%
				}
%>
							</p>
							
                            <p> 소모 포인트 : <span> <%= totalPoint%> </span></p>
                            <p> 보유 포인트 : <span> <%= userPoint%> </span></p>
							<p> 결제 후 포인트 : <span> <%= userPoint - totalPoint %> </span></p>
                        </div>
						
                        <div class="modal-footer">   
                            <p>정말로 결제하시겠습니까?</p>
                            <button type="submit" id="submit" class="btn btn-success">결제</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
function cancel()
{
	location.href = '/SE/item/order_list.jsp';
}

$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});

</script>

<%@include file="/common/footer.jsp"%>
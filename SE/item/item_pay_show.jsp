<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Pay.Pay"%>

<%@include file = "/user/logincheck.jsp"%>

<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>

<%	
	String LoginedUser = (String)session.getAttribute("sessionID");
	
    ArrayList<Pay> itemList = PayController.getCustomerPayList(LoginedUser);
%>

<div class="container">
    <div class="row">
	<div class = "col-sm-10 col-md-offset-1">
        <h2> 물품 구매 내역 </h2>
        <hr />
        <div class="table-responsive">
            <form class="form-inline" action="item_delete.jsp" method="post">
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>						
                        <tr>
							<th>no.</th>
							<th>물품 이름</th>
							
                            <th>판매자 아이디</th>
							<th> 가격 </th>
                            <th> 거래 날짜</th>
                        </tr>
                    </thead>
                    <tbody>					
<%
						if (itemList.size() == 0)
						{
%>
							<tr>
								<td colspan = "8" style=  "text-align : center;">
									등록된 상품이 없습니다.
								</td>
							</tr>
<%
						}
						
						else
						{
							int no = 0;
							
							for (Pay itor : itemList)
							{
								no++;
%>
                        <tr>
							<td> No.<%= no %></td>
							<td> <%= ItemController.getItem(itor.getItemId()).name %> </td>
							<td> <%= UserAccountController.getUserName(itor.getSellerId()) %></td>
                            <td> <%= itor.price %> </td>
							
							<td> <%= itor.payDate %> </td>
                        </tr>                       
                    <%
							}
					%>
						<input type = "hidden" name = "maxNumber" value = <%=no%>>
					<%
						}
                    %>
                    </tbody>
                </table>
				
                <hr/>
				
				<input type="button" class="btn btn-default" value = "메인 화면으로" onclick = "location.href = '/SE/index.jsp'" />
            </form>
        </div>
    </div>
	</div>
</div>

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

// Listen for click on toggle checkbox
$('#select-all').click(function(event) {  
    var all = this.checked;

    // Iterate each checkbox
    $(':checkbox').each(function() {
        this.checked = all;
    });
});
</script>

<%@include file="/common/footer.jsp"%>
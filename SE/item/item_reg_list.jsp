<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Item.Item"%>

<%@include file="/user/admincheck.jsp"%>

<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>

<script>
function movePage(str)
{
	if (str == "reject")
		document.mainForm.action = '/SE/item/item_reject.jsp';
		
	else if (str == "commit")
		document.mainForm.action =  '/SE/item/item_commit.jsp';
}
</script>

<%	
	String LoginedUser = (String)session.getAttribute("sessionID");
	
    ArrayList<Item> itemList = ItemController.searchItem("", null, 0, "Registration", null);
	
	
%>

<div class="container">
	<div class = "col-sm-10 col-md-offset-1">
    <div class="row">
        <h2> 물품 승인 대기 리스트 </h2>
        <hr />
        <div class="table-responsive">
            <form class="form-inline" name = "mainForm" method="post">
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>						
                        <tr>
                            <th> <input type="checkbox" name="select-all" id="select-all" /></th>
							
							<th>no.</th>
							<th>물품 타입</th>
							
                            <th>이름</th>
							<th>공식 등록 번호</th>
							
                            <th>판매자 아이디</th>
                        </tr>
                    </thead>
                    <tbody>					
<%
						if (itemList.size() == 0)
						{
%>
							<tr>
								<td colspan = "8" style=  "text-align : center;">
									승인 대기 중인 상품이 없습니다.
								</td>
							</tr>
<%
						}
						
						else
						{
							int no = 0;
							
							for (Item itor : itemList)
							{
								no++;
%>
                        <tr>
                            <td> <label><input type="checkbox" name="itemBox" value="<%= itor.getId() %>"/> </label> </td>
							<td> <%= no %> </td>
							<td> <%= itor.getType() %></td>
							
                            <td> <%= itor.name %> </td>
							<td> <%= itor.getRegId() %> </td>
							
                            <td> <%= itor.itemRegUserId %> </td>
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
				
				<input type="submit" class="btn btn-success" value="선택한 물품 반려" onclick = "movePage('reject')"/>
				<input type="submit" class="btn btn-success" value="선택한 물품 승인" onclick = "movePage('commit')"/>
				<input type="reset" class="btn btn-default" value = "선택 취소" />
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
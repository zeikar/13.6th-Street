<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Item.Item"%>

<%@include file="/item/sellerCheck.jsp"%>

<%@include file="/item/item_session.jsp"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>

<%	
	String LoginedUser = (String)session.getAttribute("sessionID");
	
    ArrayList<Item> itemList = ItemController.getSellingItem(LoginedUser);
%>

<div class="container">
	<div class = "col-sm-10 col-md-offset-1">
    <div class="row">
        <h2> 물품 관리 </h2>
		
<%
            if(request.getParameter("item_deleteSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong>선택한 물품</strong>이 삭제되었습니다.
            </div>
<%
            }

            if(request.getParameter("item_deleteFailed") != null)
            {
%>
			<div class="alert alert-alert alert-dismissable fade in">
                <strong>삭제</strong>에 실패하였습니다.
            </div>
<%
            }

			
			
			
			
			
            if(request.getParameter("item_registerSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 선택한 물품 </strong>이 등록 신청이 되었습니다. 관리자의 신청이 들어오면 판매가 가능해집니다.
            </div>
<%
            }

            if(request.getParameter("item_registerFailed") != null)
            {
%>
			<div class="alert alert-alert alert-dismissable fade in">
                <strong> 선택한 물품 </strong>의 등록 신청이 실패했습니다.
            </div>
<%
            }



            if(request.getParameter("item_updateSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 선택한 물품 </strong>의 정보가 수정되었습니다.
            </div>
<%
            }

            if(request.getParameter("item_updateFailed") != null)
            {
%>
			<div class="alert alert-alert alert-dismissable fade in">
                <strong> 선택한 물품 </strong>의 수정이 실패했습니다.
            </div>
<%
            }
%>
        <hr />
		<form class="form-inline" action="item_delete.jsp" method="post">
			<div class="table-responsive">
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>
						<tr>
							<th colspan = "8" style = "text-align : right;">
								<input type="button" class="btn btn-success" value="판매 물품 추가" onclick = "location.href = '/SE/item/item_register.jsp'"/>
							</th>
						</tr>
						
                        <tr>
                            <th>
								All
								<input type="checkbox" name="select-all" id="select-all" />
                            </th>
							
							<th>no.</th>
							<th>물품 타입</th>
							
                            <th>이름</th>
							<th>공식 등록 번호</th>
							
                            <th>상태</th>
                            <th>가격</th>
							<th></th>
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
							
                            <td> <%= itor.itemState %> </td>
							<td> <%= itor.price %> </td>
							
							<td style = "text-align : center;">
<%
								if (itor.itemState.equals("Registration") || itor.itemState.equals("Selling"))
								{
%>
								<input type="button" class="btn btn-success" value="수정" onclick = "location.href = '/SE/item/item_edit_sessionSetter.jsp?itemId=<%=itor.getId()%>'"/>
<%
								}
								
								else
								{
%>
								<input type="button" class="btn btn-failed" value="수정" />
<%
								}
%>
							</td>
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
				
				<input type="submit" class="btn btn-success" value="선택한 물품 삭제" />
				<input type="reset" class="btn btn-default" value = "선택 취소" />
				<input type="button" class="btn btn-default" value = "메인 화면으로" onclick = "location.href = '/SE/index.jsp'" />
			</div>
		</form>
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
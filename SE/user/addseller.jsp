<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/admincheck.jsp"%>
<%@include file="/common/header.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    List<String> idList = UserAccountController.getSellerRequestUserIdList();
%>

<div class="container">
    <div class="row">
        <h2>판매자 등록 승인</h2>

		
		<%
         if(request.getParameter("rejecterror") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong> 판매자 등록 승인 거절 실패!</strong> 다시 확인해 주세요.
        </div>
        <%
        }
        %>
        <%
        if(request.getParameter("error") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong> 판매자 등록 실패!</strong> 다시 확인해 주세요.
        </div>
        <%
        }
        if(request.getParameter("success") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong> 판매자 등록 성공!</strong> 해당 사용자들을 판매자로 등록하였습니다.
        </div>
        <%
        }
        %>
        <%
         if(request.getParameter("rejectsuccess") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong> 판매자 등록 승인 거부 성공!</strong> 해당 사용자들을 판매자 등록 승인을 거부하였습니다.
        </div>
        <%
        }
        %>

        <hr />
        <div class="table-responsive">
            <form class="form-inline" name="admin_user" action="addsellerproc.jsp" method="post">
                <input type="hidden" id="flag" name="flag" value="true" />
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="select-all" id="select-all" /> 전체 선택
                            </th>
                            <th>No.</th>
                            <th>사용자 ID</th>
                            <th>이름</th>
                            <th>판매자 등록 접수일</th>
                            <th>등록 내용</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        int no = 0;
						
						if(idList.size() == 0)
						{
					%>
					
						<tr>
                            <td colspan=6 style="text-align:center;"> 판매자 등록 신청한 사용자가 없습니다. </td>
                        </tr>     
					
					
					<%
						}
						
                        for (String id :
                                idList)
                        {
                            no++;
                            String name = UserAccountController.getUserName(id);

                            // 판매자 접수일, 내역 추가 바람!
                            String sellRequestTime = UserAccountController.getUserSellerTime(id);
                            String sellRequestContent = UserAccountController.getUserSellerContent(id);
                    %>
                        <tr>
                            <td>                                
                                <label><input type="checkbox" name="seller" value="<%=id%>"/> 판매자 등록 승인</label>
                            </td>
                            <td> <%=no%> </td>
                            <td> <%=id%> </td>
                            <td> <%=name%></td>
                            <td> <%=sellRequestTime%> </td>
                            <td> <%=sellRequestContent%> </td>
                        </tr>                       
                    <%
                    
                        }
                    %>
                    </tbody>
                </table>
                <hr />
                <input type="submit" class="btn btn-success" value="선택한 사용자를 판매자로 등록" onclick="changeMode(true)" />
                <input type="submit" class="btn btn-danger" value="선택한 사용자 판매자 등록 거절" onclick="changeMode(false)" />
                <input type="reset" class="btn btn-default" />
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

function changeMode(flag)
{
    if(flag)
    {
        $('#flag').val('true');
    }
    else
    {
        $('#flag').val('false');
    }
}
</script>

<%@include file="/common/footer.jsp"%>
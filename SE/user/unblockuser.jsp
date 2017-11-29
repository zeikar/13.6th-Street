<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/admincheck.jsp"%>
<%@include file="/common/header.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    List<String> idList = UserAccountController.getBlockedUserIdList();
%>

<div class="container">
    <div class="row">
        <h2>사용자 제재 철회</h2>

        <%
        if(request.getParameter("error") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong> 사용자 제재 철회 실패!</strong> 다시 확인해 주세요.
        </div>
        <%
        }
        if(request.getParameter("success") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong> 사용자 제재 철회 성공!</strong> 해당 사용자들의 제재를 철회하였습니다.
        </div>
        <%
        }
        %>

        <hr />
        <div class="table-responsive">
            <form class="form-inline" name="admin_user" action="unblockuserproc.jsp" method="post">
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="select-all" id="select-all" /> 전체 선택
                            </th>
                            <th>No.</th>
                            <th>사용자 ID</th>
                            <th>이름</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        int no = 0;
                        for (String id :
                                idList)
                        {
                            no++;
                            String name = UserAccountController.getUserName(id);

                            String sellRequestTime = UserAccountController.getUserSellerTime(id);
                            String sellRequestContent = UserAccountController.getUserSellerContent(id);
                    %>
                        <tr>
                            <td>                                
                                <label><input type="checkbox" name="unblock" value="<%=id%>"/> 사용자 제재 철회</label>
                            </td>
                            <td> <%=no%> </td>
                            <td> <%=id%> </td>
                            <td> <%=name%></td>
                        </tr>                       
                    <%
                    
                        }
                    %>
                    </tbody>
                </table>
                <hr />
                <input type="submit" class="btn btn-success" value="선택한 사용자에 대한 제재 철회" />
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
</script>

<%@include file="/common/footer.jsp"%>
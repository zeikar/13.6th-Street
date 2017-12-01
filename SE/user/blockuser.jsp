<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/admincheck.jsp"%>
<%@include file="/common/header.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    List<String> idList = UserAccountController.getReportedUserIdList();
%>

<div class="container">
    <div class="row">
        <h2>사용자 제재</h2>

        <%
        if(request.getParameter("error") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong> 사용자 제재 실패!</strong> 다시 확인해 주세요.
        </div>
        <%
        }
        if(request.getParameter("success") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong> 사용자 제재 성공!</strong> 해당 사용자들을 제재하였습니다.
        </div>
        <%
        }
        %>

        <hr />
        <div class="table-responsive">
            <form class="form-inline" name="admin_user" action="blockuserproc.jsp" method="post">
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="select-all" id="select-all" /> 전체 선택
                            </th>
                            <th>No.</th>
                            <th>사용자 ID</th>
                            <th>신고자 ID</th>
                            <th>신고 접수일</th>
                            <th>신고 이유</th>
                            <th>신고 내역</th>
                        </tr>
                    </thead>
                    <tbody>
                   <%
                        int no = 0;
						
						if(idList.size() == 0)
						{
					%>
					
						<tr>
                            <td colspan=7 style="text-align:center;"> 신고를 당한 사용자가 없습니다. </td>
                        </tr>     
					
					
					<%
						}
						
						
                        for (String id :
                                idList)
                        {
                            no++;
                            List<String> reportUserList = UserAccountController.getReportUserIdList(id);
                            List<String> reportDateList = UserAccountController.getReportDateList(id);
                            List<String> reportContentList = UserAccountController.getReportContentList(id);
                            List<String> reportReasonList = UserAccountController.getReportReasonList(id);

                            for (int i = 0; i < reportUserList.size(); ++i)
                            {
                                if(i == 0)
                                {
                    %>
                        <tr>
                            <td>                                
                                <label><input type="checkbox" name="block" value="<%=id%>"/> 사용자 제재</label>
                            </td>
                            <td> <%=no%> </td>
                            <td> <%=id%> </td>
                            <td> <%=reportUserList.get(i)%></td>
                            <td> <%=reportDateList.get(i)%> </td>
                            <td> <%=reportReasonList.get(i)%> </td>
                            <td> <%=reportContentList.get(i)%> </td>
                        </tr>                       
                    <%
                                }
                                else
                                {
                    %>
						<tr>
                            <td> </td>
                            <td> </td>
                            <td> <%=id%> </td>
                            <td> <%=reportUserList.get(i)%></td>
                            <td> <%=reportDateList.get(i)%> </td>
                            <td> <%=reportReasonList.get(i)%> </td>
                            <td> <%=reportContentList.get(i)%> </td>
						</tr> 

                    <%
                                    
                                }
                            }
                        }
                    %>
                    </tbody>
                </table>
                <hr />
                <input type="submit" class="btn btn-success" value="선택한 사용자 제재" />
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
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
        <h2>판매자 등록 승인</h2>
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
                            <th>이름</th>
                            <th>판매자 등록 접수일</th>
                            <th>등록 내용</th>
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

                            // 판매자 접수일, 내역 추가 바람!
                    %>
                        <tr>
                            <td>                                
                                <label><input type="checkbox" name="block" value="<%=id%>"/> 사용자 제재</label>
                            </td>
                            <td> <%=no%> </td>
                            <td> <%=id%> </td>
                            <td> <%=name%></td>
                            <td> <a href="#stay_here" data-placement="right" data-toggle="tooltip" title="2017년 11월 16일 17시 08분 12초">1주 전</a> </td>
                            <td> 돈이 필요합니다 </td>
                        </tr>                       
                    <%
                    
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
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@ page import="Report.Report"%>
<%@ page import="Item.Item"%>

<%@include file="/user/admincheck.jsp"%>

<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>

<script>
function movePage(str)
{
	if (str == "reject")
		document.mainForm.action = '/SE/item/report_reject.jsp';
		
	else if (str == "commit")
		document.mainForm.action =  '/SE/item/report_commit.jsp';
}
</script>

<%	
    ArrayList<Report> reportList = new ArrayList<Report>();
	ArrayList<Item> itemList = new ArrayList<Item>();
	Item temp;
	
	reportList = ReportController.getReport();
	
	for (Report itor : reportList)
	{
		temp = ItemController.getItem(itor.getItemId());
		itemList.add(temp);
	}
%>

<div class="container">
	<div class = "col-sm-10 col-md-offset-1">
    <div class="row">
        <h2> 물품 신고 리스트 </h2>

<%
            if(request.getParameter("reportCommitSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 신고 </strong> 승인이 성공하였습니다.
            </div>
<%
            }

            if(request.getParameter("reportCommitFailed") != null)
            {
%>
			<div class="alert alert-danger alert-dismissable fade in">
                <strong> 신고 </strong> 승인이 실패하였습니다.
            </div>
<%
            }
%>




<%
            if(request.getParameter("reportDenySuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 신고 </strong> 반려가 성공하였습니다.
            </div>
<%
            }

            if(request.getParameter("reportDenyFailed") != null)
            {
%>
			<div class="alert alert-danger alert-dismissable fade in">
                <strong> 신고 </strong> 반려가 실패하였습니다.
            </div>
<%
            }
%>
		
        <hr />
        <div class="table-responsive">
            <form class="form-inline" name = "mainForm" method="post">
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>						
                        <tr>
                            <th> <input type="checkbox" name="select-all" id="select-all" /></th>
							
							<th>no.</th>
							<th>물품 명</th>
							
                            <th>출원 번호</th>
							<th>판매자 아이디</th>
							
                            <th>신고자 아이디</th>
							<th>신고 사유</th>
							<th>신고 내용</th>
                        </tr>
                    </thead>
                    <tbody>					
<%
						if (reportList.size() == 0)
						{
%>
							<tr>
								<td colspan = "8" style=  "text-align : center;">
									신고 된 물품 사항이 없습니다.
								</td>
							</tr>
<%
						}
						
						else if (itemList.size() == 0)
						{
%>
							<tr>
								<td colspan = "8" style=  "text-align : center;">
									신고 물품을 로딩하는 중 에러가 발생하였습니다.
								</td>
							</tr>
<%
						}
						
						else
						{
							int no = 0;
							
							for (int i = 0; i < reportList.size(); i++)
							{
%>
                        <tr>
							<input type = "hidden" name = "reportItem<%=i%>" value = "<%= itemList.get(i).getId() %>">
							<input type = "hidden" name = "reportUser<%=i%>" value = "<%= reportList.get(i).getUserId() %>">
							<input type = "hidden" name = "reportDate<%=i%>" value = "<%= reportList.get(i).reportDate %>">
						
                            <td> <label><input type="checkbox" value = "<%=i%>" name="reportNumber" /> </label> </td>
							<td> <%= i+1 %> </td>
							
							<td> <%= itemList.get(i).name %></td>
                            <td> <%= itemList.get(i).getRegId() %> </td>
							
							<td> <%= itemList.get(i).itemRegUserId %> </td>
							<td> <%= reportList.get(i).getUserId() %> </td>
							
                            <td> <%= reportList.get(i).reason %> </td>
							<td> <%= reportList.get(i).context %> </td>
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
				
				<input type="submit" class="btn btn-success" value="선택한 신고 내역 반려" onclick = "movePage('reject')"/>
				<input type="submit" class="btn btn-success" value="선택한 신고 내역 승인" onclick = "movePage('commit')"/>
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
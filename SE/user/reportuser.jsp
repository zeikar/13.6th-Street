<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/logincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

    String search_id;

    if(request.getParameter("search_id") == null)
    {
        search_id = "";
    }
	else
    {
	    search_id = request.getParameter("search_id");
    }
%>

<div class="container">
    <div class="row">
        <h2>사용자 신고</h2>
        
        <%
        if(request.getParameter("error") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong><%=request.getParameter("error")%> 사용자 신고 실패!</strong> 다시 확인해 주세요.
        </div>
        <%
        }
        else if(request.getParameter("success") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong><%=request.getParameter("success")%> 사용자 신고 성공!</strong> 해당 사용자를 신고하였습니다.
        </div>
        <%
        }
        else if(search_id.equals(""))
        {
        %>
        <div class="alert alert-warning alert-dismissable">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             신고할 <strong>사용자의 ID</strong> 를 검색하세요.
        </div>
        <%
        }
        else
        {
        %>
        <div class="alert alert-info alert-dismissable">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong> <%= search_id %> </strong> 로 검색한 결과입니다.
        </div>
        <%
        }
        %>
        <hr />
    
        <div class = "row">		
            <div class = "col-sm-5">
                <form action = "/SE/user/reportuser.jsp" method = "get">				
                    <div class = "input-group">
                        <div class = "input-group-text">
                            <input name = "search_id" type="text" class="form-control" placeholder="사용자 ID 검색" value = "<%= search_id%>">
                        </div>                    
                        <div class = "input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>            
        </div>

        <hr />

        <%

        String name = UserAccountController.getUserName(search_id);

        if (!name.equals("null") && !name.equals("관리자"))
        {
        %>

        <form name="delete_user" action="reportuserproc.jsp" method="post">
            <div>                
                <input type="hidden" name="userid" value="<%=search_id%>" />
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>사용자 ID</th>
                            <th>이름</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>                            
                            <td> <%=search_id%> </td>
                            <td> <%=name%> </td>
						</tr>                         
                    </tbody>
                </table>

                <hr />
				<div class="row">
					<div class="form-group col-md-6">
						<label for="report_reason">신고 이유를 선택하세요</label>
						<select class="form-control" id="report_reason" name="report_reason" id="report_reason">					
							<option value="욕설/음란물 사용"> 욕설/음란물 사용 </option>
							<option value="스팸 사용자"> 스팸 사용자 </option>
							<option value="적절하지 못한 물품 판매"> 적절하지 못한 물품 판매 </option>
							<option value="기타"> 기타 </option>
						</select>
					</div>
					<div class="form-group col-md-6">
						<label for="report_reason">신고 내용을 입력하세요</label>
						<input class="form-control" type="text" id="report_content" name="report_content" placeholder="신고 내용을 입력하세요." />				
					</div>
				</div>
				<hr />

                <button type="button" id="pay_btn" class="btn btn-danger" data-toggle="modal" data-target="#myModal">해당 사용자 신고</button>
                <a href="reportuser.jsp" class="btn btn-default" role="button">초기화</a>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">사용자 신고 확인</h4>
                        </div>
                        <div class="modal-body">
                            <p><%=name%> (ID : <%=search_id%>) 님을 신고합니다.</p>
							<p>신고 이유 : <span id="report_reason_text">욕설/음란물 사용</span></p>
							<p>신고 내역 : <span id="report_content_text"></span></p>
                        </div>
                        <div class="modal-footer">   
                            <p>정말로 신고하시겠습니까?</p>
                            <button type="submit" id="submit" class="btn btn-danger">신고</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <%
        }
        else if(!search_id.equals(""))
        {
        %>
        <div class="alert alert-warning alert-dismissable">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             ID가 <strong><%=search_id%></strong> 인 사용자가 없습니다.
        </div>
        <%
        }
        %>
    </div>
</div>

<script>

$('#report_reason').change(function(){ 
	$('#report_reason_text').html($(this).val());
});

$('#report_content').keyup(function(){ 
	$('#report_content_text').html($(this).val());
});

function validateForm()
{
	$('#submit').text("신고 중...");
	$('#submit').prop('disabled', true);
	return true;
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
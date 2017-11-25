<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/admincheck.jsp"%>
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
        <h2>사용자 삭제</h2>
        
        <%
        if(search_id.equals(""))
        {
        %>
        <div class="alert alert-warning alert-dismissable">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             삭제할 <strong>사용자의 ID</strong> 를 검색하세요.
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
                <form action = "/SE/user/deleteuser.jsp" method = "get">				
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

        if (!name.equals("null"))
        {
        %>
        <div class="table-responsive">
            <form class="form-inline" name="delete_user" action="" method="post">
                <input type="hidden" name="userid" value="<%=search_id%>" />
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>사용자 ID</th>
                            <th>이름</th>
                            <th>신고 접수일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>                            
                            <td> <%=search_id%> </td>
                            <td> <%=name%> </td>
                            <td> <a href="#stay_here" data-placement="right" data-toggle="tooltip" title="2017년 11월 16일 17시 08분 12초">1주 전</a> </td>
                        </tr>                         
                    </tbody>
                </table>
                <hr />
                <input type="submit" class="btn btn-success" value="선택한 사용자 삭제" />
                <a href="deleteuser.jsp" class="btn btn-default" role="button">초기화</a>
            </form>
        </div>
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

<%@include file="/common/footer.jsp"%>
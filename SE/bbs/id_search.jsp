<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.net.URLDecoder" %> 
<% //request.setCharacterEncoding("euc-kr"); // 인코딩 %>

<div class="container">
    <div class="row">
        <h2>사용자 찾기</h2>
        
        
        <div class="alert alert-warning alert-dismissable">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             쪽지를 보낼 <strong>사용자의 ID</strong> 를 검색하세요.
        </div>
        
        <hr />
    
        <div class = "row">		
            <div class = "col-sm-5">
                <form action = "id_search_DB.jsp" method = "get">			
                    <div class = "input-group">
                        <div class = "input-group-text">
                            <input name = "search_id" type="text" class="form-control" placeholder="사용자 ID 검색" value = "">
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

        
    </div>
</div>

<%@include file="/common/footer.jsp"%>


</body>
</html>
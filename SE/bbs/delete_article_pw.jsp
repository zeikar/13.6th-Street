<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>

<title>글 삭제 - 패스워드</title>

<div class="container">
    <div class="row main">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="panel-heading ">
                <div class="panel-title text-center">
                    <h1 class="title">패스워드 입력</h1>
                    <hr />
                </div>
            </div> 

            <div class="main-login main-center">
                <form method="post" action="delete_article_DB.jsp">
                   <input type="hidden" name ="id" value="<%=request.getParameter("id") %>">
                    <div class="form-group">
                        <label for="password" class="cols-sm-2 control-label">비밀번호</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" name="password" id="password"  placeholder="비밀번호를 입력하세요"/>
                            </div>
                        </div>
                    </div>

                    <hr />

                    <div class="form-group ">
                        <button type="submit" id="submit" class="btn btn-success btn-lg btn-block login-button">글 삭제</button>
                    </div>                    
                </form>
                <div class="text-center">
                <a href="read_article.jsp?id=<%=request.getParameter("id") %>"><button type="submit" id="submit" class="btn btn-danger">돌아가기</button></a>
           		</div> 
            </div>
        </div>
    </div>
</div>


<%@include file="/common/footer.jsp"%>
</body>
</html>
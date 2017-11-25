<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/loginchecknot.jsp"%>
<%@include file="/common/header.jsp"%>

<div class="container">
    <div class="row main">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="panel-heading ">
                <div class="panel-title text-center">
                    <h1 class="title">13.6th Street 로그인</h1>
                    <hr />
                </div>
            </div> 

            <%
            if(request.getParameter("fail") != null)
            {
            %>
            <div class="alert alert-danger alert-dismissable fade in">
                <strong>로그인 실패!</strong> 아이디 혹은 비밀번호를 확인해 주세요.
            </div>
            <%
            }
            
            if(request.getParameter("register") != null)
            {
            %>
            <div class="alert alert-success alert-dismissable fade in">
                <strong>회원가입을 축하합니다!</strong> 아이디와 비밀번호를 입력하여 로그인해 주세요.
            </div>
            <%
            }
            %>
            <div class="main-login main-center">
                <form method="post" action="loginproc.jsp"
                 onsubmit="return validateForm()">
                    
                    <div class="form-group">
                        <label for="userid" class="cols-sm-2 control-label">ID</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="userid" id="userid"  placeholder="아이디를 입력하세요"/>
                            </div>
                        </div>
                    </div>

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
                        <button type="submit" id="submit" class="btn btn-success btn-lg btn-block login-button">로그인</button>
                    </div>                    
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function validateForm()
{
    var userid = $('#userid').val();
    var password = $('#password').val();

    if(!userid.match(/[a-zA-Z0-9_]+/))
	{		
		alert("아이디를 다시 입력하세요");
		$('#userid').val('');
		$('#userid').focus();
		return false;
	}
	if(!password.match(/[a-zA-Z0-9_]+/))
	{		
		alert("비밀번호를 다시 입력하세요");
		$('#password').val('');
		$('#password').focus();
		return false;
	}
	  
	$('#submit').text("로그인 중...");
	$('#submit').prop('disabled', true);
	return true;
}
</script>

<%@include file="/common/footer.jsp"%>
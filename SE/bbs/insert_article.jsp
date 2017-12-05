<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>

<script> // 내용의 value값이 없으면 작성을 막는다. 
function restrict(){
	
	var subject = document.getElementsByName("subject")[0].value;
	var pw = document.getElementsByName("password")[0].value;
	var context = document.getElementsByName("content")[0].value;
	
	if(subject == "" || pw == "" || context == "")
		{ // 아무것도 입력되지 않았다면. 
			alert("입력하지 않은 항목이 있습니다!");
		}
	else{ // 입력되었으면 전송.
		$("#Articleform").submit();
	}
}
</script>

  <%
  String test;
  test = (String)session.getAttribute("sessionID");
  if (test == null) {
      // null이 허락되지 않은 접근을 할 경우, 
  %>
			<div class="alert alert-danger alert-dismissable fade in" align = "center">
      			 <strong>로그인을 하지 않으면 접근할 수 없습니다!</strong>
    		</div>
    		<meta http-equiv="refresh" content="1;url=http://210.94.210.250:8080/SE/user/login.jsp">
 <% 
	}
  else{
 %>

<div class="container">
 <h2>글 작성 및 수정</h2> 
	<div class="alert alert-warning">
  <strong>주의!</strong> 이용 약관을 위반한 게시글은 경고 없이 삭제됩니다!
	</div>
	
<form name = "Articleform" id = "Articleform" method="post" action="insert_article_DB.jsp">
    <!--처리하는 페이지로 정보를 보낸다! -->
   <input type="hidden" name="id" id="id" value="${sessionScope.sessionID}">
    <!--아이디 -->
   <table class="table table-bordered" width="700" border="3" bordercolor="lightgray" align="center">
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="subject" id="subject" class="form-control" type="text" size="70" maxlength="100" value=""
                placeholder="제목을 입력하세요. ">
            </td>        
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="content" id="content" cols="72" rows="20" class="form-control"
                placeholder="내용을 입력하세요. "></textarea>            
            </td>        
        </tr>
        <tr>
            <td id="title">
          비밀번호 입력
            </td>
            <td>
                <input type="text" name="password" id="password" class="form-control" 
                placeholder="비밀번호를 입력하세요. ">
            </td>    
        </tr>
    </table>    
	</form>
	
	<button type="button" name="submit" class="btn btn-info" onClick = "restrict()">
 	<span class="glyphicon glyphicon-write"></span> 완료
	</button>
 		
	
	<a href="bbs.jsp">
	<button type="button" class="btn btn-danger">
 	<span class="glyphicon glyphicon-write"></span> 취소
	</button>
 	</a>

</div>
<%
  }
%>

<%@include file="/common/footer.jsp"%>

</body>
</html>
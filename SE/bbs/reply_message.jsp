<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>

<script> // 내용의 value값이 없으면 작성을 막는다.
function close_W(){
	
	window.open('', '_self', '');
	window.close();
}

function restrict(){
	
	var sender = document.getElementsByName("sender")[0].value;
	var receiver = document.getElementsByName("receiver")[0].value;
	var context = document.getElementsByName("content")[0].value;
	
	if(sender == "" || receiver == "" || context == "")
		{ // 아무것도 입력되지 않았다면. 
			alert("입력하지 않은 항목이 있습니다!");
		}
	else{ // 입력되었으면 전송.
		$("#Articleform").submit();	
		alert("전송이 성공했습니다!");
		// 여기에 닫는 거 추가하면 아예 값이 전송이 안됨; 
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
 <h2>쪽지 보내기</h2> 
	<div class="alert alert-warning">
  <strong>주의!</strong> 부적절한 내용의 쪽지를 보내면 신고를 당할 수 있습니다!
	</div>
	
<form name = "Articleform" id = "Articleform" method="post" action="message_send_DB.jsp">
    <!--처리하는 페이지로 정보를 보낸다! -->
   <input type="hidden" name="id" id="id" value="${sessionScope.sessionID}">
    <!--아이디 -->
   <table class="table table-bordered" width="700" border="3" bordercolor="lightgray" align="center">
            <tr>
            <td id="title">
                작성자
            </td>
            <td>
                <input name="sender" id="sender" class="form-control" type="text" size="70" maxlength="100" value="${sessionScope.sessionID}"
                readonly>
            </td>        
        	</tr>
          
            <tr>
            <td id="title">
                보낼 사람
            </td>
            <td>
                <input name="receiver" id="receiver" class="form-control" type="text" size="70" maxlength="100" value="<%= request.getParameter("sender")%>"
                readonly>
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
    </table>    
	</form>
	
	<div align="right" >
	<button type="button" name="submit" class="btn btn-info" onClick = "restrict()">
 	<span class="glyphicon glyphicon-write"></span> 완료
	</button>
 		
	<button type="button" class="btn btn-danger" onClick = "close_W()">
 	<span class="glyphicon glyphicon-write"></span> 취소
	</button>

 	</div>
</div>

<%} %>

<%@include file="/common/footer.jsp"%>

</body>
</html>
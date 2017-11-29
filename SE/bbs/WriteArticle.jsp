<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>

<div class="container">
 <h2>글 작성 및 수정</h2>
 
	<div class="alert alert-warning">
  <strong>주의!</strong> 이용 약관을 위반한 게시글은 경고 없이 삭제됩니다!
	</div>
	
<form method="post" action="WriteArticle_M.jsp">
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

	<a href="bbs.jsp">
	<button type="submit" name = "submit" class="btn btn-info">
 	<span class="glyphicon glyphicon-write"></span> 완료
	</button>
 	</a>
 	
 	</form>
	
	<a href="bbs.jsp">
	<button type="button" class="btn btn-danger">
 	<span class="glyphicon glyphicon-write"></span> 취소
	</button>
 	</a>

</div>


<%@include file="/common/footer.jsp"%>

</body>
</html>
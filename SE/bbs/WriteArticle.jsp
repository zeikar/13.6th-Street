<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<div class="container">
 <h2>글 작성 및 수정</h2>
 
	<div class="alert alert-warning">
  <strong>주의!</strong> 이용 약관을 위반한 게시글은 경고 없이 삭제됩니다!
	</div>
	
<form method="post" action="BoardWriteAction.bo" name="boardForm" enctype="multipart/form-data">
    <input type="hidden" name="board_id" value="${sessionScope.sessionID}">
    <table class="table table-bordered" width="700" border="3" bordercolor="lightgray" align="center">
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="board_subject" class="form-control" type="text" size="70" maxlength="100" value=""/
                placeholder="제목을 입력하세요. ">
            </td>        
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="board_content" cols="72" rows="20" class="form-control"
                placeholder="내용을 입력하세요. "></textarea>            
            </td>        
        </tr>
        <tr>
            <td id="title">
                파일첨부
            </td>
            <td>
                <input type="file" name="board_file" />
            </td>    
        </tr>
    </table>    
    </form>

	<a href="bbs.jsp">
	<button type="button" class="btn btn-info">
 	<span class="glyphicon glyphicon-write"></span> 완료
	</button>
 	</a>
	
	<a href="bbs.jsp">
	<button type="button" class="btn btn-danger">
 	<span class="glyphicon glyphicon-write"></span> 취소
	</button>
 	</a>

</div>


<%@include file="/common/footer.jsp"%>

</body>
</html>
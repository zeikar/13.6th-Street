<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>

<style>
#search{
width: 50%;
}
</style>

<div class="container">
 <h2>자유 게시판</h2>
 
<div class="alert alert-warning alert-dismissable">
 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>주의!</strong> 이용 약관을 위반한 게시글은 경고 없이 삭제됩니다!
</div>
  
  <table class="table table-bordered"> <!-- 각각을 나눈다. -->
    <thead>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>조회수</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>1</td>
        <td>John</td>
        <td>2</td>
        <td>11/4</td>
      </tr>
      <tr>
      	<td>2</td>
        <td>2</td>
        <td>Mary</td>
        <td>3</td>
        <td>11/4</td>
      </tr>
      <tr>
      	<td>3</td>
        <td>3</td>
        <td>July</td>
        <td>4</td>
        <td>11/4</td>
      </tr>
    </tbody>
  </table>
  
 <a href="WriteArticle.jsp">
<button type="button" class="btn btn-info">
 <span class="glyphicon glyphicon-write"></span> 글쓰기
</button>
 </a>
  
<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#search">
  <span class="glyphicon glyphicon-search"></span> 검색
</button>
<div id="search" class="collapse">
<form>
  <div class="input-group" id ="search">
    <input type="text" class="st-default-search-input form-control" placeholder="Search">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
</form>
 </div>
 
  <div class="text-center">
  <ul class="pagination", >
    <li class="active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
  </ul>
  </div>
</div>

<%@include file="/common/footer.jsp"%>

</body>
</html>
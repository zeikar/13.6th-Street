<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>

<%
if(request.getParameter("error") != null)
{
%>
<div class="container">
  <div class="alert alert-danger">
      <strong>에러!</strong> 비정상적인 접근입니다.
  </div>
</div>
<%
}
%>
<%
if(request.getParameter("login") != null)
{
%>
<div class="container">
  <div class="alert alert-success alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
    <strong>로그인 성공!</strong> <%=UserAccountController.getUserName((String)session.getAttribute("sessionID"))%> 님 환영합니다.
  </div>
</div>
<%
}
%>
<%
if(request.getParameter("logout") != null)
{
%>
<div class="container">
  <div class="alert alert-info alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
    <strong>로그아웃 되었습니다.</strong> 안녕히 가세요!
  </div>
</div>
<%
}
%>
<%
if(request.getParameter("admin") != null)
{
%>
<div class="container">
  <div class="alert alert-danger">
      <strong>에러!</strong> 관리자 권한이 필요합니다.
  </div>
</div>
<%
}
%>

<div class="jumbotron text-center">
  <h1>Welcome To 13.6th Street!</h1>
  <p>Resize this responsive page to see the effect!</p> 
</div>


<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>Column 1</h3>
      <p>Lorem ipsum dolor..</p>
      <p>Ut enim ad..</p>
    </div>
    <div class="col-sm-4">
      <h3>Column 2</h3>
      <p>Lorem ipsum dolor..</p>
      <p>Ut enim ad..</p>
    </div>
    <div class="col-sm-4">
      <h3>Column 3</h3> 
      <p>Lorem ipsum dolor..</p>
      <p>Ut enim ad..</p>
    </div>
  </div>
</div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/logincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<%
String name = UserAccountController.getUserName(userId);
int point = UserAccountController.getUserPoint(userId);
%>

<div class="container">
    <div class="row">
        <h2>포인트 환급</h2> 
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading"><%=name%> 님이 소유 중인 포인트</div>
            <div class="panel-body"><%=point%> 포인트</div>
        </div>
    </div>
</div>

<%@include file="/common/footer.jsp"%>
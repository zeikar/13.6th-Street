<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>

<%@ page import="Item.ItemController" contentType="text/html; charset=UTF-8" %>
<%@ page import="Order.OrderController" contentType="text/html; charset=UTF-8" %>
<%@ page import="Pay.PayController" contentType="text/html; charset=UTF-8" %>
<%@ page import="Report.ReportController" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html>
    <head>
        <title>13.6th Street</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="/SE/css/main.css">
        <link rel="stylesheet" href="/SE/css/register.css">
		
		<script src = "/SE/js/header_find_item.js"> </script>
    </head>
<body>


<%
	String requestURL = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	if (queryString != null) requestURL += "?" + queryString;
%>
    
<nav class="navbar navbar-inverse">
	<div class = "container">
		<div class = "navbar-header">
			<a href="#" class="top" style = "visibility : hidden">Top</a>
			<a class = "navbar-brand" href="/SE/index.jsp">13.6th Street</a>
		</div>	
		<%
		// 인덱스아니면 작은 검색창
		if(requestURL.indexOf("index.jsp") == -1)
		{
		%>

		<form class = "navbar-form navbar-left" action = "/SE/item/item_search.jsp" method = "get">	
			<div class="input-group">
				<input name = "search_text" type="text" class="form-control" placeholder="물품 검색">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>

		<%
		}

		String userId = (String)session.getAttribute("sessionID");
		
		if(userId == null)
		{
		%>
		<ul class="nav navbar-nav navbar-right">
			<li> <a href="/SE/user/login.jsp?next=<%=requestURL%>"> <span class="glyphicon glyphicon-log-in"></span> 로그인 </a> </li>
			<li> <a href="/SE/user/register.jsp"> <span class="glyphicon glyphicon-user"></span> 회원 가입 </a> </li>
		</ul>
		<%
		}
		else
		{
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					바로가기 메뉴
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li> <a href="/SE/item/order_list.jsp"> <span class="glyphicon glyphicon-shopping-cart"></span> 장바구니 </a> </li>
					<li> <a href="/SE/bbs/bbs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> 게시판 </a> </li>
					<li class="divider"></li>			
					<li> <a href="/SE/user/reportuser.jsp"> <span class="glyphicon glyphicon-user"></span> 사용자 신고 </a> </li>
				</ul>
			</li>
			
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<% out.write(UserAccountController.getUserName(userId) + "님 환영합니다!"); %>
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li> <a href="/SE/user/pointcharge.jsp"> <span class="glyphicon glyphicon-credit-card"></span> 포인트 충전 </a> </li>
					<li> <a href="/SE/user/pointrefund.jsp"> <span class="glyphicon glyphicon-transfer"></span> 포인트 환급 </a> </li>
					
					<li class="divider"></li>
<%
			// 판매자 권한을 가진 유저의 메뉴
			if (UserAccountController.isUserSeller(userId))
			{
%>
					<li> <a href="/SE/item/item_supervise.jsp"> <span class="	glyphicon glyphicon-star"></span> 판매 물품 관리 </a> </li>
					<li> <a href="/SE/item/item_sold_show.jsp"> <span class="	glyphicon glyphicon-star"></span> 판매 내역 보기 </a> </li>
<%
			}
%>		
					<li> <a href="/SE/item/item_pay_show.jsp"> <span class="	glyphicon glyphicon-star"></span> 물품 구매 내역 보기 </a> </li>
					
					<li class="divider"></li>
					
					<li> <a href="/SE/user/edituser.jsp"> <span class="glyphicon glyphicon-user"></span> 회원정보 수정 </a> </li>
					<li> <a href="/SE/user/logout.jsp"> <span class="glyphicon glyphicon-log-in"></span> 로그아웃 </a> </li>					
				</ul>
			</li>

			<% 
			// 관리자 메뉴
			if(UserAccountController.isUserAdmin(userId))
			{
			%>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">관리자 페이지
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/SE/user/addseller.jsp">판매자 등록 승인</a></li>
					<li><a href="/SE/user/blockuser.jsp">사용자 제재</a></li>
					<li><a href="/SE/user/unblockuser.jsp">사용자 제재 철회</a></li>
					<li><a href="/SE/user/deleteuser.jsp">사용자 삭제</a></li>
					
					<li class = "divider"> </li>
					
					<li><a href="/SE/item/item_reg_list.jsp">물품 판매 승인</a></li>
					<li><a href="/SE/item/item_report_list.jsp">물품 판매 신고 확인</a></li>
				</ul>
			</li>
			<%
			}
			%>
		</ul>
		<%
		}
		%>
	</div>
</nav>

<div style="margin-top:-20px;"> </div>

<%
if(request.getParameter("loginsuccess") != null)
{
	if(requestURL.indexOf("index.jsp") == -1)
	{
%>
<div style="margin-top: 30px;" class="container">
  <div class="alert alert-success alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
    <strong>로그인 성공!</strong> <%=UserAccountController.getUserName((String)session.getAttribute("sessionID"))%> 님 환영합니다.
  </div>
</div>
<%
	}
	else
	{		
%>
<div id="fkmsg" style="margin-top: 60px; z-index: 0" class="container navbar-fixed-top">
  <div class="alert alert-success alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
    <strong>로그인 성공!</strong> <%=UserAccountController.getUserName((String)session.getAttribute("sessionID"))%> 님 환영합니다.
  </div>
</div>
<%
	}
}
%>
<script>
setTimeout(myFunction, 1500);
function myFunction() {
    $('#fkmsg').css('display', 'none');
}
</script>
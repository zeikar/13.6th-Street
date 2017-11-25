<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
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
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">-->
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="/SE/css/main.css">
        <link rel="stylesheet" href="/SE/css/register.css">
		
		<script src = "/SE/js/header_find_item.js"> </script>
    </head>
<body>

    
<nav class="navbar navbar-inverse">
	<div class = "container">
		<div class = "navbar-header">
			<a class = "navbar-brand" href="/SE/index.jsp">13.6th Street</a>
		</div>	

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
		String userId = (String)session.getAttribute("sessionID");
		if(userId == null)
		{
		%>
		<ul class="nav navbar-nav navbar-right">
			<li> <a href="/SE/user/login.jsp"> <span class="glyphicon glyphicon-log-in"></span> 로그인 </a> </li>
			<li> <a href="/SE/user/register.jsp"> <span class="glyphicon glyphicon-user"></span> 회원 가입 </a> </li>
		</ul>
		<%
		}
		else
		{
		%>
		<ul class="nav navbar-nav navbar-right">
			<p class="navbar-text">
			<%
				out.write(UserAccountController.getUserName(userId) + "님 환영합니다!");
			%>
			</p>
			<li> <a href="/SE/user/edituser.jsp"> <span class="glyphicon glyphicon-user"></span> 회원정보 수정 </a> </li>
			<li> <a href="/SE/user/logout.jsp"> <span class="glyphicon glyphicon-log-in"></span> 로그아웃 </a> </li>
			<% 
			if(UserAccountController.isUserAdmin(userId))
			{
			%>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">관리자 페이지
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/SE/user/addseller.jsp">판매자 등록 승인</a></li>
					<li><a href="/SE/user/blockuser.jsp">사용자 제재</a></li>
					<li><a href="#">몰라</a></li>
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

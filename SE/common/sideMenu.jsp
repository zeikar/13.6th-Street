<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type = "text/css">
/* 사이드 리모컨 전체 */
#sideMenu_all
{
	position : fixed;
	
	background-color : white;
	
	padding : 10px;
	
	width : 190px;
	height : 220px;
	
	visibility : hidden;
	
	border : solid #8C8C8C 5px;
	box-shadow : 5px 5px 0px 0px #D5D5D5;
	border-radius : 15px;
	
	top : 50%;
	right : 5%;
}

/* 사이드바 제목 */
#sideMenu_title
{
	text-align : center;
	
	font-size : 16pt;
}


/* 홈 버튼 아이콘 디자인 */
.glyphicon.glyphicon-home.quick_button
{
	font-size : 25pt;
	text-align : cetner;
	line-height : 50px;
}

.glyphicon.glyphicon-home.quick_button:hover
{
	color : red;
	cursor : pointer;
}


/* 장바구니 아이콘 디자인 */
.glyphicon.glyphicon-shopping-cart.quick_button
{
	font-size : 25pt;
	text-align : center;
	line-height : 50px;
}

.glyphicon.glyphicon-shopping-cart.quick_button:hover
{
	color : red;
	cursor : pointer;
}


/* 게시판 아이콘 디자인 */
.glyphicon.glyphicon-list-alt.quick_button
{
	font-size : 25pt;
	text-align : center;
	line-height : 50px;
}

.glyphicon.glyphicon-list-alt.quick_button:hover
{
	color : red;
	cursor : pointer;
}


/* 화살표 버튼 : 상단 */
.glyphicon.glyphicon-chevron-up.arrow_button
{
	font-size : 20pt;
	cursor : pointer;
}

.glyphicon.glyphicon-chevron-up.arrow_button:hover
{
	color : red;
}


/* 화살표 버튼 : 하단 */
.glyphicon.glyphicon-chevron-down.arrow_button
{
	font-size : 20pt;
	cursor : pointer;
}

.glyphicon.glyphicon-chevron-down.arrow_button:hover
{
	color : red;
}


/* 화살표 버튼 div : 색상 조정*/
.col-sm-8.arrowDiv
{
	text-align : center;
	
	background-color : #EAEAEA;
	
	border-radius : 15px;
}
</style>

<script src = "http://code.jquery.com/jquery-3.2.1.js"></script>

<script type = "text/javascript">

	window.onresize = function()
	{
		var windowSize = $(window).width();
		var menuAll = $('#sideMenu_all');
		
		if (windowSize < 1000)
			menuAll.css("visibility", "hidden");
		
		else
			menuAll.css("visibility", "visible");
	}
	
	window.onload = function()
	{
		var windowSize = $(window).width();
		var menuAll = $('#sideMenu_all');
		
		if (windowSize < 1000)
			menuAll.css("visibility", "hidden");
		
		else
			menuAll.css("visibility", "visible");
	}
	
	function gotoHome()
	{
		window.location.href = "/SE/index.jsp";
	}
	
	function gotoBoardMain()
	{
		window.location.href = "/SE/bbs/bbs.jsp";
	}
	
	function gotoCartMain()
	{
		window.location.href = "/SE/item/order_list.jsp";
	}
	
	function gotoDown()
	{
		$('html, body').animate({ scrollTop: $(document).height()},800);
		return false;
	}
	
	function gotoUp()
	{
		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		return false;
	}
	</script>

<div class = "container" 
	 id = "sideMenu_all">
	 
	 <div class = "row" style = "height : 10px;">
	 </div>

	<% // title %>
	<div class = "row">
		<div class = "col-sm-12" id = "sideMenu_title"> Quick Menu </div>
	</div>
	
	<div class = "row" style = "height : 10px;"> </div>
	
	<% // up arrow %>
	<div class = "row">
		<div class = "col-sm-2"> </div>
		<div class = "col-sm-8 arrowDiv">
			<i class = "glyphicon glyphicon-chevron-up arrow_button" onclick = "gotoUp()" title = "화면 맨 위로 이동"> </i>
		</div>
		<div class = "col-sm-2"> </div>
	</div>
		
	<div class = "row" style = "height : 10px;"> </div>
	
	<% // icon buttons %>
	<div class = "row">		
		<div class = "col-sm-4">
			<span class = "glyphicon glyphicon-shopping-cart quick_button" onclick = "gotoCartMain()" title = "장바구니 화면으로 이동"></span>
		</div>
			
		<div class = "col-sm-4">
			<span class = "glyphicon glyphicon-home quick_button" onclick = "gotoHome()" title = "메인화면으로 이동"></span>
		</div>
		
		<div class = "col-sm-4">
			<span class = "glyphicon glyphicon-list-alt quick_button" onclick = "gotoBoardMain()" title = "게시판 메인으로 이동"></span>
		</div>
		
		
	</div>
		
	<div class = "row" style = "height : 10px;"> </div>
	
	<% // down arrow %>
	<div class = "row">
		<div class = "col-sm-2"> </div>
		<div class = "col-sm-8 arrowDiv">
			<i class = "glyphicon glyphicon-chevron-down arrow_button" onclick = "gotoDown()" title = "화면 맨 아래로 이동"> </i>
		</div>
		<div class = "col-sm-2"> </div>
	</div>
</div>

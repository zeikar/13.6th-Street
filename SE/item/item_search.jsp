<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@include file="/common/header.jsp"%>

<%
	request.setCharacterEncoding("euc-kr");
	
	String search_value = request.getParameter("search_text");
%>

<div class="container">
	<h2>물품 검색 결과</h2>
 
	<div class="alert alert-warning alert-dismissable">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong> <%= search_value %> </strong> 로 검색한 결과입니다. dho rufrhk
	</div>
  
	<div class = "row">		
		<div class = "col-sm-5">
			<form action = "/SE/item/item_search.jsp" method = "get">				
				<div class = "input-group">
					<div class = "input-group-btn">
						<button type = "button" class = "btn btn-default"> 저작권 </button>
						<button type = "button" class = "btn btn-default"> 특허 </button>
						<button type = "button" class = "btn btn-default" style = "background-color : #EAEAEA; font-weight : bold"> 모두 </button>
					</div>
					
					<div class = "input-group-text">
						<input name = "search_text" type="text" class="form-control" placeholder="물품 검색" value = "<%= search_value%>">
					</div>
				
					<div class = "input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
					
					
				</div>
			</form>
		</div>
		
		<div class = "col-sm-5"> </div>
		
		
	</div>
		
	<div class = "row">
		<div class = "col-sm-2">
			상세 검색 버튼
		</div>
		
		<div class = "col-sm-3">
			검색 창 part
		</div>
		
		<div class = "col-sm-1">
			검색 옵션
		</div>
		
		<div class = "col-sm-1">
			검색 버튼
		</div>
		
		<div class = "col-sm-5">
		</div>
	</div>
	
<%
	// 각 검색 내역에 대한 코드
	try
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//"jdbc:mysql://localhost:8080/SE?autoReconnect=true"
		String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
		stmt = conn.createStatement();
		
		String sql = "select * from Item where item_name like '%" + search_value + "%'";
		
		rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
%>
	<div class = "row">
		<div class = "col-sm-3">
			<%= rs.getString("item_name") %>
		</div>
		
		<div class = "col-sm-3">
			<%= rs.getString("item_explanation") %>
		</div>
		
		<div class = "col-sm-3">
			<%= rs.getString("item_price") %>
		</div>
	</div>
<%
		}
	}
	
	catch (Exception e)
	{
		out.println("Searching Error : " + e.getMessage());
	}
%>
<div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
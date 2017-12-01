<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ page import = "java.sql.*"%>

<script> // 내용의 value값이 없으면 작성을 막는다. 
function restrict(){
	
	var subject = document.getElementsByName("subject")[0].value;
	var pw = document.getElementsByName("password")[0].value;
	var context = document.getElementsByName("content")[0].value;
	
	if(subject == "" || pw == "" || context == "")
		{ // 아무것도 입력되지 않았다면. 
			alert("입력하지 않은 항목이 있습니다!");
		}
	else{ // 입력되었으면 전송.
		$("#Articleform").submit();
	}
}
</script>

<style>
#Date{
width: 50%;
}
#Author{
width: 50%
}
</style>
 
 <%
 	String subject = "", content="", date="", pw = "", user="";
 	String c_content="", c_date="", c_pw = "", c_user="";	// 댓글용
 
	Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null; // 조회수 늘리는 용도. 
    Statement stmt3 = null; // 댓글 불러오는 용도. 
    ResultSet rs = null;
    ResultSet rs2 = null;
  	int num = 0;
    
    int id = Integer.parseInt(request.getParameter("id")); // 누른 글 번호를 가져온다.
 	// 이제 인트니까 이거 필요없을 것 같은데.. 
 try
 {
    String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
    stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
    stmt2 = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
    stmt3 = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
    String sql = "select * from Article where article_id = " + id;
    String sql2 = "update Article set article_hits = article_hits + 1 where article_id = " + id;  
    String sql3 = "select * from Comment where comment_board_id = " + id; 
    // "select * from Article order by article_id asc";
    // 검색하고 내림차순으로 글들 정렬. 
    // 누른 글 번호의 댓글을 가져욘다. 
    rs = stmt.executeQuery(sql);
    stmt2.executeUpdate(sql2); // 조회수 1 증가! 
    rs2 = stmt3.executeQuery(sql3);
    
 } // 데이터의 접근 권한 획득. 
 catch (ClassNotFoundException e)
 {
    e.printStackTrace();
 }
 catch (SQLException e)
 {
    e.printStackTrace();
 }
 
    while(rs.next())
    {
        user = rs.getString("article_user_id"); // 작성자 아이디  
        subject = rs.getString("article_title"); // 제목 
       	content = rs.getString("article_context"); // 내용 
        pw = rs.getString("article_password"); // 패스워드 
        date = rs.getString("article_date"); // 작성일
    }
 %>
 
<div class="container">
 	<h2>글 열람</h2>
	<div> <!-- class = "row" 하면 벌어짐. -->
		<div class="alert alert-info alert-dismissable col-sm-6" id = "Author">
 			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong> 작성자 : <%= user %> </strong>
		</div>

		<div class="alert alert-info alert-dismissable col-sm-6" id = "Date" style="background-color:skyblue">
 			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong> 작성일 : <%= date %></strong>  
		</div>
	</div>

<div class="panel panel-default">
  	<div class="panel-heading"> 
  		<%= subject %>  
  	</div>
  	
  	<div class="panel-body">	
  		<%= content %> 
  </div>
</div>
	
	<a href="bbs.jsp">
	<button type="button" class="btn btn-danger">
 	<span class="glyphicon glyphicon-write"></span> 돌아가기!
	</button>
 	</a>
	
	<a href="delete_article_pw.jsp?id=<%= id %>">
 	<button type="button" class="btn btn-danger pull-right btn-sm"> 글 삭제 </button>
 	</a>
 	<!-- vertical-align 사용도 좋음. --> 
 	
 	<a href="modify_article_pw.jsp?id=<%= id %>">
  	<button type="button" class="btn btn-danger pull-right btn-sm"> 글 수정 </button>  
  	</a>
  	
	<%
		/*
	    rs.first(); // 처음 레코드로 이동!
        row = rs.getRow(); // 현재 레코드의 행 번호 반환! 즉 첫 레코드 번호를 row로.
        rs.beforeFirst(); // 처음 레코드의 이전으로 이동!
        */
        
        while(rs2.next())
        {
            // String c_content="", c_date="", c_pw = "", c_user="";
            // c_pw = rs.getString("comment_password_id");
        
    %>
	<!-- 코멘트 while()할 곳.-->
	<div>
		<hr/>
		  <div>
				<div class="media">
					<div class="media-body">
						<h4 class="media-heading"> <%= rs2.getString("comment_user_id") %><small><i> <%= rs2.getString("comment_date")%></i></small></h4>
					<p> <%= rs2.getString("comment_context")%> </p>
					</div>
				</div>
		  </div>

	<%
  	String test;
	String user_id = rs2.getString("comment_user_id");
  	test = (String)session.getAttribute("sessionID");
  	
  	if(test == null){test = "";}
  	// 로그인을 안한 상태면, nullpointer 오류를 막기 위해 공백을 만든다.
  	if (test.equals(user_id)) {
      // 댓글 작성자인 경우만 수정, 삭제가 가능함
  	%>
	<a href="comment_delete_DB.jsp?Date=<%= rs2.getString("comment_date")%>&id=<%=id%>">
 	<button type="button" class="btn btn-warning pull-right btn-sm"> 댓글 삭제 </button>
 	</a>
  	<button type="button" class="btn btn-default pull-right btn-sm" data-toggle="collapse" data-target="#<%=num%>"> 댓글 수정 </button>
	  	<div id="<%=num%>" class="collapse"> <!-- 수정링! -->
	  <div class="row">
	    <hr/>
		<form name = "modify" action = "comment_modify_DB.jsp" method = "post">
			<div class = "col-sm-8">				
				<textarea class = "form-control" id = "modifyContext<%=3 %>>" name = "modifyContext" style="resize:none" required></textarea>
			</div>
			<!-- 업데이트니까 내용만 보내면 됨. -->
			<div class = "col-sm-2">
				<input type = "submit" class = "form-control" value = "댓글 수정"> 
			</div>
		</form>
 	  </div>
	</div>
	</div>
	
	<% 
        }
  	
	%>
	
	<% 
        num = num + 1;
        }
	%>
	<!-- 코멘트 while()할 곳. -->
	
	<!-- 코멘트 다는 곳. -->
	<div class="row">
	  <hr/>
		<form action = "comment_DB.jsp" method = "post">
			<div class = "col-sm-8">
				<input type = "hidden" id = "Article_id" name = "Article_id" value = <%= id %>>
				<input type = "hidden" id = "user_id" name = "user_id" value = "${sessionScope.sessionID}">
				
				<textarea class = "form-control" id = "commentContext" name = "commentContext" style="resize:none" required></textarea>
			</div>
			
			<div class = "col-sm-2">
				<input type = "submit" class = "form-control" value = "댓글 작성"> 
			</div>
		</form>
 	</div>
 	<!-- 코멘트 다는 곳. -->
 </div>
	
	<%@include file="/common/footer.jsp"%>
</body>
</html>
<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ page import = "java.sql.*"%>

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
 	
	Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    int id = Integer.parseInt(request.getParameter("id")); // 누른 글 번호를 가져온다.
 	
 try
 {
    String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
    stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
    String sql = "select * from Article where article_id = " + id;
    // 검색하고 내림차순으로 글들 정렬. 
    rs = stmt.executeQuery(sql);
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
        user = rs.getString("article_user_id"); // 제목 
        subject = rs.getString("article_title"); // 제목 
       	content = rs.getString("article_context"); // 내용 
        pw = rs.getString("article_password"); // 패스워드 
        date = rs.getString("article_date"); // 작성일
    }
 %>
 
 <div class="container">
 <h2>글 열람</h2>
<div clss = row>
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
 	</div>
	
	<%@include file="/common/footer.jsp"%>
</body>
</html>
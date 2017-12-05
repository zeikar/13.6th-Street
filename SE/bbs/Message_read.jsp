<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ page import = "java.sql.*"%>
<script>
function close_W(){
	
	window.open('', '_self', '');
	window.close();
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
 	String sender = "", content="", receiver="";
 	String M_date = request.getParameter("date");
	Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
  	int num = 0;
    
 try
 {
    String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
    stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
    String sql = "select * from Message where message_date = "+ "'" + M_date + "'";
    // "select * from Article order by article_id asc";
    // 검색하고 내림차순으로 글들 정렬. 
    // 누른 글 번호의 댓글을 가져욘다. 
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
        sender = rs.getString("message_sender_id"); // 보낸 사람  
        receiver = rs.getString("message_receiver_id"); // 받는 사람 
       	content = rs.getString("message_context"); // 내용 
        M_date = rs.getString("message_date"); // 작성일
    }
 %>
 
<div class="container">
 	<h2>쪽지 읽기</h2>
	<div> <!-- class = "row" 하면 벌어짐. -->
		<div class="alert alert-info alert-dismissable col-sm-6" id = "Author">
  			<strong> 보낸 사람 : <%= sender %> </strong>
		</div>

		<div class="alert alert-info alert-dismissable col-sm-6" id = "Date" style="background-color:skyblue">
  			<strong> 작성일 : <%= M_date %></strong>  
		</div>
	</div>

<div class="panel panel-default">
  	<div class="panel-heading"> 
  		받는 사람 : <%= receiver %>  
  	</div>
  	
  	<div class="panel-body">	
  		<%= content %> 
  </div>
</div>
	
	<div align = "center">
	<a href = "reply_message.jsp?sender=<%= sender %>">
	<button type="button" class="btn btn-success">
 	<span class="glyphicon glyphicon-write"></span> 답장!
	</button>
	</a>
	
	<button type="button" class="btn btn-danger" onclick = "close_W()">
 	<span class="glyphicon glyphicon-write"></span> 닫기!
	</button>
	</div>

	
 	
 </div>
	
	<%@include file="/common/footer.jsp"%>
</body>
</html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ page import = "java.sql.*"%>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String subject = "", content="", date="", pw = "", user="";
    
    int id = Integer.parseInt(request.getParameter("id")); 
    // 누른 글 번호를 가져온다.
    
    try
    {
       String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
       stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
       String sql = "select * from Article where article_id = " + id;
       // 저장된 글 수를 카운트하여 cnt로 하고, 가장 큰 id값을 max_id로 한다. 
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
    
    pw = request.getParameter("password");
    String nextURL = "../index.jsp?error";
    // 기본값은 강제리턴. 
    while(rs.next()) {
        if(!pw.equals(rs.getString("article_password")))
        { // 입력된 비밀번호와 답을 비교해 보고 아니면 강제로 리턴시킨다. 
            response.sendRedirect(nextURL);
        %>
        <% 
        }
    	else
    	    {
    	%>
<div class="container">
 <h2>글 작성 및 수정</h2>
 
	<div class="alert alert-warning">
  <strong>주의!</strong> 이용 약관을 위반한 게시글은 경고 없이 삭제됩니다!
	</div>
	
<form method="post" action="modify_article_DB.jsp">
    <!--처리하는 페이지로 정보를 보낸다! -->
   <table class="table table-bordered" width="700" border="3" bordercolor="lightgray" align="center">
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="subject" id="subject" class="form-control" type="text" size="70" maxlength="100"
                placeholder="제목을 입력하세요. " value ="<%= rs.getString("article_title")%>">
            </td>        
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="content" id="content" cols="72" rows="20" class="form-control"
                placeholder="내용을 입력하세요. "><%= rs.getString("article_context")%></textarea>            
            </td>        
        </tr>
        <tr>
            <td id="title">
          비밀번호 입력
            </td>
            <td>
                <input type="text" name="password" id="password" class="form-control" 
                placeholder="비밀번호를 입력하세요. " value ="<%= rs.getString("article_password")%>">
            </td>    
        </tr>
    </table>    

	<input type="hidden" name ="id" id ="id" value="<%=request.getParameter("id")%>">
	<button type="submit" name = "submit" class="btn btn-info">
 	<span class="glyphicon glyphicon-write"></span> 완료
	</button>
 	
 	<% 
 	// String flag = request.getParameter()
 	
 	%>
 	
 	</form>
	
	<a href="bbs.jsp">
	<button type="button" class="btn btn-danger">
 	<span class="glyphicon glyphicon-write"></span> 돌아가기
	</button>
 	</a>

</div>
	<% 
    	  }
    	}
	stmt.close();
	conn.close();
    %>

<%@include file="/common/footer.jsp"%>

</body>
</html>
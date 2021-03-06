<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
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
    // 기본값은 강제리턴. 
    while(rs.next()) {
        if(!pw.equals(rs.getString("article_password")))
        { // 입력된 비밀번호와 답을 비교해 보고 아니면 강제로 리턴시킨다.      
        %>
            <div class="alert alert-danger alert-dismissable fade in" align = "center">
      			 <strong>비밀번호가 틀렸습니다! 다시 입력해 주세요.</strong> 1초 뒤 돌아갑니다.
    		</div>
        <meta http-equiv="refresh" content="1;url=delete_article_pw.jsp?id=<%=id%>">
        <% 
        }
    	else
    	    {
    	    	String sql_ = "delete from Article where article_id = " +id;
    	    	try{
    	    	    	stmt2 = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
    	    	    	stmt2.executeUpdate(sql_);
    	    	}
    	    	catch(Exception e){
    	    	  		out.println("오류가 발생했습니다!");
    	    	}
    	%>
    	    <div class="alert alert-danger alert-dismissable fade in" align = "center">
      			 <strong>삭제 완료!</strong>
    		</div>
    		<meta http-equiv="refresh" content="1;url=bbs.jsp">
	<%   
    	    }
    	}
    
    	stmt.close();
    	conn.close();
    %>
    

<%@include file="/common/footer.jsp"%>

</body>
</html>
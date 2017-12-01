<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ page import = "java.sql.*"%>

<%
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
    
    String Date = request.getParameter("Date");
    String id = request.getParameter("id");
    // 누른 글 날짜를 가져온다. 
    
    try
    {
       String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
       stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
       String sql = "delete from Comment where comment_date = " + "'" +Date + "'";
       // 저장된 글 수를 카운트하여 cnt로 하고, 가장 큰 id값을 max_id로 한다. 
       stmt.executeUpdate(sql);
    } // 데이터의 접근 권한 획득. 
    catch (ClassNotFoundException e)
    {
       e.printStackTrace();
    }
    catch (SQLException e)
    {
       e.printStackTrace();
    }
    
    String next = "read_article.jsp?id=" + id;
    response.sendRedirect(next);
    
    	stmt.close();
    	conn.close();
    	
    %>
    

<%@include file="/common/footer.jsp"%>

</body>
</html>
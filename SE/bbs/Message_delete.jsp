<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ page import = "java.sql.*"%>

<%
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
    
    String[] Date = request.getParameterValues("date");
    // 누른 글 날짜를 가져온다. 
    

    try
    {
       String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
       stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
       
       for(String date : Date){
       date = date.substring(0, 19);
       String sql = "delete from Message where message_date = " + "'" +date + "'";
       stmt.executeUpdate(sql);
       out.print(sql);
       
       }
    } // 데이터의 접근 권한 획득. 
    catch (ClassNotFoundException e)
    {
       e.printStackTrace();
    }
    catch (SQLException e)
    {
       e.printStackTrace();
    }
    
    %>
    
    <script>
    alert("삭제 완료!");
    </script>
    
    <% 
	
    response.sendRedirect("message.jsp");
    
    	stmt.close();
    	conn.close();
	
    %>
    

<%@include file="/common/footer.jsp"%>

</body>
</html>
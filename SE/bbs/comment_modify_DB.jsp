<%@ page language = "java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*"%>

<html>
<head>
    <title>수정 JSP</title>
</head>
<body>
    <%
    // 인코딩 처리 
    int id;
    request.setCharacterEncoding("utf-8");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    id= Integer.parseInt(request.getParameter("Article_id")); // 글번호 
    String Date = request.getParameter("date"); // 날짜 
    String content = request.getParameter("modifyContext"); // 내용 
	
    
    try
    {
       String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
       stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
       String sql_update1 = "UPDATE Comment SET comment_context='" +content + "' WHERE comment_date ='" +Date +"'";
       // 저장된 글 수를 카운트하여 cnt로 하고, 가장 큰 id값을 max_id로 한다. 
       // out.println(sql_update1);
       stmt.executeUpdate(sql_update1);
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
	
</body>
</html>
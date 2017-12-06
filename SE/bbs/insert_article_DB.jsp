<%@ page language = "java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.Calendar"%>
<%@ page import = "java.text.SimpleDateFormat"%>


<%
  String test;
  test = (String)session.getAttribute("sessionID");
  if (test == null) {
      // null이 허락되지 않은 접근을 할 경우, 
  %>
			<div class="alert alert-danger alert-dismissable fade in" align = "center">
      			 <strong>로그인을 하지 않으면 접근할 수 없습니다!</strong>
    		</div>
    		<meta http-equiv="refresh" content="1;url=http://210.94.210.250:8080/SE/user/login.jsp">
 <% 
	}
  else{
 %>

<html>
<head>
    <title>글쓰기 JSP</title>
</head>
<body>

    <%
    // 인코딩 처리 
    request.setCharacterEncoding("utf-8");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    int cnt; 
    int num = 0; //글 번호
    
    try
    {
       String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
       stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
       String sql = "select max(article_id) as max_id, count(*) as cnt from Article";
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
    
    while(rs.next())
    {
        cnt = Integer.parseInt(rs.getString("cnt"));
        if(cnt != 0) // 글 수가 0이 아니면, 0이면 그냥 넘어가서 1부터 시작하게 된다. 
            num = Integer.parseInt(rs.getString("max_id"));
        // 가장 큰 값을 현재 글번호로 한다. 
    }
    
    // 입력된 정보를 가져온다. 
    num++; // 글번호 증가시킴.
    String id= request.getParameter("id"); // 작성자 
    String subject = request.getParameter("subject"); // 제목 
    String content = request.getParameter("content"); // 내용 
    String pw = request.getParameter("password"); // 패스워드 
    String num2 = Integer.toString(num); // 글 번호를 문자로 변환.

    Calendar cal = Calendar.getInstance();
	SimpleDateFormat textFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String articleDate = textFormat.format(cal.getTime());
	
    // 현재 시간값 저장.
    int view = 0;
    
    String sql_insert = "INSERT INTO Article VALUES ('" + num2 + "','" + subject + "','" + view + "','" 
           + articleDate + "','" + pw + "','" + content + "','" + id + "')";
    // 데이터 삽입
    try{
        stmt.executeUpdate(sql_insert);
    }
    catch(Exception e)
    {
        out.println("오류가 발생했습니다!:" +e.getMessage());
    }
    response.sendRedirect("bbs.jsp");
    
    out.println(sql_insert);
    
    // out.println(num2 + subject + view + date + pw + content + id);

    %>
    
    <% } %>
	
</body>
</html>
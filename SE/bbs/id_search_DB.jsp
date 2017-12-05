<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.net.URLDecoder" %> 
<% //request.setCharacterEncoding("euc-kr"); // 인코딩 %>

<style>
#search{
width: 50%;
}
#option{
width: 20%;
}

</style>

<div class="container">
 <h2>검색 결과</h2>

</div>
    
    <% 
    	int id;
    	int row = 0;
    	int cnt;
        // 넘어오는 것 : 옵션 (글쓴이, 제목, 내용), - where ~ like
        // 검색어 '%검색어%'
        String search = request.getParameter("search_id");
        // 검색할 아이디 ~
    	Connection conn = null;
        Statement stmt = null;
        Statement stmt2 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        
        try
        {
           String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
           stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
           stmt2 = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
           String sql = "select * from User where id = " + "'" + search + "'";
           String sql2 = "select count(*) as cnt from User where id = " + "'" + search + "'";
           //out.print(sql);
           //out.println(option);
           // 검색하고 글 번호 내림차순으로 글들 정렬. 
           rs = stmt.executeQuery(sql); // 레코드를 가져온다. 
           rs2 = stmt2.executeQuery(sql2); // 레코드의 수를 가져온다.
           
        } // 데이터의 접근 권한 획득. 
        catch (ClassNotFoundException e)
        {
           e.printStackTrace();
        }
        catch (SQLException e)
        {
           e.printStackTrace();
        }
        
		rs2.next(); // 처음 레코드로 이동!
        
		cnt = Integer.parseInt(rs2.getString("cnt")); // 레코드 수를 가져온다.
        
		if(cnt == 0){ // 없는 아이디이면, 
		%>
		
		<div class="alert alert-danger alert-dismissable fade in" align = "center">
      			 <strong>존재하지 않는 아이디입니다! 다시 입력해 주세요</strong>
    	</div>
    	<meta http-equiv="refresh" content="1;url=id_search.jsp">
		
		<% 
		}
		else {	  // 아이디가 존재하면 
			rs.next(); // 처음 레코드로 이동!
	        // 레코드의 수를 구한다. 
		    String R_id = rs.getString("id");
	      
    %>
    
    	<div class="alert alert-danger alert-dismissable fade in" align = "center">
      			 <strong>아이디를 찾았습니다!</strong>
    	</div>
    	<meta http-equiv="refresh" content="1;url=message_send.jsp?receiver=<%=R_id%>">
    
    <% 
		}
    %>
    

<%@include file="/common/footer.jsp"%>

<% 
	stmt.close();
	conn.close(); // 연결을 종료한다. 
%>

</body>
</html>
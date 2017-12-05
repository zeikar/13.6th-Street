<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.net.URLDecoder" %> 

<script>  
function openNew(){  
    window.open("message_send.jsp", "쪽지 작성", 
    		"width=600, height=800, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,left=400px, top=500px");  
}  

function check_All(){
    if( $("#check-all").is(':checked') ){
      $("input[name=checkbox]").prop("checked", true);
    }else{
      $("input[name=checkbox]").prop("checked", false);
    }
}

</script> 

<style>
#search{
width: 50%;
}
#option{
width: 20%;
}

</style>

<div class="container">
 <h2>쪽지 검색 결과</h2>
 
<button type="button" class="btn btn-primary" onClick = "openNew()">
  <span class="glyphicon glyphicon-envelope"></span> 작성
</button>

<button type="button" class="btn btn-danger" id="selection">
<span class="glyphicon glyphicon-envelope"></span>삭제
</button>

  
  <table class="table table-bordered"> <!-- 각각을 나눈다. -->
    <thead>
      <tr>
      	<th width = 2%> <input id="check-all" name ="check-all" type="checkbox" onclick="check_All()"> </th>
        <th>보낸사람</th>
        <th>받는사람</th>
        <th>내용</th>
        <th>날짜</th>
      </tr>
    </thead>
    
    <% 
    	int id;

        // 넘어오는 것 : 옵션 (글쓴이, 제목, 내용), - where ~ like
        // 검색어 '%검색어%'
        String option = request.getParameter("option");
    	option = new String(option.getBytes("ISO-8859-1"), "UTF-8");
    	String article_option = "";
        String search = request.getParameter("searching");
        search = new String(search.getBytes("ISO-8859-1"), "UTF-8");
    	// 망할 인코딩..^^;
    	
    	String user = (String)session.getAttribute("sessionID");
    	// 받는사람이 로그인한 사람이어야 한다. 
    	
        if (option.equals("보낸사람")){
            article_option = "message_sender_id";
        }
        else // 내용 
            article_option = "message_context";
        
    	Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try
        {
           String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
           stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
           String sql ="select * from Message where " + article_option + 
                   " like '%" + search + "%' and message_receiver_id like '" + user + "' order by Message_num desc";
           // "select * from Message where message_receiver_id like '" + user + "' and '" + article_option + "' like '%" + search + "%' order by Message_num desc";
           //out.print(sql);
           //out.println(option);
           // 검색하고 글 번호 내림차순으로 글들 정렬. 
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
        
        rs.last(); // 처음 레코드로 이동!
        //row = rs.getRow(); // 현재 레코드의 행 번호 반환! 즉 첫 레코드 번호를 row로.
        rs.beforeFirst(); // 처음 레코드의 이전으로 이동!
        
        while(rs.next())
        {
            id = Integer.parseInt(rs.getString("Message_num"));
        
    %>
      <tr>
      	<td align = center> <input name="checkbox" id = "checkbox" type="checkbox" value = "${content.IDX}"> </td>
      	<td><%= rs.getString("message_sender_id")%></td>
      	<td><%= rs.getString("message_receiver_id")%></td>
        <td><a href="#" onclick = "window.open('Message_read.jsp?date=<%= rs.getString("message_date")%>','쪽지','width=600, height=800, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,left=400px, top=500px');return false;">
        <%= rs.getString("message_context")%></a></td>
        <td><%= rs.getString("message_date") %></td>
      </tr>
    <%
        }
    %>
  </table>
 
 
<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#search">
  <span class="glyphicon glyphicon-search"></span> 검색
</button>
<div id="search" class="collapse">
<form name ="search" method = "post" action="search_message.jsp">
<div class="form-group">
<label for="sel1"></label>
  <select class="form-control" name="option" id="option">
  	 <!-- 검색 옵션 -->
    <option selected="selected">보낸사람</option>
    <option>내용</option>
  </select>
</div>
  <div class="input-group" id ="search">
    <input type="text" class="st-default-search-input form-control" placeholder="Search"
    name = "searching" id = "searching">
    <!-- 검색하려는 내용 -->
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
</form>
 </div>
</div>

<%@include file="/common/footer.jsp"%>

<% 
	stmt.close();
	conn.close(); // 연결을 종료한다. 
%>

</body>
</html>
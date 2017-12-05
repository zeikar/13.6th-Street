<%@page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@include file="/common/sideMenu.jsp"%>
<%@ page import = "java.sql.*"%>

<script>  
function openNew(){  
    window.open("id_search.jsp", "쪽지 작성 - 사용자 찾기", 
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


<div class="container">
 <h2>쪽지함</h2>
 
<button type="button" class="btn btn-primary" onClick = "openNew()">
  <span class="glyphicon glyphicon-envelope"></span> 작성
</button>

<button type="button" class="btn btn-danger" id="selection">
<span class="glyphicon glyphicon-envelope"></span>삭제
</button>

 
<div class="alert alert-info alert-dismissable">
 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>부적절한 내용의 쪽지는 상단 메뉴에서 신고해 주세요.</strong> 
</div>
  
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
    	request.setCharacterEncoding("utf-8"); // 인코딩
    	int id;
    	int row = 0;
    	String PageNum_temp = request.getParameter("PageNum");
    	String user = (String)session.getAttribute("sessionID");
    	
    	Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try
        {
           String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
           stmt = conn.createStatement(); // 질의를 위한 Stmt 객체 생성.
           String sql = "select * from Message where message_receiver_id = " + "'" + user + "'" + " order by Message_num desc";
           // "select * from Message where" + user + "order by Message_num desc";
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
        
        rs.last(); // 처음 레코드로 이동!
       // row = rs.getRow(); // 현재 레코드의 행 번호 반환! 즉 첫 레코드 번호를 row로.
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
 

<%@include file="/common/footer.jsp"%>

<% 
	stmt.close();
	conn.close(); // 연결을 종료한다. 
%>

<%} %>
</div>

 <script>
        // 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
        

        $("#selection").click(function(){ 
            
            var rowData = new Array(); // 행의 값을 모두 담을 배열
            var tdArr = new Array(); // 각각의 td의 값을 담을 배열 
 
            var checkbox = $("input[name=checkbox]:checked");
            // 체크된 체크박스 값을 가져온다.
            
            if(checkbox.length == 0)
            	{
            	alert("체크된 항목이 없습니다!");
            	
            	}
            else{
            checkbox.each(function(i) {
    
                var tr = checkbox.parent().parent().eq(i);
                // tr은 행의 개수이다. 즉 i개의 행을 가져온다. 
                var td = tr.children();
                // td는 n번째이다. 
                
                // 체크된 row의 모든 값을 배열에 담는다.
                rowData.push(tr.text());
                
                // td.eq(0)은 체크박스 이므로  td.eq(4)가 날짜 데이터가 된다. 
                var date = td.eq(4).text()+", ";
                
                // 가져온 값을 배열에 담는다.
                tdArr.push(date);
               
                
            });
            
            //<form name = "Articleform" id = "Articleform" method="post" action="insert_article_DB.jsp">
            
            //<input type="hidden" name="id" id="id" 
            // value="${sessionScope.sessionID}">
            
            var form = document.createElement("form"); // 새로운 폼을 만든다. 
            form.setAttribute("method", "post"); // 설정은 post로 
            form.setAttribute("action", "Message_delete.jsp"); // 위치설정 
            
            for (var i=0; i<tdArr.length; i++) {
              	var el = document.createElement("input"); // 인풋 type을 만듭니다. 
              	el.setAttribute("type", "hidden");
                el.setAttribute("name", "date");
                el.setAttribute("value", tdArr[i]);
                form.appendChild(el);
            }
            
            document.body.appendChild(form); // 보디에 폼 생성.
            form.submit();
            
            alert("삭제 완료!");
            }
             
        });
    
    </script>

</body>
</html>
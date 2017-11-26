<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/admincheck.jsp"%>
<html>
<head>
    <title>사용자 삭제 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다
        String id = request.getParameter("userid");
    
        boolean check = UserAccountController.deleteUser(id);
        String nextURL = "";

        // 실패
        if(check == false)
        {
            nextURL = "deleteuser.jsp?error=" + id;
        }
        // 성공
        else
        {
            nextURL = "deleteuser.jsp?success=" + id;
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/logincheck.jsp"%>
<html>
<head>
    <title>판매자 등록 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다
        String id = (String)session.getAttribute("sessionID");
        String request_content = request.getParameter("request_content");

        // DB에 업데이트       
        boolean check = UserAccountController.userSellerRequest(id, request_content);
        String nextURL = "";

        if(check == false)
        {
            nextURL = "edituser.jsp?error";
        }
        // 정보수정 성공
        else
        {
            nextURL = "edituser.jsp?seller";
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

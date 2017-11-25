<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/logincheck.jsp"%>
<html>
<head>
    <title>정보수정 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다
        String id = (String)session.getAttribute("sessionID");
        String pw = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // DB에 업데이트       
        boolean check = UserAccountController.editUser(id, pw, address, phone);
        String nextURL = "";

        if(check == false)
        {
            nextURL = "../index.jsp?error";
        }
        // 정보수정 성공
        else
        {
            nextURL = "../index.jsp?edit";
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

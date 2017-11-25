<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/loginchecknot.jsp"%>
<html>
<head>
    <title>회원가입 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String id= request.getParameter("userid");
        String pw = request.getParameter("password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        
        // DB에서 아이디, 비밀번호 확인        
        boolean check = UserAccountController.register(id, pw, name, email, address, phone);        
        String nextURL = "";

        if(check == false)
        {
            // 가입 실패
            nextURL = "../index.jsp?error";
        }
        // 회원가입 성공
        else
        {
            nextURL = "login.jsp?register";
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

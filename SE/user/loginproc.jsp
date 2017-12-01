<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/loginchecknot.jsp"%>
<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String id = request.getParameter("userid");
        String pw = request.getParameter("password");
        String next = request.getParameter("next");

        // DB에서 아이디, 비밀번호 확인        
        boolean login = UserAccountController.login(id, pw);
        String nextURL = "";

        // 로그인 실패
        if(login == false)
        {
            nextURL = "login.jsp?fail&next=" + next;
        }
        // 재제된 사용자
        else if(UserAccountController.isUserBlocked(id))
        {
            nextURL = "login.jsp?blocked";
        }
        // 로그인 성공
        else
        {            
            if(request.getParameter("next").indexOf('?') == -1)
            {
                next = request.getParameter("next") + "?loginsuccess";
            } 
            else
            {
                next = request.getParameter("next") + "&loginsuccess";
            }
            next = next.replace("logout&", "");

             // 세션에 현재 아이디 세팅
            session.setAttribute("sessionID", id);

            if(!request.getParameter("next").equals("null"))
            {
                nextURL = next;
            }
            else
            {
                nextURL = "../index.jsp?login";
            }
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

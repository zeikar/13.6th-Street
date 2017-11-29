<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/admincheck.jsp"%>
<html>
<head>
    <title>사용자 제재 철회 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다
        String[] idList = request.getParameterValues("unblock");
        String nextURL = "";

        if(idList == null)
        {
            nextURL = "unblockuser.jsp?error";
        }
        else
        {
            boolean check = UserAccountController.unBlockUser(idList);

            // 실패
            if(check == false)
            {
                nextURL = "unblockuser.jsp?error";
            }
            // 성공
            else
            {
                nextURL = "unblockuser.jsp?success";
            }
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>
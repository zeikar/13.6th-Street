<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/admincheck.jsp"%>
<html>
<head>
    <title>사용자 제재 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다
        String[] idList = request.getParameterValues("block");
        String nextURL = "";

        if(idList == null)
        {
            nextURL = "blockuser.jsp?error";
        }
        else
        {
            boolean check = UserAccountController.blockUser(idList);

            // 실패
            if(check == false)
            {
                nextURL = "blockuser.jsp?error";
            }
            // 성공
            else
            {
                nextURL = "blockuser.jsp?success";
            }
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>
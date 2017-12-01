<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/logincheck.jsp"%>
<html>
<head>
    <title>사용자 삭제 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다		
        String reportId = (String)session.getAttribute("sessionID");
        String reportedId = request.getParameter("userid");
		String report_reason = request.getParameter("report_reason");
		String report_content = request.getParameter("report_content");
    
        boolean check = UserAccountController.reportUser(reportId, reportedId, report_content, report_reason);
        String nextURL = "";

        // 실패
        if(check == false)
        {
            nextURL = "reportuser.jsp?error=" + reportedId;
        }
        // 성공
        else
        {
            nextURL = "reportuser.jsp?success=" + reportedId;
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

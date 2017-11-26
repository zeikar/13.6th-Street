<%@ page import="user.PointController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/logincheck.jsp"%>
<html>
<head>
    <title>충전 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다
        String id = (String)session.getAttribute("sessionID");
        int point = Integer.parseInt(request.getParameter("point"));
        String refundNumber = request.getParameter("refund_number");

        boolean check = PointController.refundPoint(id, point, refundNumber);            
        String nextURL = "";

        // 실패
        if(check == false)
        {
            nextURL = "pointrefund.jsp?error";
        }
        // 성공
        else
        {
            nextURL = "pointrefund.jsp?success";
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

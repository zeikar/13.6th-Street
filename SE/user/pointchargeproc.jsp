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
        String radio = request.getParameter("radio");
        boolean isCard = radio.equals("credit_card");
        String paynumber = request.getParameter("pay_number");
    
        boolean check = false;
        
        if(isCard)
        {
            check = PointController.chargePointWithCreditCard(id, point, paynumber);
        } 
        else
        {
            check = PointController.chargePointWithBankAccount(id, point, paynumber);
        }
        String nextURL = "";

        // 실패
        if(check == false)
        {
            nextURL = "pointcharge.jsp?error";
        }
        // 성공
        else
        {
            nextURL = "pointcharge.jsp?success";
        }

        response.sendRedirect(nextURL);
    %>
</body>
</html>

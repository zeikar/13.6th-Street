<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %>
<%@include file="/user/admincheck.jsp"%>
<html>
<head>
    <title>판매자 등록 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8"); 
        
        // 화면에 입력된 정보를 가져온다
        String[] idList = request.getParameterValues("seller");
        String flag = request.getParameter("flag");
        String nextURL = "";
  
		if(flag.equals("true"))
		{
			if(idList == null)
			{
				nextURL = "addseller.jsp?error";
			}
			else
			{
				boolean check = UserAccountController.addSeller(idList);

				// 실패
				if(check == false)
				{
					nextURL = "addseller.jsp?error";
				}
				// 성공
				else
				{
					nextURL = "addseller.jsp?success";
				}
			}
		}
		else
		{
			if(idList == null)
			{
				nextURL = "addseller.jsp?rejecterror";
			}
			else
			{
				boolean check = UserAccountController.rejectSeller(idList);

				// 실패
				if(check == false)
				{
					nextURL = "addseller.jsp?rejecterror";
				}
				// 성공
				else
				{
					nextURL = "addseller.jsp?rejectsuccess";
				}
			}
		}
        

        response.sendRedirect(nextURL);
    %>
</body>
</html>
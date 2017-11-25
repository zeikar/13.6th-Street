<%@ page import="user.UserAccountController" contentType="text/html; charset=UTF-8" %><%
    // 인코딩 처리
    request.setCharacterEncoding("utf-8"); 
    
    // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
    String id = request.getParameter("userid");

    // DB에서 아이디 확인        
    boolean login = UserAccountController.isDuplicateId(id);

    if(login == false)
    {
        out.print("OK");
    }
    else
    {
        out.print("NO");
    }
%>
<%@ page import="Item.ItemController" contentType="text/html; charset=UTF-8" %><%
    // 인코딩 처리
    request.setCharacterEncoding("utf-8"); 
    
    // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
    String regNumber = request.getParameter("itemRegNumber");

    // DB에서 아이디 확인        
    boolean checker = ItemController.checkDuplicateRegId(regNumber);

    if(!checker)
        out.print("OK");
	
    else
        out.print("NO");
%>
<%@ page import="bbs.ArticleController" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.Date"%>
<%@ page import = "java.util.Calendar"%>
<html>
<head>
    <title>글쓰기 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");
        
        // 입력된 정보를 가져온다. 
        String id= request.getParameter("id");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String pw = request.getParameter("password");
        String num = "0";
        Date date = new Date(Calendar.getInstance().getTimeInMillis());
        // 현재 시간값 저장.
        int view = 0;
        
        System.out.print("subject");
        
        
        // DB에 글을 저장한다.        
        boolean check = ArticleController.Write_Article(num, subject, view, date, pw, content, id); 
        // bbs_num, bbs_subject, bbs_view, bbs_date, bbs_password, bbs_content, bbs_userid
        String nextURL = "";
        
        if(check == false)
        {
            // 글 작성 실패
            nextURL = "../index.jsp?error";
        }
        // 글 작성 성공
        else
        {
            nextURL = "bbs.jsp";
        }
        response.sendRedirect(nextURL);
        
    %>
</body>
</html>
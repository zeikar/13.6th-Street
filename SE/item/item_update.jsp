<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.util.*"%>

<%@include file = "/item/sellerCheck.jsp"%>
<%@include file="/common/header.jsp"%>


<%@ page import="Item.Item"%>

<%	
	request.setCharacterEncoding("UTF-8");
	
    int sizeLimit=1024*1024*1024;    //1 기가
    
    String saveFolder = "/usr/local/server/tomcat/webapps/SE/pictures/Item";
	
	MultipartRequest req = null;
	
	String fileName = null;
 
    try
	{
        req = new MultipartRequest(request, saveFolder, sizeLimit, "UTF-8" ,new DefaultFileRenamePolicy());
        
        Enumeration formNames=req.getFileNames();
		String formName=(String)formNames.nextElement();
		fileName=req.getFilesystemName(formName);

		if(fileName == null)
			fileName "none.png";
		
		else
		{  
			fileName=new String(fileName.getBytes("8859_1"),"euc-kr");
		}
	}
	
	catch (Exception e)
	{
		out.print("<h2>IOException이 발생했습니다 </h2> <br> <pre>" + e.getMessage() + "</pre>");
	}
	
	String reqUserId = (String)session.getAttribute("sessionID");
	String editItemId = (String)session.getAttribute("sessionItem");
	
	String reqName = req.getParameter("name");	
	String reqType = req.getParameter("itemtype");
	String reqRegId = req.getParameter("regid");
	
	int reqPrice = Integer.parseInt(req.getParameter("price"));
	
	String reqExplain = req.getParameter("explanation");
	
	boolean checker = false;
	
	Item target = ItemController.getItem(editItemId);
	
	target.name = reqName;
	target.setType(reqType);
	target.setRegId(reqRegId);
	
	target.itemImage = fileName;
	
	target.price = reqPrice;
	
	target.explanation = reqExplain;
	
	checker = ItemController.updateItem(reqUserId, target);
	
	if (checker)
	{
		String nextURL = "item_supervise.jsp?item_updateSuccess";
		response.sendRedirect(nextURL);
	}
	
	else
	{
		String nextURL = "item_supervise.jsp?item_updateFailed";
		response.sendRedirect(nextURL);
	}
%>
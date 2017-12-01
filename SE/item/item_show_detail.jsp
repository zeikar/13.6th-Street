<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@ include file="/common/header.jsp"%>

<%@ page import="Item.Item"%>

<%@ page import="Review.Review"%>
<%@ page import="Review.ReviewController" contentType="text/html; charset=UTF-8" %>

<style>
	img 
	{
		display: block;
		max-width: 50%;
		height: auto;
	}
</style>

<div class = "container">
	<div class = "col-sm-10 col-sm-offset-1">

	<h1> 물품 상세 보기 </h1>
	<hr />
	
<%
            if(request.getParameter("success") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 물품 </strong>이 신고되었습니다.
            </div>
<%
            }

            if(request.getParameter("failed") != null)
            {
%>
            <div class="alert alert-danger alert-dismissable fade in">
                <strong> 물품 신고가 </strong> 실패하였습니다.
            </div>
<%
            }
%>




<%
            if(request.getParameter("reviewSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 리뷰 </strong>가 작성되었습니다.
            </div>
<%
            }

            if(request.getParameter("reviewFailed") != null)
            {
%>
            <div class="alert alert-danger alert-dismissable fade in">
                <strong> 리뷰 작성이 </strong> 실패하였습니다.
            </div>
<%
            }
%>



<%
            if(request.getParameter("reviewDeleteSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 리뷰 </strong>가 삭제되었습니다.
            </div>
<%
            }

            if(request.getParameter("reviewDeleteFailed") != null)
            {
%>
            <div class="alert alert-danger alert-dismissable fade in">
                <strong> 리뷰 삭제가 </strong> 실패하였습니다.
            </div>
<%
            }
%>





<%
            if(request.getParameter("reviewUpdateSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong> 리뷰 </strong>가 수정되었습니다.
            </div>
<%
            }

            if(request.getParameter("reviewUpdateFailed") != null)
            {
%>
            <div class="alert alert-danger alert-dismissable fade in">
                <strong> 리뷰 수정이 </strong> 실패하였습니다.
            </div>
<%
            }
%>



	
	<div class = "row">
<%
	request.setCharacterEncoding("UTF-8");
	
	String LoginedUser = (String)session.getAttribute("sessionID");
	
	String itemId = request.getParameter("itemId");
	
	String ishome = request.getParameter("home");
	String iscart = request.getParameter("cart");
	
	String search_value = request.getParameter("search_text");
	String search_type = request.getParameter("search_type");
	
	String inputValue = request.getParameter("search_price");
	
	int search_price = 0;
	
	if (inputValue != null && !inputValue.equals("0"))
		search_price = Integer.parseInt(inputValue);
		
	String search_seller = request.getParameter("search_seller_id");
	
	String url = "";
	
	int no = 0;
	
	Item targetItem = ItemController.getItem(itemId);

	if (targetItem != null)
	{
%>	
		<div class = "col-sm-4">
			<div style = "width : 100%; height : 30%; text-align : center">
				<img src = "/SE/pictures/Item/<%= targetItem.itemImage %>" class = "img-responsive">
			</div>			
			
			<div style = "text-align : center;">
				<h3><%= targetItem.name %></h3>
			</div>
			
			<div style = "text-align : center;">
				<h4>판매자 : <%= targetItem.itemRegUserId %> </h4>
				
				<div style = "text-align : center;">
					<a href="/SE/user/reportuser.jsp?search_id=<%=targetItem.itemRegUserId%>" class="btn btn-danger" role="button"><i class="glyphicon glyphicon-alert"></i> 판매자 신고</a>
				</div>
			</div>
		</div>
		
		<div class = "col-sm-8">
			<div class="row">
				<div class="col-sm-8">
					<h4> 상품 이름 : <%= targetItem.name %> </h4>
					<h4> 상품 타입 : <%= targetItem.getType() %> </h4>
					<h4> 상품 가격 : <%= targetItem.price %> 포인트 </h4>
					<h4> 현재 상태 : <%= targetItem.itemState %> </h4>
					<h4> 공식 등록 번호 : <%= targetItem.getRegId() %> </h4>
				</div>			
			
				<div class = "col-sm-4">
<%
		url = "search_text=";
		
		if (search_value != null)
		{		
			if (!search_value.equals("null"))
				url = url + search_value;
		}
		
		if (search_type != null)
			url = url + "&search_type=" + search_type;
		
		if (search_price > 0)
			url = url + "&search_price=" + search_price;
		
		if (search_seller != null)
			url = url + "&search_seller_id=" + search_seller;
		
		if (ishome != null)
			url = url + "&home";
		
		if (iscart != null)
			url = url + "&cart";

		if (LoginedUser != null)
		{
%>
					<form action = "/SE/item/item_order.jsp?<%=url%>&itemId=<%=targetItem.getId()%>" method = "post">
						<button class="btn btn-success btn-md btn-block" type="submit" title = "장바구니에 담기"> <i class="glyphicon glyphicon-shopping-cart"></i> 장바구니에 담기 </button>
					</form>
					<br>
<%
			if (ishome != null)
			{
%>
					<form action = "/SE/index.jsp" method = "post">
<%
			}
			
			else if (iscart != null)
			{
%>
					<form action = "/SE/item/order_list.jsp" method = "post">
<%
			}
			
			else
			{
%>
					<form action = "/SE/item/item_search.jsp?<%= url %>" method = "post">
<%
			}
%>
						<button class = "btn btn-default btn-md btn-block"  title = "뒤로 가기"> <i class = "glyphicon glyphicon-arrow-left"></i> 뒤로 가기 </button>
					</form>
					<br>
					
					<form action = "/SE/item/item_report.jsp?itemId=<%=itemId%>&<%= url %>" method = "post">
						<button class="btn btn-danger btn-md btn-block" type="submit" title = "물품 신고"> <i class="glyphicon glyphicon-alert"></i> 물품 신고 </button> <br>
					</form>
<%
		}
	
		else
		{
%>
					<button class="btn btn-success btn-md btn-block" title = "장바구니에 담기" onclick = "alert('로그인 이후 사용하실 수 있습니다!')">
						<i class="glyphicon glyphicon-shopping-cart"></i> 장바구니에 담기
					</button>
					<br>		
<%
			if (ishome != null)
			{
%>
					<form action = "/SE/index.jsp" method = "post">
<%
			}
				
			else
			{
%>
					<form action = "/SE/item/item_search.jsp?<%= url %>" method = "post">
<%
			}
%>
						<button class = "btn btn-default btn-md btn-block" title = "뒤로 가기"> <i class = "glyphicon glyphicon-arrow-left"></i> 뒤로 가기 </button>
					</form>
					<br>
					
					<button class="btn btn-danger btn-md btn-block" title = "물품 신고" onclick = "alert('로그인 이후 사용하실 수 있습니다!')"> <i class="glyphicon glyphicon-alert"></i> 물품 신고 </button>
<%
		}
%>
				</div>		
			</div>
			
			<hr />
			
			<h3> 상세 설명 </h3>			
			<p> <%= targetItem.explanation %> </p>
			
		</div>
	</div>
	
<%
	}
%>


<%
	ArrayList<Review> reviewList = new ArrayList<Review>();
	
	reviewList = ReviewController.getReviews(itemId);
%>
	
	<hr/>
	<div class = "row">
		<h1> 리뷰 </h1>
	</div>
<%
	if (reviewList.size() == 0)
	{
%>
			<p>
				댓글이 없습니다.
			</p>
<%
	}
	
	else
	{		
		for (Review itor : reviewList)
		{
			no++;
%>

	<hr />

	<div class="row" id = "review<%=no%>">	
		<div class="col-sm-10">
			<div class="media">
				<div class="media-body">
					<h4 class="media-heading"><%= itor.getUserId() %> <small><i><%= itor.reviewDate %></i></small></h4>
				<p id = "reveiewContext<%=no%>"><%= itor.context %></p>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="row">
<%
			if (itor.getUserId().equals(LoginedUser))
			{
%>
				<div class="col-sm-6">
					<input class="btn btn-info" id = "editButton<%=no%>" type = "button" value = "수정" onclick = "editFunction('<%=no%>')">
				</div>
				
				<div class="col-sm-6">
					<form action = "/SE/item/reviewDelete.jsp?<%=url%>" method = "post">
						<input type = "hidden" name = "itemId" value = "<%= itor.getItemId() %>">
						<input type = "hidden" name = "userId" value = "<%=itor.getUserId()%>">
						<input type = "hidden" name = "review_date" value = "<%=itor.reviewDate%>">
						<input class="btn btn-danger" id = "deleteButton<%=no%>" type = "submit" value = "삭제">
					</form>
				</div>
<%
			}
%>
			</div>
		</div>
	</div>
<%
		}
	}
%>	

<%
	if (LoginedUser != null)
	{
%>
	<div class="row">
		<hr />
		<form name = "reviewForm" action = "reviewWrite.jsp?item_id=<%=itemId%>&<%=url%>" method = "post">
			<div class = "col-sm-10">				
				<textarea class = "form-control" id = "reviewContext" name = "reviewContext" style="resize:none; height : 80px; overflow : hidden" required></textarea>
			</div>
			
			<div class = "col-sm-2">
				<div>
					<input type = "submit" id = "reviewButton" class = "form-control btn btn-success" value = "리뷰 작성"> </input>
				</div>
				
				<br>
				
				<div>
					<input type = "button" id = "reviewCancelButton" class = "form-control btn btn-danger"
						   style = "visibility : hidden" value = "리뷰 수정 취소"
						   onclick = "editFunction('off')"> </input>
				</div>
			</div>
		</form>
	</div>
<%
	}
%>
</div>
</div>

<script>
function editFunction(number)
{
	var textTarget = document.getElementById("reviewContext");
	var button = document.getElementById("reviewButton");
	var cancelButton = document.getElementById("reviewCancelButton");
	
	for (var i = 1; i <= <%=no%>; i++)
	{			
		var tempDiv = document.getElementById("review" + i);
		var tempEditbtn = document.getElementById("editButton" + i);
		var tempdeletebtn = document.getElementById("deleteButton" + i);
		
		if (tempEditbtn != null && tempdeletebtn)
		{
			tempDiv.style.backgroundColor = "white";
			tempEditbtn.value = "수정";
			tempdeletebtn.style.visibility = "visible";
		}
	}
	
	if (number == "off")
	{
		textTarget.value = "";
		button.value = "리뷰 작성"
		cancelButton.style.visibility = "hidden";
		
		document.reviewForm.action = "reviewWrite.jsp?item_id=<%=itemId%>&<%=url%>";
	}
		
	else
	{
		var context = document.getElementById("reveiewContext" + number).innerHTML;
	
		var divisionPart = document.getElementById("review" + number);
		var editButton = document.getElementById("editButton" + number);
		var deleteButton = document.getElementById("deleteButton" + number);
	
		textTarget.value = context;
		button.value = "리뷰 수정";
		cancelButton.style.visibility = "visible";
		
		divisionPart.style.backgroundColor = "#EAEAEA";
		
		editButton.value = "수정 중...";
		deleteButton.style.visibility = "hidden";
		
		document.reviewForm.action = "reviewUpdate.jsp?item_id=<%=itemId%>&<%=url%>";
	}
}
</script>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
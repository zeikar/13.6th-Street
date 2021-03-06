<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/common/header.jsp"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("euc-kr");
	
	boolean searchFlag = false;
	
	String LoginedUser = (String)session.getAttribute("sessionID");
	
	String search_value = request.getParameter("search_text");
	
	String search_option_type = request.getParameter("search_type");
	
	if (search_option_type == null)
		search_option_type = "All";
	
	else if (search_option_type.equals(""))
		search_option_type = "All";
	
	String search_option_price = request.getParameter("search_price");
	
	if (search_option_price == null)
		search_option_price = "0";
	
	else if (search_option_price.equals("null") || search_option_price.equals(""))
		search_option_price = "0";
	
	String search_option_seller_id = request.getParameter("search_seller_id");
	
	if (search_option_seller_id == null)
		search_option_seller_id = "";
	
	else if (search_option_seller_id.equals("null") || search_option_seller_id.equals(""))
		search_option_seller_id = "";
	
%>

<style>
.itemTable:hover
{
	cursor : pointer;
	background-color : #EAEAEA;
}
</style>

<script>
function setType(str)
{
	var submitValue = document.getElementById("itemType");
	
	var buttonCop = document.getElementById("buttonCopyright");
	var buttonPat = document.getElementById("buttonPatent");
	var buttonAll = document.getElementById("buttonAll");
	
	submitValue.value = str;
	
	buttonCop.style.backgroundColor = "white";
	buttonCop.style.fontWeight = "default";
	
	buttonPat.style.backgroundColor = "white";
	buttonPat.style.fontWeight = "default";
	
	buttonAll.style.backgroundColor = "white";
	buttonAll.style.fontWeight = "default";
	
	if (str == "Patent")
	{
		buttonPat.style.backgroundColor = "#EAEAEA";
		buttonPat.style.fontWeight = "bold";
	}
	
	else if (str == "Copyright")
	{
		buttonCop.style.backgroundColor = "#EAEAEA";
		buttonCop.style.fontWeight = "bold";
	}
	
	else
	{
		buttonAll.style.backgroundColor = "#EAEAEA";
		buttonAll.style.fontWeight = "bold";
	}
}

function price_init()
{
	var priceText = document.getElementById("search_option_price");
	
	priceText.value = "";
}
</script>

<div class="container">
		
	<div class="row">

		<section class="content">
			<h1> 물품 검색 결과 </h1>
			
<%
            if(request.getParameter("item_orderSuccess") != null)
            {
%>
			<div class="alert alert-success alert-dismissable fade in">
                <strong>장바구니</strong>에 등록되었습니다.
            </div>
<%
            }

            if(request.getParameter("item_orderDuplicate") != null)
            {
%>
            <div class="alert alert-danger alert-dismissable fade in">
                <strong>자신이 등록한 상품을 </strong> 장바구니에 넣을 수 없습니다!
            </div>
<%
            }
			
            if(request.getParameter("item_orderFailed") != null)
            {
%>
            <div class="alert alert-danger alert-dismissable fade in">
                <strong> 이미 주문된 상품 </strong> 입니다!
            </div>
<%
            }
			
			
			if (request.getParameter("SellerOrderInterrupt") != null)
			{
%>
			<div class="alert alert-danger alert-dismissable fade in">
                <strong> 판매자가 본인의 물품 </strong>을 구입할 수 없습니다!
            </div>
<%
			}
%>
			
			
			<div class = "row" style = "height : 30px;"> </div>
			
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<nav class="navbar navbar-default" style = "padding : 10px;">
						
							<form action = "/SE/item/item_search.jsp" method = "get">
							
								<div class = "row">
									<div class = "col-sm-4">
										<div class = "input-group">
											<button id = "buttonCopyright" type = "button" class = "btn btn-default" onclick = "setType('Copyright')"> 저작권 </button>
											<button id = "buttonPatent" type = "button" class = "btn btn-default" onclick = "setType('Patent')"> 특허 </button>
											<button id = "buttonAll" type = "button" class = "btn btn-default" onclick = "setType('All')"> 모두 </button>
											
											<input id = "itemType" type = "hidden" name = "search_type" value = "All">
										</div>
									</div>
									
									<div class = "col-sm-6">
										<div class = "input-group">
											
											<input name = "search_text" type="text" class="form-control" placeholder="물품 검색" value = "<%= search_value%>">
										
											<div class = "input-group-btn">
												<button class="btn btn-default" type="submit">
													<i class="glyphicon glyphicon-search"></i>
												</button>
											</div>
										</div>
									</div>
									
									<div class = "col-sm-3"> </div>
								</div>
								
								<div class = "row" style = "height : 20px;"> </div>
								
								<div class = "row" style = "height : 30px;">
									<div class = "col-sm-2">
										추가옵션
									</div>
								</div>
								
								<div class = "row">
									<div class = "col-sm-1"> </div>
									
									<div class = "col-sm-4">
										<div class = "input-group">
											<div class = "input-group-btn">
												<button class="btn btn-default"> 가격 </button>
											</div>
											
											<input id = "search_option_price" name = "search_price" min = "0"
												   type="number" class="form-control" placeholder="상한 가격 입력" style = "text-align : right" value = "<%= search_option_price %>"
												   onclick = "price_init()">
										</div>
									</div>
									
									<div class = "col-sm-4">
										<div class = "input-group">
											<div class = "input-group-btn">
												<button class="btn btn-default"> 판매자 </button>
											</div>
											
											<input name = "search_seller_id" type="text" class="form-control" placeholder="판매자 이름" value = "<%= search_option_seller_id %>">
										</div>
									</div>
								</div>
							</form>
						
					</nav>
			
					<div class="panel-body">
						<div class="pull-right">
							<div class = "row">		
								<div class = "col-sm-8">
									
								</div>
							</div>
						</div>
								
<%		
	try
	{		
		ArrayList<Item> searchList = new ArrayList<Item>();
		int maxPrice = Integer.parseInt(search_option_price);
		
		if (search_option_seller_id == "")
			search_option_seller_id = null;
		
		if (search_option_type.equals("All") && search_option_price == "0" && search_option_seller_id == null)
		{
			searchList = ItemController.searchItem(search_value, null, 0, "Selling" , null);
			searchFlag = false;
		}
		
		else 
		{
			searchList = ItemController.searchItem(search_value, search_option_type, maxPrice, "Selling", search_option_seller_id);
			searchFlag = true;
		}
		
		if (searchList.size() == 0)
		{
%>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
									<tr>
										<td>
											검색 결과가 없습니다.
										</td>
									</tr>
<%
		}
		
		if (searchFlag)
		{
			if (!search_option_type.equals("All"))
			{
%>
				종류 (<%=search_option_type%>)
<%
			}
			
			if (maxPrice != 0)
			{
%>
				최고 가격(<%=maxPrice%>)
<%
			}
			
			if (search_option_seller_id != null)
			{
%>
				판매자 id (<%=search_option_seller_id%>)
<%
			}

			if (!(search_option_type.equals("All") && maxPrice == 0 && search_option_seller_id == null))
			{
%>
				로 상세 검색한 결과입니다.
<%
			}
		}		
		for (Item itor : searchList)
		{
			String options = "itemId=" + itor.getId() + "&search_text=" + search_value;
			
			if (!search_option_type.equals("All"))
				options = options + "&search_type=" + search_option_type;
			
			if (maxPrice != 0)
				options = options + "&search_price=" + maxPrice;
			
			if (search_option_seller_id != null)
				options = options + "&search_seller_id=" + search_option_seller_id;
%>
						<div class = "table-container">
							<table class="table table-filter">
								<tbody>
									<tr class = "itemTable">
										<td>
<%
			if (!searchFlag)
			{
%>
											<div class = "media" onclick = "location.href = '/SE/item/item_show_detail.jsp?itemId=<%=itor.getId()%>&search_text=<%=search_value%>'">
<%
			}
			
			else
			{
%>
											<div class = "media" onclick = "location.href = '/SE/item/item_show_detail.jsp?itemId=<%=itor.getId()%>&search_text=<%=search_value%>&<%=options%>'">
<%
			}
%>
												<div class = "media-left">
													<img src = "/SE/pictures/Item/<%= itor.itemImage %>" style = "width : 120px; height : 120px;" class="media-photo">
												</div>
												
												<div class = "media-body">
													<h4> <%= itor.name %> </h4>
													
													<p class="summary"> 종류 : <%= itor.getType() %> </p>
													<p> 판매자 : <%= itor.itemRegUserId %> </p>
													
													<div class = "pull-right">
														<%= itor.price %> 포인트
													</div>
												</div>
												
												<div class = "media-right">
													
												</div>
											</div>
										</td>
										
										<td class = "align-middle">
<%
			if (LoginedUser != null)
			{
%>
											<form action = "/SE/item/item_order.jsp?<%=options%>" method = "post">
												<button class="btn btn-default" type="submit" title = "장바구니에 담기"> <i class="glyphicon glyphicon-shopping-cart"></i> </button> <br>
											</form>
<%
			}
			
			if (!searchFlag)
			{
%>				
											<form action = "/SE/item/item_show_detail.jsp?itemId=<%=itor.getId()%>&search_text=<%=search_value%>" method = "post">
<%
			}
			
			else
			{
%>
											<form action = "/SE/item/item_show_detail.jsp?<%=options%>" method = "post">
<%
			}
%>
												<button class="btn btn-default" type="submit" title = "자세히 보기"> <i class="glyphicon glyphicon-search"></i> </button>
											</form>
										</td>
									</tr>
<%
		}
	}
	
	catch (Exception e)
	{
		out.println("Class name : " + e.getStackTrace().getClass().getName() + "<br>");
		out.println(e.toString());
	}
%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>


<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>

</body>
</html>
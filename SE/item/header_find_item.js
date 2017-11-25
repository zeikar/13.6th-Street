function start_search()
{	
	var searchData = document.getElementsByName("search_text");
	
	window.location.href = "/SE/item/item_search.jsp?search_text=" + searchData[0].value;
}
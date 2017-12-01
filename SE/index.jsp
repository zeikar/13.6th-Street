<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ page import="Item.Item" contentType="text/html; charset=UTF-8" %>

<style>
/* Mobile */
@media (max-width: 767px) {
    .slider-size {
        height: 500px;
    }
    .slider-size > img {
         width: 80%;
    }
}

/* tablets */
@media (max-width: 991px) and (min-width: 768px) {
    .slider-size {
        height: 400px;
    }
    .slider-size > img {
        width: 80%;
    }
}

/* laptops */
@media (max-width: 1023px) and (min-width: 992px) {
    .slider-size {
         height: 200px;
    }
    .slider-size > img {
        width: 80%;
    }
}

/* desktops */
@media (min-width: 1024px) {
    .slider-size {
        height: 300px;
    }
    .slider-size > img {
        width: 60%;
    }
}

.item img {
  object-fit:cover;
  }

.item > a > img {
    margin: 0 auto;
}
</style>

<%
if(request.getParameter("error") != null)
{
%>
<div id="fkmsg" style="margin-top: 60px; z-index: 0" class="container navbar-fixed-top">
  <div class="alert alert-danger">
      <strong>에러!</strong> 비정상적인 접근입니다.
  </div>
</div>
<%
}
%>
<%
if(request.getParameter("login") != null)
{
%>
<div id="fkmsg" style="margin-top: 60px; z-index: 0" class="container navbar-fixed-top">
  <div class="alert alert-success alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
    <strong>로그인 성공!</strong> <%=UserAccountController.getUserName((String)session.getAttribute("sessionID"))%> 님 환영합니다.
  </div>
</div>
<%
}
%>
<%
if(request.getParameter("logout") != null)
{
%>
<div id="fkmsg" style="margin-top: 60px; z-index: 0" class="container navbar-fixed-top">
  <div class="alert alert-info alert-dismissable fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
    <strong>로그아웃 되었습니다.</strong> 안녕히 가세요!
  </div>
</div>
<%
}
%>
<%
if(request.getParameter("admin") != null)
{
%>
<div id="fkmsg" style="margin-top: 60px; z-index: 0" class="container navbar-fixed-top">
  <div class="alert alert-danger">
      <strong>에러!</strong> 관리자 권한이 필요합니다.
  </div>
</div>
<%
}
%>

<div class="jumbotron navbar-inverse text-center">
  <h1 style="color: #cdcdcd">Welcome To 13.6th Street!</h1>
    <div style="margin-top:20px;">
    <form class = "form-inline" action = "/SE/item/item_search.jsp" method = "get">	
      <div class="form-group">
        <select class="form-control input-lg" id="sel1" name="search_type">
          <option value="">모두 검색</option>
          <option value="Patent">특허 검색</option>
          <option value="Copyright">저작권 검색</option>
        </select>
      </div>
      <div class="input-group">
        <input name = "search_text" type="text" class="form-control input-lg" placeholder="물품 검색">
        <div class="input-group-btn">
          <button class="btn btn-default btn-lg" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
  </div>
</div>

<%
  Item recentPatent = ItemController.getRecentRegItem("Patent");
  Item recentCopyright = ItemController.getRecentRegItem("Copyright");
%>


<div class="container text-center">
  <h3>최근에 등록된 물품</h3>
  <br>
  <div class="row">
    <div class="col-sm-8 col-sm-offset-2">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">        
          <div class="item active slider-size">
            <a href="/SE/item/item_show_detail.jsp?itemId=<%=recentPatent.getId()%>&home">
              <img style="height: 100%;" src="/SE/pictures/Item/<%=recentPatent.itemImage%>" alt="Image">
              <div class="carousel-caption">
                <h3><%=recentPatent.name%></h3>
                <p>by. <%=UserAccountController.getUserName(recentPatent.itemRegUserId)%></p>
              </div>      
            </div>
          </a>

          <div class="item slider-size">
            <a href="/SE/item/item_show_detail.jsp?itemId=<%=recentCopyright.getId()%>&home"> 
              <img style="height: 100%;" src="/SE/pictures/Item/<%=recentCopyright.itemImage%>" alt="Image">
              <div class="carousel-caption">
                <h3><%=recentCopyright.name%></h3>
                <p>by. <%=UserAccountController.getUserName(recentCopyright.itemRegUserId)%></p>
              </div> 
            </a>     
          </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
    <!--<div class="col-sm-4">
      <div class="well">
        <a href="/SE/item/item_search.jsp?search_type=Patent"><p>특허 검색</p></a>
      </div>
      <div class="well">
        <a href="/SE/item/item_search.jsp?search_type=Copyrigh"><p>저작권 검색</p></a>
      </div>
    </div>-->
  </div>
  <hr>
</div>

<div class="container text-center">    
  <h3>What We Do</h3>
  <br>
  <div class="row">
    <div class="col-sm-3">
      <img src="/SE/pictures/home/patent.jpg" class="img-responsive" style="width:100%" alt="Image">
      <h4>특허 거래</h4>
    </div>
    <div class="col-sm-3"> 
      <img src="/SE/pictures/home/copyright.jpg" class="img-responsive" style="width:100%" alt="Image">
      <h4>저작권 거래</h4>    
    </div>
    <div class="col-sm-3">
      <div class="alert alert-success">
       <p>거래하기 어려웠던 특허와 저작권을 쉽게 사고 팔기 가능!</p>
      </div>
      <div class="alert alert-info">
       <p>적절한 가치로 자신이 만든 작품이나 특허를 판매하세요!</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="alert alert-warning">
       <p>회원 가입, 판매자 등록 전면 무료!</p>
      </div>
      <div class="alert alert-danger">
       <p>원하는 지식 재산을 마음껏 구매하세요!</p>
      </div>
    </div>  
  </div>
  <hr>
</div>

<div class="container text-center">    
  <h3>Our Partners</h3>
  <br>
  <div class="row">
    <div class="col-sm-2">
      <img src="/SE/pictures/home/samsung.png" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <img src="/SE/pictures/home/google.png" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <img src="/SE/pictures/home/ibm.png" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-2"> 
      <img src="/SE/pictures/home/luciz.png" class="img-responsive" style="width:100%" alt="Image">
    </div> 
    <div class="col-sm-2"> 
      <img src="/SE/pictures/home/patent logo.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>     
    <div class="col-sm-2"> 
      <img src="/SE/pictures/home/copyright logo.jpg" class="img-responsive" style="width:100%" alt="Image">      
    </div> 
  </div>
</div>

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>
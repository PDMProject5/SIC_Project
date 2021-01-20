<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 정보 탑 메뉴</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function openRightMenu() {
	  document.getElementById("rightMenu").style.display = "block";
	}

	function closeRightMenu() {
	  document.getElementById("rightMenu").style.display = "none";
	}
  </script>
<style type="text/css">

#li_Home {
	text-align: center;
}
</style>  
  
</head>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
     
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
       <!-- 로그인을 하지 않은 상태에서 판매지점을 선택했을때 -->
      <c:choose>
      	<c:when test="${not empty id}">
      		<li>
      			<a href = "./main.do">메인 페이지 이동</a>
      		</li>
      		<c:if test = "${not empty sell.sellerid}">
      		<li>
      			<a href = "./product.do?sellerid=${sell.sellerid}">메뉴</a>
      		</li>
      		<li>
      			<a href = "./bascketList.do?store=${sell.store}">장바구니</a>
      		</li>
      		</c:if>
	      	<li>
	      		<a href='#'>${id}님 환영합니다.</a>
	      	</li>
	    	<li>
	    		<a href="./logout.do">로그아웃</a>
	    	</li>
	    	<li>
    		<div class="w3-sidebar w3-bar-block w3-card w3-animate-right" style="display:none;right:0;" id="rightMenu">
  			<button onclick="closeRightMenu()" class="w3-bar-item w3-button w3-large">Close &times;</button>
  			<a href="./userModified.do" class="w3-bar-item w3-button">회원 정보 수정</a>
  			<a href="./mileage.do" class="w3-bar-item w3-button">마일리지 내역 조회</a>
  			<a href="./myCouponList.do" class="w3-bar-item w3-button">쿠폰 내역 조회</a>
 			<a href="./orderlist.do" class="w3-bar-item w3-button">주문내역  조회</a>
			</div>
			<div style="color: gray;">
  				<button onclick="openRightMenu()" style="background-color: #101010; margin-top: 10px; border-color: black;">MyPage</button>
			</div>
		</li>
    	</c:when>
    	<c:when test="${not empty sellerid}">
    		<li>
      			<a href = "./viewListCoupon.do">메인 페이지 이동</a>
      		</li>
    		<li>
      			<a href = "./product.do?sellerid=${sellerid}">MENU</a>
      		</li>
	    	<li>
	      		<a href='#'>${sellerid}님 환영합니다.</a>
	      	</li>
	    	<li>
	    		<a href="./logout.do">로그아웃</a>
	    	</li>
      	</c:when>
      	<c:otherwise>
      		<li>
      			<a href = "./main.do">메인 페이지 이동</a>
      		</li>
      		<li>
      			<a href='./loginForm.do'>로그인</a>
      		</li>
    		<li>
    			<a href="./singUp.do">회원가입</a>
    		</li>		
      	</c:otherwise>
      </c:choose>
      </ul>
    </div>
  </div>
</nav>
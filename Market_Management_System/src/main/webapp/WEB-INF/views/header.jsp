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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">


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
      <c:choose>
       <c:when test="${not empty sell}">
      	<li>
    		<a href="./product.do?sellerid=${sell.sellerid}">MENU</a>
    	</li>
      </c:when>
      	<c:when test="${empty id}">
      	<li>
      		<a href='./loginForm.do'>로그인</a>
      	</li>
    	<li>
    		<a href="./singUp.do">회원가입</a>
    	</li>
      </c:when>
      <c:when test="${not empty id}">
      	<li>
      		<a href='#'>${id}님 환영합니다.</a>
      	</li>
    	<li>
    		<a href="./logout.do">로그아웃</a>
    	</li>
      </c:when>
      
     
      </c:choose>
      </ul>
    </div>
  </div>
</nav>
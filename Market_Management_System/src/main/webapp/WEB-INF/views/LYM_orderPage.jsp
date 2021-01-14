<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>주문/결제 페이지</title>
</head>
<body>
<div id="container">

<form action="#" method="post">
<table class="table table-bordered">
	<thead>
	<tr>
		<th>제품정보</th>
		<th>지점명</th>
		<th>수량</th>
		<th>제품금액</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="order" items="${list}" varStatus="vs">
	<tr>
		<td>${order.iname}</td>
		<td>${order.store}</td>
		<td>${order.odstock} 개</td>		
		<td>
			<span id="price">
			<c:set var="odto" value="${order.odstock}"/>
			<c:set var="rdto" value="${order.oprice*odto}"/>
			<c:out value="${rdto}"/> 
			</span>
			<span>원</span>
		</td>	
	</tr>
			<c:set var="sum" value="${sum+rdto}"/> 
		</c:forEach>
		
		
	</tbody>
</table>
<!-- <div> -->
<!-- 	<h2> -->
<!-- 	<span>총 주문 금액:</span> -->
<%-- 	<span><c:out value="${sum}"/> </span>원 --%>
<!-- 	</h2> -->
<!-- </div> -->
<div>
	<h2>배송여부</h2>
</div>
<div>
	<strong>배송</strong>
	<input type="checkbox" id="" onclick="">
	<strong>배송X</strong>
	<input type="checkbox" id="" onclick="">
</div>
<div>
	<input class="btn-success btn btn-primary" type="button" value="결제하기" onclick="">
</div>
</form>
</div>

</body>
</html>
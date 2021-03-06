<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<%@ include file="./header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#container{
	margin: 0 auto;
	text-align: center;
	width: 70%;
	height: 100%;
}

th{
	
	background-color : beige;
		text-align:center; 
		color:#8A6F24; 
}



</style>
</head>
<body>
<div id="container" class="table-responsive">
<h2>매장 정보</h2>
<table class="table">
	<thead>
		<tr>
			<th>지점명</th>
			<th>전화번호</th>
		</tr>
	</thead>
		<c:forEach var="vo" items="${seller}">
		<tr>
			<td><a href="./userViewListCoupon.do?store=${vo.store}">${vo.store}</a></td>
			<td>${vo.storephone}</td>
		</tr>
		</c:forEach>
	<tbody>
	
	</tbody>
</table>
</div>

<%@ include file="./footer.jsp" %>
</body>
</html>
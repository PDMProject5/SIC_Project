<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 적용</title>
<style type="text/css">
	table, th, td{
	border: 1px solid black;
	padding: 5px;
	margin: auto;
	text-align: center;
}

a {
	text-decoration: none;
	font-weight: bold;
	color: black;
}
div {
	text-align:center;
	margin: auto;
	padding: 10px;
}
</style>
</head>
<body>
<div>
	<h1>쿠폰 적용</h1>
	<table>
		<thead>
		<c:forEach items="${cbList}" var="cbList">
			<tr>
				<th><a href="#">${cbList.cnotify}</a></th>
			</tr>
		</c:forEach>
		</thead>
	</table>
</div>
</body>
</html>
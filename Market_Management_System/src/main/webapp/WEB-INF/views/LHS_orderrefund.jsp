<%@page import="com.sic.pdm.vo.or.RefounddetailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
	<h1>환불 요청</h1>
	<form action="./refund.do" method="post">
	<input type="hidden" id="onum" name="onum" value="${vo.onum}">
		<table>
			<tr>
				<th>아이디</th>
				<td>${vo.id}</td>
			</tr>
			<tr>
				<th>주문 번호</th>
				<td>${vo.onum}</td>
			</tr>
			<tr>
				<th>환불 사유</th>
				<td><textarea rows="10" id="reason" name="reason"></textarea></td>
			</tr>
		</table>
		<div>
			<input type="submit" value="환불 요청하기">
		</div>
		
	</form>
	<div>
		<input type="button" value="돌아가기" onclick="history.back(-1)">
		</div>
</body>
</html>
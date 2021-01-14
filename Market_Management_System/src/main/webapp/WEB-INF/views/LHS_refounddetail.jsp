<%@page import="com.sic.pdm.vo.or.RefounddetailVo"%>
<%@page import="com.sic.pdm.vo.or.RefoundVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	RefounddetailVo rvo = (RefounddetailVo)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h1>환불요청 상세</h1>
	</div>
		<table>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>아이디</th>
					<th>환불 사유</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=rvo.getOnum() %></td>
					<td><%=rvo.getId() %></td>
					<td><%=rvo.getReason()%></td>
					<td><%=rvo.getOdate() %></td>
				</tr>
			</tbody>
		</table>
		
		<div>
			<input type="button" value="환불 불가능" onclick="location.href='./refoundRefuse.do?onum=<%=rvo.getOnum() %>'">
			<input type="button" value="환불 승인" onclick="location.href='./refoundApprove.do?onum=<%=rvo.getOnum() %>'">
		</div>
</body>
</html>
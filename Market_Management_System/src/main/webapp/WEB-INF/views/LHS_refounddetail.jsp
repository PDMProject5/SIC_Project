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
 	table{
/*  	border: 1px solid black;  */
/*  	padding: 50px;  */
 	margin: auto; 
 	text-align: center; 
	margin-top:10px; 
/* 	border-top:5px solid beige;  */
	margin-bottom: 50px;
}

#th{
	background-color : beige;
	text-align:center; 
	color:#8A6F24; 
	height: 70px;
	width: 200px;
	
/* 	background-color: beige; */
/* 	text-align: center; */
/* 	height: 70px; */
/* 	width: 100px; */
}
td{
	border-bottom:1px solid #dadada; 
	text-align:center; 
	color:#2f231c; 
	height: 50px;
	width: 500px;
	
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
			<tbody>
				<tr>
					<th id="th">주문번호</th>
					<td><%=rvo.getOnum() %></td>
				</tr>
				<tr>
					<th id="th">아이디</th>
					<td><%=rvo.getId() %></td>
				</tr>
				<tr>
					<th id="th">날짜</th>
					<td><%=rvo.getOdate() %></td>
				</tr>
				<tr>
					<th id="th">환불 사유</th>
					<td><%=rvo.getReason()%></td>
				</tr>
			</tbody>
		</table>
		
		<div>
			<input type="button" value="환불 불가능" onclick="location.href='./refoundRefuse.do?onum=<%=rvo.getOnum() %>'">
			<input type="button" value="환불 승인" onclick="location.href='./refoundApprove.do?onum=<%=rvo.getOnum() %>'">
		</div>
</body>
</html>
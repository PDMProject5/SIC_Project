<%@page import="com.sic.pdm.vo.or.OrderVo"%>
<%@page import="java.util.List"%>
<%@page import="com.sic.pdm.vo.or.OrderdetailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	Object obj = request.getAttribute("list");
        List<OrderdetailVo> listss = (List<OrderdetailVo>)obj;
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
		<h1>주문 상세정보</h1>
	</div>
	
	<table>
		<thead>
			<tr>
				<th>주문날짜</th>
				<th>주문번호</th>
				<th>제품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>지점</th>
				<th>상태</th>
				<th>이름</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>결제 금액</th>
				<th>할인 금액</th>
				<th>환불 요청</th>
			</tr>
		</thead>
		<tbody>
					<%
						for(OrderdetailVo oddto : listss){
					%>
			<tr>
				<td><%=oddto.getOdate() %></td>
				<td><%=oddto.getOnum() %></td>
				<td><%=oddto.getIname() %></td>
				<td><%=oddto.getOdstock() %></td>
				<td><%=oddto.getOprice() %></td>
				<td><%=oddto.getStore() %></td>
				<td><%=oddto.getOstate() %></td>
				<td><%=oddto.getName() %></td>
				<td><%=oddto.getAddr() %></td>
				<td><%=oddto.getPhone() %></td>
				<td><%=oddto.getPaymentamt() %></td>
				<td><%=oddto.getDiscountamt() %></td>
				<td><a href="./refundinsert.do?onum=<%=oddto.getOnum() %>">환불</a></td>
				
			</tr>
			<%
						}
				%>
		</tbody>
	</table>
	<div>
		<input type="button" value="돌아가기" onclick="history.back(-1)">
	</div>
</body>
</html>
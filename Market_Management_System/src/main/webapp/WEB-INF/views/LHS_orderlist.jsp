<%@page import="com.sic.pdm.vo.or.OrderVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <%
                	Object obj = request.getAttribute("list");
                    List<OrderVo> lists = (List<OrderVo>)obj;
                %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 조회</title>
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
		<h1>주문목록 조회</h1>
	</div>
		<table>
			<thead>
				<tr>
					<th>주문 날짜</th>
					<th>주문 번호</th>
					<th>제품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>지점명</th>
					<th>주문 상태</th>
					<th>주문 상제</th>
				</tr>
			</thead>
		
			<tbody>
				<%
					if (lists == null || lists.size() == 0) {
				%>
					<tr>
						<th colspan="8">주문내역이 없습니다.</th>
					</tr>
					<%
						}
								else{
									for(OrderVo odto : lists){
					%>
				<tr>
					<td><%=odto.getOdate() %></td>
					<td><%=odto.getOnum() %></td>
					<td><%=odto.getIname()%></td>
					<td><%=odto.getOdstock()%></td>
					<td><%=odto.getOprice()%></td>
					<td><%=odto.getStore() %></td>
					<td><%=odto.getOstate() %></td>
					<td><a href="./orderdetail.do?onum=<%=odto.getOnum()%>">주문 상세</a></td>
				</tr>
				<%
						}
					}
				%>
			</tbody>
		</table>
	<div>
		<input type="button" value="돌아가기" onclick="history.back(-1)">
	</div>

</body>
</html>
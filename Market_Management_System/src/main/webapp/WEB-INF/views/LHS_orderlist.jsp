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
	width: 100px;
	
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
<%@ include file="./header.jsp" %>
<body>

	<div>
		<h1>주문목록 조회</h1>
	</div>
		<table>
			<thead>
				<tr>
					<th id="th">주문 날짜</th>
					<th id="th">주문 번호</th>
					<th id="th">제품명</th>
					<th id="th">수량</th>
					<th id="th">가격</th>
					<th id="th">지점명</th>
					<th id="th">주문 상태</th>
					<th id="th">주문 상제</th>
				</tr>
			</thead>
		
			<tbody>
				<%
					if (lists == null || lists.size() == 0 ) {
				%>
					<tr>
						<td colspan="8">주문내역이 없습니다.</td>
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
<%@ include file="./footer.jsp" %>
</html>
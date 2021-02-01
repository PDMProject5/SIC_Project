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

table{
/*  	border: 1px solid black;  */
 	padding: 50px; 
 	margin: auto; 
 	text-align: center; 
	margin-top:10px; 
/* 	border-top:5px solid beige;  */
	border-spacing:0;
	margin-bottom: 50px;
}

#th{
	background-color : beige;
	text-align:center; 
	color:#8A6F24; 
	height: 70px;
	
/* 	background-color: beige; */
/* 	text-align: center; */
/* 	height: 70px; */
/* 	width: 100px; */
}
td{
	border-bottom:1px solid #dadada; 
	text-align:center; 
	color:#2f231c; 
	font-size:13px;
	
}
tbody{
	margin: 50px;
	padding: 50px;
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

.next{
	margin : auto;
		text-align: center;
	color: beige;
	background-color: #8A6F24;
	border: 2px solid #8A6F24;
	padding: 15px 15px;
	border-radius: 8px;
 	transition-duration: 0.4s; 
 	 cursor: pointer;
	}
	.button1 {
 	 background-color: #8A6F24; 
 	 color: beige; 
 	 border: 2px solid #8A6F24;
	}
	.button1:hover {
  	background-color: beige;
  	color: #8A6F24;
	}

</style>
</head>
<%@ include file="./header.jsp" %>
<body>
	<div>
		<h1>주문 상세정보</h1>
	</div>
	
	<table>
		<thead>
			<tr>
				
				
			</tr>
		</thead>
		<tbody>
					<%
						for(OrderdetailVo oddto : listss){
					%>
			<tr>
				<th id="th" style="width: 100px;">주문날짜</th>
				<td style="width: 500px;" colspan="5"><%=oddto.getOdate() %></td>
			</tr>
			<tr>
				<td><input type="hidden" value="<%=oddto.getOnum() %>"></td>
				</tr>
				<%
						for(OrderdetailVo oddtoo : listss){
					%>
			<tr>
				<th id="th" width="100px">제품명</th>
				<td width="150px"><%=oddtoo.getIname() %></td>
				<th id="th" width="100px">수량</th>
				<td width="150px"><%=oddtoo.getOdstock() %></td>
				<th id="th" width="100px">가격</th>
				<td width="150px"><%=oddtoo.getOprice() %></td>
				</tr>
				<%
						}
				%>
			<tr>
				<th id="th">지점</th>
				<td colspan="5"><%=oddto.getStore() %></td>
				</tr>
			<tr>
				<th id="th">상태</th>
				<td><%=oddto.getOstate() %></td>
				<th id="th">이름</th>
				<td><%=oddto.getName() %></td>
				<th id="th">휴대폰</th>
				<td><%=oddto.getPhone() %></td>
				</tr>
			<tr>
				<th id="th">주소</th>
				<td colspan="5"><%=oddto.getAddr() %></td>
			</tr>
			<tr>
				<th id="th">결제 금액</th>
				<td colspan="2"><%=oddto.getPaymentamt() %></td>
				<th id="th">할인 금액</th>
				<td colspan="2"><%=oddto.getDiscountamt() %></td>
			</tr>

			<tr>
				<th id="th">환불 요청</th>
				<td colspan="5"><a href="./refundinsert.do?onum=<%=oddto.getOnum() %>">환불 요청하기</a></td>
			</tr>
							<%
					}
				%>
		</tbody>
	</table>
	
	<div>
		<input type="button" class="next button1" value="돌아가기" onclick="history.back(-1)">
	</div>
</body>
<%@ include file="./footer.jsp" %>

</html>
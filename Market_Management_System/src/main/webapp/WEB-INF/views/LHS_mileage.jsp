<%@page import="java.util.List"%>
<%@page import="com.sic.pdm.vo.mileage.MileageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MileageVo vo = (MileageVo)request.getAttribute("mil");
	Object obj = request.getAttribute("lists");
	List<MileageVo> lists = (List<MileageVo>)obj;
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
<%@ include file="./header.jsp" %>
<body>
	<div>
		<h1>마일리지</h1>
		<%
					if (lists == null || lists.size() == 0) {
				%>
				<h2>총 마일리지 : 0</h2>
				<%
						}
								else{
									
					%>
		<h2>보유 마일리지 : <%=vo.getMmoney()%></h2>
		<%
						}
				%>
	</div>
	
	<div>
		<table>
			<thead>
				<tr>
					<th>주문 번호</th>
					<th>아이디</th>
					<th>적립/사용</th>
					<th>주문 상태</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (lists == null || lists.size() == 0) {
				%>
				<tr>
					<th>내역이 없습니다.</th>
				</tr>
				<%
					}
					else{
					for(MileageVo mvo : lists){
				%>
				<tr>
					<td><%=mvo.getMseq() %></td>
					<td><%=mvo.getId() %></td>
					<td><%=mvo.getMmoney() %></td>
					<td><%=mvo.getMstate() %></td>
					<td><%=mvo.getMdate() %></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</div>
	<div>
		<input type="button" value="돌아가기" onclick="history.back(-1)">
	</div>
</body>
<%@ include file="./footer.jsp" %>
</html>
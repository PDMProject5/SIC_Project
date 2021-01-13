<%@page import="com.sic.pdm.vo.or.RefoundVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
                	Object obj = request.getAttribute("list");
                    List<RefoundVo> lists = (List<RefoundVo>)obj;
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
		<h1>환불 요청 목록 조회</h1>
	</div>
		<table>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>아이디</th>
					<th>지점명</th>
					<th>날짜</th>
					<th>상태</th>
					<th>환불 상세</th>
				</tr>
			</thead>
			<tbody>
			<%
					if (lists == null || lists.size() == 0) {
				%>
					<tr>
						<th colspan="6">환불요청 내역이 없습니다.</th>
					</tr>
					<%
						}
								else{
									for(RefoundVo rvo : lists){
					%>
				<tr>
					<td><%=rvo.getOnum() %></td>
					<td><%=rvo.getId() %></td>
					<td><%=rvo.getStore() %></td>
					<td><%=rvo.getOdate() %></td>
					<td><%=rvo.getOstate() %></td>
					<td><a href="./refounddetail.do?id=<%=rvo.getId() %>&onum=<%=rvo.getOnum()%>">환불 요청 상세조회</a></td>
				</tr>
				<%
						}
					}
				%>
			</tbody>
		</table>
		
</body>
</html>
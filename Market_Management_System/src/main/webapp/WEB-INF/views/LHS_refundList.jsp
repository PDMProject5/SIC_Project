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
	width: 160px;
	
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
}padding: 10px;
}

</style>
</head>
<%@ include file="./header.jsp" %>
<body>
	<div>
		<h1>환불 요청 목록 조회</h1>
	</div>
		<table>
			<thead>
				<tr>
					<th id="th">주문번호</th>
					<th id="th">아이디</th>
					<th id="th">지점명</th>
					<th id="th">날짜</th>
					<th id="th">상태</th>
					<th id="th">환불 상세</th>
				</tr>
			</thead>
			<tbody>
			<%
					if (lists == null || lists.size() == 0) {
				%>
					<tr>
						<td colspan="6">환불요청 내역이 없습니다.</td>
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
		<div>
		<input type="button" value="돌아가기" onclick="history.back(-1)">
		</div>
</body>
<%@ include file="./footer.jsp" %>
</html>
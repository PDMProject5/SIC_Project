<%@page import="java.util.List"%>
<%@page import="com.sic.pdm.vo.mileage.MileageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<th id="th">번호</th>
					<th id="th">아이디</th>
					<th id="th">마일리지</th>
					<th id="th">적립/사용</th>
					<th id="th">날짜</th>
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
					<td><%=mvo.getMstate()%></td>
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
		<input type="button" class="next button1" value="돌아가기" onclick="history.back(-1)">
	</div>
</body>
<%@ include file="./footer.jsp" %>
</html>
<%@page import="com.sic.pdm.vo.or.RefounddetailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function refund(){
		var form = document.forms[0];
		var reason = document.getElementById("reason");
		
		if (reason.value == "") {
			alert("환불 사유를 작성해주세요.");
		}else {
			form.submit();
		}
	}
</script>
<%@ include file="./header.jsp" %>
<body>
<div>
	<h1 align="center">환불 요청</h1>
	<form action="./refund.do" method="post">
	<input type="hidden" id="onum" name="onum" value="${vo.onum}">
		<table>
			<tr>
				<th id="th">아이디</th>
				<td>${vo.id}</td>
			</tr>
			<tr>
				<th id="th">주문 번호</th>
				<td>${vo.onum}</td>
			</tr>
			<tr>
				<th id="th">환불 사유</th>
				<td><textarea rows="10" cols="80" id="reason" name="reason"></textarea></td>
			</tr>
		</table>
		<div>
			<input type="button" class="next button1" value="환불 요청하기" onclick="refund()">
			<input type="button" class="next button1" value="돌아가기" onclick="history.back(-1)">
		</div>
		
	</form>
</div>
</body>
<%@ include file="./footer.jsp" %>
</html>
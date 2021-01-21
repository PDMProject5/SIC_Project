<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>쿠폰 적용</title>
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
	<h1>쿠폰 적용</h1>
	<form action="#" method="post" id="couponSel">
	<table>
		<thead>
			<tr>
				<th colspan="2">사용 가능한 쿠폰</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${cList}" var="cList"  varStatus="vs">
			<tr>
				<td>${cList.cnotify}</td>
<%-- 				<td>${cList.cdate}</td> --%>
				<td>
					<input type="button" id="cseq" name="cseq" value="선택" onclick="couponSelect(${cList.cseq})">
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</form>
	<div>
		<input type="hidden" id="coupon">
	</div>
</div>
</body>
<script type="text/javascript">
function couponSelect(val){
	var price = window.opener.document.getElementById("price").innerHTML 
	if(price == 0){
		alert("쿠폰을 적용할 수 없습니다.");
		window.close();
	}else{
		
	ajaxSel(val);
	}
	
}


var ajaxSel = function(val){
	$.ajax({
		url : './couponSelect.do',
		method : 'post',
		data : "cseq="+val,
		dataType : 'json',
		success : function(c){
			console.log(c.cseq, c.coupon)
			window.opener.document.getElementById("coupon").value = c.coupon;
			var a = window.opener.document.getElementById("price").innerHTML;
			
				var result = a - c.coupon;

// 			alert(result)
			window.opener.document.getElementById("price").innerHTML = result;
			window.close();
		},
		error : function(){
			alert("에러");
		}
	});
}

</script>
</html>
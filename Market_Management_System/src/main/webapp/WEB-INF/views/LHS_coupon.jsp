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
	ajaxSel(val);

	
	
}

// 쿠폰값만 가져와
var ajaxSel = function(val){
	$.ajax({
		url : './couponSelect.do',
		method : 'post',
		data : "cseq="+val,
		dataType : 'json',
		success : function(c){
			console.log(c.cseq, c.coupon)
			var mileVal = window.opener.document.getElementById("mileVal").value;
			var b = window.opener.document.getElementById("distotal").innerHTML;
			var pprice = window.opener.document.getElementById("pprice").innerHTML;
			var price = window.opener.document.getElementById("price").innerHTML;
			if(Number(price) < Number(c.coupon)){
				alert("쿠폰을 적용할 수 없습니다.");
				window.close();
				return false;
			}

			window.opener.document.getElementById("coupon").value = c.coupon;
			window.opener.document.getElementById("cseq").value = c.cseq;
			window.opener.document.getElementById("couponVal").value = c.coupon;
			window.opener.document.getElementById("distotal").innerHTML = Number(c.coupon) + Number(mileVal);
			window.opener.document.getElementById("price").innerHTML = Number(pprice) - (Number(c.coupon) + Number(mileVal));
			
			
			window.close();
		},
		
	});
}

</script>
</html>
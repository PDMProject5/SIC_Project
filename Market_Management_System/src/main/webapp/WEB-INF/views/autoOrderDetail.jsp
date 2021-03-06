<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container{
	width: 750px;
	text-align: center;
	margin: 0 auto;
}
table{
	width: 60%;
	margin: 100px auto;
	text-align: center;
}
input[type="number"]{
	width: 100%;
}
.btn{
	margin-top: 100px;
}
</style>
</head>
<%@ include file="./header.jsp" %>
<script type="text/javascript">
	function updateautoOrder(){
		var autonum = document.getElementById("autonum");
		var ordernum = document.getElementById("ordernum");
		var form = document.getElementById("frm");
		if(autonum.value == ""){
			alert("설정 개수를 입력해 주세요");
			autonum.focus();
		}else if(ordernum.value == ""){
			alert("입고 개수를 입력해 주세요");
			ordernum.focus();
		}else if(autonum.value <= 0||ordernum.value <= 0){
			alert("한개 이상의 갯수를 입력해 주세요");
		}else{
			alert("수정이 완료되었습니다.");
			form.submit();
		}
	}
</script>
<body>
<div id="container">
<form id="frm" action="./updateautoOrder.do" method="post">
	<input type="hidden" name="iname" value="${detaillist.iname}">
	<table border="1">
		<thead>
		<tr>
			<td style="font-weight: bold; background-color:#F4B4B4; height: 30px;">제품명</td>
			<td style="font-weight: bold; background-color:#F4B4B4;">설정 개수</td>
			<td style="font-weight: bold; background-color:#F4B4B4;">입고 개수</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td style="width: 100px;">
				${detaillist.iname}
			</td>
			<td>
				<input type="number" id="autonum" name="autonum" value="${detaillist.autonum}">
			</td>
			<td>
				<input type="number" id="ordernum" name="ordernum" value="${detaillist.ordernum}">
			</td>
		</tr>
		</tbody>
	</table>
</form>
	<button class="btn" style="margin-right: 100px;" onclick="updateautoOrder()">자동 발주 수정</button>
	<button class="btn" onclick="location.href='./autoOrderform.do'">뒤로가기</button>
</div>
</body>
<%@ include file="./footer.jsp" %>
</html>
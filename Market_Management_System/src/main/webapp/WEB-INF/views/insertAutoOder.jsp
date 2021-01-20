<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function insertAutoOrder(){
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
			alert("제품이 등록되었습니다.");
			form.submit();
		}
	}
</script>
<body>
<form id="frm" action="./insertAutoOrder.do" method="post">
	<input type="hidden" name="iname" value="${iname}">
	<table border="1">
		<thead>
		<tr>
			<th>제품명</th>
			<th>설정 개수</th>
			<th>입고 개수</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>
				${iname}
			</td>
			<td>
				<input type="number" id="autonum" name="autonum">
			</td>
			<td>
				<input type="number" id="ordernum" name="ordernum">
			</td>
		</tr>
		</tbody>
	</table>
</form>
	<button onclick="insertAutoOrder()">등록하기</button>
	<button onclick="location.href='javascript:history.back();'">뒤로가기</button>
</body>
</html>
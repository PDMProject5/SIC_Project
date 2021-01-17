<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function cpchk(){
	window.open("./cpchk.do","할인쿠폰","width=500px, height=500px");
}
</script>
<body>
	<div>
		<h1>결제</h1>
		<hr>
		<h2>쿠폰 적용</h2>
		<input type="text" id="coupon" name="id" readonly >
		<input type="button" value="할인 쿠폰" onclick="cpchk()">
		<hr>
		<h2>마일리지 적용</h2>
		<input type="text" id="mileage" name="mileage">
		<input type="button" value="전체 적용">
	</div>
</body>
</html>
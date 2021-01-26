<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./header.jsp" %>
<style type="text/css">
p{
	color: orange;
}
button{
	margin-top: 200px;
}
</style>
</head>
<script type="text/javascript">
	function chs(){
		var check = confirm("탈퇴 하시겠습니까?");
		if(check == true){
			location.href="./updateuser.do";
		}
	}
</script>
<body>
<div style="text-align: center;">
<h1>회원탈퇴</h1><br>
<h2><span style="color: red;">&#42;</span>회원탈퇴를 하기 전에 안내사항을 꼭 확인 해 주세요.</h2>
</div>
<div style="text-align: center;">
	<h1>회원정보 및 서비스 이용기록 삭제</h1>
	<p>회원 정보 및 서비스 이용기록, 결제정보는 탈퇴 한 시점으로부터</p><br>
	<p>2년 동안 유지되며 2년 후 영구 삭제됩니다.</p><br>
	<p>삭제 된 데이터는 복구되지 않습니다.</p><br>
	<button class="btn btn-warning" onclick="chs()">탈퇴하기</button>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>
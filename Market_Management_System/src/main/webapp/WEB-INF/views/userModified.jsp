<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<%@ include file="./header.jsp" %>
<style type="text/css">
#container{
	width: 450px;
	margin: 0 auto;
	text-align: center;
}
.buttn {
	margin-top: 150px;
	width: 250px;
}
</style>
</head>
<body>
<div id="container">
<button class="btn btn-warning buttn" onclick="location.href='./updatepw.do'">비밀번호 변경</button><br>
<button class="btn btn-warning buttn" onclick="location.href='./singout.do'">회원탈퇴</button>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 조회 결과</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<p style="margin-top: 30px;">회원님의 아이디는 <span style="color: green;">${findid}</span>입니다.</p>
<button class="btn btn-warning" onclick="location.href='./findpw.do'">비밀번호 찾기</button>
</body>
</html>
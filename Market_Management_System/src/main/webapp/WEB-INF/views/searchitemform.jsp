<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동 발주 제품 검색</title>
</head>
<body>
<form action="./searchitem.do" method="post">
<input type="text" id="iname" name="iname">
<input type="submit" value="검색">
</form>
<button onclick="location.href='./autoOrderform.do'">뒤로가기</button>
</body>
</html>
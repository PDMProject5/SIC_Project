<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 페이지</title>
</head>
<body>
${sellerid}
<button onclick="location.href='./logout.do'">로그아웃</button>
<button onclick="location.href='./ViewListCoupon.do'">행사 정보 관리</button>
<button onclick="location.href='./autoOrderform.do'">자동 발주</button>
</body>
</html>
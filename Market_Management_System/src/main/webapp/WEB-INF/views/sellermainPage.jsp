<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 페이지</title>
<%@ include file="./header.jsp" %>
</head>
<body>
<button onclick="location.href='./viewListCoupon.do">행사 정보 관리</button>
<button onclick="location.href='./autoOrderform.do'">자동 발주</button>
<button onclick="location.href='./refoundList.do'">환불 요청 목록</button>
<%@ include file="./footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${id}
<button onclick="location.href='./logout.do'">로그아웃</button>
<button onclick="location.href='./userModified.do'">회원정보 수정</button>
<button onclick="location.href='./myCouponList.do'">쿠폰 내역 조회</button>
<button onclick="location.href='./delList.do'">배송지 목록 조회</button>
<button onclick="location.href='./userViewListCoupon.do'">가산디지털 단지점</button>
<button onclick="location.href='./orderlist.do'">주문 목록 조회</button>
<button onclick="location.href='./bascketList.do'">장바구니 조회</button>
</body>
</html>
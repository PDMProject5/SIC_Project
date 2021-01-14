<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function backBtn() {
		history.back();
	}
	
	function getCouponBtn(cseq) {
		location.href = "./getCoupon.do?cseq="+cseq;
	}

</script>
</head>
<body>
	<table>
		<tr>
			<th>쿠폰내용</th>
			<td>${ucv.cnotify}</td>
		</tr>
		<tr>
			<td>쿠폰 지급 기간</td>
			<td>
			<fmt:parseDate var="startDate" value="${ucv.cdate}" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/> 2020-01-01
			~
			<fmt:parseDate var="endDate" value="${ucv.cdate}" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<td><img src="${ucv.cthumbimg}" /></td>
		</tr>
		<tr>
			<td>
				<input type="button" id="btn_getCoupon" value="쿠폰 받기" onclick="getCouponBtn(${ucv.cseq})">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="btn_back" value="뒤로가기" onclick="backBtn()">
			</td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript">
	function goInsertCoupon() {
		
		location.href="./goInsertCoupon.do"
		
	}
</script>
</head>
<body>
	<table>
		<c:forEach items="${cList}" var="cList">
			<tr>
				<td><a href = "./viewOneCoupon.do?cseq=${cList.cseq}"><img src = "${cList.cthumbimg}" ></a></td>
			</tr>
			<tr>
				<td>${cList.cnotify}</td>
			</tr>
			<tr>
				<td>
					<fmt:parseDate var="startDate" value="${cList.cdate}" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>
					~
					<fmt:parseDate var="endDate" value="${cList.cdate}" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type = "button" value = "쿠폰 등록" onClick = "goInsertCoupon()">
</body>
</html>
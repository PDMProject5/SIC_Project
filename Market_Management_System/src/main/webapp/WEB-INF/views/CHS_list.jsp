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
<style type="text/css">
	
	#storeCouponList{
		float: left;
	}

</style>
<script type="text/javascript">
	function goInsertCoupon() {
		
		location.href="./goInsertCoupon.do"
		
	}
</script>
</head>
<body>
	<div id = "storeCouponList">
	<c:forEach items="${cList}" var="cList">
		<div id = "storeCouponList_1">
			<div id = "storeCouponList_cimg">
				<a href = "./viewOneCoupon.do?cseq=${cList.cseq}"><img src = "${pageContext.request.contextPath}${cList.cimg}" ></a>
			</div>
			<div id = "storeCouponList_cnotify">
				${cList.cnotify}
			</div>
			<div id = "storeCouponList_cdate">
				<fmt:parseDate var="startDate" value="${cList.cdate}" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>
				~
				<fmt:parseDate var="endDate" value="${cList.cdate}" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>
			</div>
		</div>
	</c:forEach>
</div>
	<!-- 페이징 -->
	<div id = "storePageNum">
		<c:if test="${pvo.prev}">
			[ <a href="./viewListCoupon.do?num=${pvo.startPageNum - 1}">이전</a> ]
		</c:if>
		<c:forEach begin="${pvo.startPageNum}" end="${pvo.endPageNum}" var="num">
			<span>
				<c:if test="${select != num}">
					<a href="./viewListCoupon.do?num=${num}">${num}</a>
				</c:if>
				<c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>
		<c:if test="${pvo.next}">
			<span>[ <a href="./viewListCoupon.do?num=${pvo.endPageNum + 1}">다음</a>]
			</span>
		</c:if>
	</div>
	<!-- 쿠폰등록 버튼 -->
	<div id = "btn_insertCoupon">
		<input type = "button" value = "쿠폰 등록" onClick = "goInsertCoupon()">
	</div>
</body>
</html>
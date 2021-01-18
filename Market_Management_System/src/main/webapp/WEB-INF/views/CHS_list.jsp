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
	
	#storeCouponList_1{
		float: left;
	}
	
	#btn_insertCoupon{
	float: right;
}

</style>
<script type="text/javascript">

	function goInsertCoupon() {
		
		location.href="./goInsertCoupon.do"
		
	}
	
	function backBtn() {
		history.back();
	}
</script>
</head>
<body>
	<div id="storeCouponList">
		<c:choose>
			<c:when test="${not empty cList}">
				<c:forEach items="${cList}" var="cList">
					<div id="storeCouponList_1">
						<div id="storeCouponList_cimg">
							<a href="./viewOneCoupon.do?cseq=${cList.cseq}"><img src="${pageContext.request.contextPath}${cList.cthumbimg}"></a>
						</div>
						<div id="storeCouponList_cnotify">
						${cList.cnotify}
						</div>
						<div id="storeCouponList_cdate">
							<fmt:parseDate var="startDate" value="${cList.cdate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
							~
							<fmt:parseDate var="endDate" value="${cList.clastdate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h3>현재 보유 쿠폰이 없습니다..</h3>
				<br />
				<h3>쿠폰을 등록해 주세요</h3>
				<input type="button" value="뒤로가기" onclick="backBtn()">
			</c:otherwise>
		</c:choose>
		<!-- 페이징 -->
		<div id="storePageNum">
			<c:if test="${pvo.prev}">
				<span>
					[ <a href="./viewListCoupon.do?num=${pvo.startPageNum - 1}">이전</a> ]
				</span>
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
				<span>
					[ <a href="./viewListCoupon.do?num=${pvo.endPageNum + 1}">다음</a>]
				</span>
			</c:if>
		</div>
		<!-- 쿠폰등록 버튼 -->
		<div id="btn_insertCoupon">
			<input type="button" value="쿠폰 등록" onClick="goInsertCoupon()">
		</div>
	</div>
</body>
</html>
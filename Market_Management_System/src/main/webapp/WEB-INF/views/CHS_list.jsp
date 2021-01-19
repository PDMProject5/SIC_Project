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
	
	function backBtn() {
		history.back();
	}
</script>
</head>
<body>
	<div id="storeCouponList">
		<div>
		<c:choose>
			<c:when test="${not empty cList}">
				<table>
					<thead>
						<tr>
							<th>쿠폰이미지</th>
							<th>쿠폰내용</th>
							<th>지급기간</th>
						</tr>
					</thead>
					<tbody>
				<c:forEach items="${cList}" var="cList">
				<tr>
					<td><a href="./viewOneCoupon.do?cseq=${cList.cseq}"><img src="${pageContext.request.contextPath}${cList.cthumbimg}"></a></td>
					<td>${cList.cnotify}</td>
					<td>
							<fmt:parseDate var="startDate" value="${cList.cdate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
							~
							<fmt:parseDate var="endDate" value="${cList.clastdate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
					</td>
				</tr>
<!-- 					<div id="storeCouponList_1"> -->
<!-- 						<div id="storeCouponList_cimg"> -->
<%-- 							<a href="./viewOneCoupon.do?cseq=${cList.cseq}"><img src="${pageContext.request.contextPath}${cList.cthumbimg}"></a> --%>
<!-- 						</div> -->
<!-- 						<div id="storeCouponList_cnotify"> -->
<%-- 						${cList.cnotify} --%>
<!-- 						</div> -->
<!-- 						<div id="storeCouponList_cdate"> -->
<%-- 							<fmt:parseDate var="startDate" value="${cList.cdate}" pattern="yyyy-MM-dd" /> --%>
<%-- 							<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" /> --%>
<!-- 							~ -->
<%-- 							<fmt:parseDate var="endDate" value="${cList.clastdate}" pattern="yyyy-MM-dd" /> --%>
<%-- 							<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" /> --%>
<!-- 						</div> -->
<!-- 					</div> -->
				</c:forEach>
				</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h3>현재 보유 쿠폰이 없습니다..</h3>
				<br />
				<h3>쿠폰을 등록해 주세요</h3>
			</c:otherwise>
		</c:choose>
		</div>
		<!-- 쿠폰등록 버튼 -->
		<div id="btn_insertCoupon">
			<input type="button" value="뒤로가기" onclick="backBtn()">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="쿠폰 등록" onClick="goInsertCoupon()">
		</div>
	</div>
</body>
</html>
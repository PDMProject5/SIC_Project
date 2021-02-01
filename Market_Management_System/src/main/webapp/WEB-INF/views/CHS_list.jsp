<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	
	#container{
		width: 80%;
		height: 100%;
		margin: 0 auto;
	}
	
	#coupon{
		float:left;
		text-align: center;
		width: 300px;
		height: 200px;
		margin-top: 60px;
		margin-bottom: 100px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 25px;
 		border: 2px solid black;
	}
	
	#couponListsCThumbimg{
		margin-top: 10px;
	}
	
	#btn_insertCoupon{
		width: 500px;
		margin-top: 500px;
		margin-right: 500px;
		margin-left: 700px;
		text-align: center;
	}
	
	img {
		height: 100px;
	
	}

	#btn_insert{
		height: 50px;
		color: #8A6F24;
		background-color: beige;
	}
	#btn_back{
		height: 50px;
		color: #8A6F24;
		background-color: beige;
	}
</style>
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
<%@ include file="./header.jsp" %>
<body>
	<div id="container">
			<c:choose>
				<c:when test="${not empty cList}">
					<c:forEach items="${cList}" var="cList">
						<div id = "coupon">
							<div id = "couponListsCThumbimg">
								<a href="./viewOneCoupon.do?cseq=${cList.cseq}">
									<img src="${pageContext.request.contextPath}${cList.cthumbimg}">
								</a>
							</div>
							<div id = "couponListsCNotify">
								${cList.cnotify}
							</div>
							<div id = "couponListsCDate">
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
				</c:otherwise>
			</c:choose>
		<!-- 쿠폰등록 버튼 -->
	</div>
	<div id="btn_insertCoupon">
		<input type="button" id = "btn_back" value="뒤로가기" onclick="backBtn()">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id = "btn_insert" value="쿠폰 등록" onClick="goInsertCoupon()">
	</div>
</body>
<%@ include file="./footer.jsp" %>
</html>
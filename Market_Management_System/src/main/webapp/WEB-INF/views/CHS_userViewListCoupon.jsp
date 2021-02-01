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
	
	#event{
		font-family: Arial, Helvetica, sans-serif;
		text-align: center;
	}
	
	#userViewCList{
		text-align: center;
		float:left;
		width: 300px;
		height: 200px;
		margin-top: 60px;
		margin-bottom: 100px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 25px;
 		border: 2px solid black;
	}
	
	#userViewCThumbimg{
		margin-top: 10px;
	}
	
	img {
		height: 100px;
	}
	
	@media screen and (max-width: 768px) {
		#userViewCList{
			text-align: center;
		}
		
		img {
			width: 150px; 
			height: 100px;
		}
	}
</style>
</head>
<%@ include file="./header.jsp" %>
<body>
	<h1 id = "event">진 행 중 인 행 사</h1>
	<div id = "container">
		<c:choose>
			<c:when test="${not empty ucvList}">
				<c:forEach items="${ucvList}" var="ucvList">
					<div id="userViewCList">
						<div id="userViewCThumbimg">
							<a href="./userViewOneCoupon.do?cseq=${ucvList.cseq}"> 
								<img src="${pageContext.request.contextPath}${ucvList.cthumbimg}">
							</a>
						</div>
						<div id="userViewCNotify">
							${ucvList.cnotify}
						</div>
						<div id="userViewCDate">
							<fmt:parseDate var="startDate" value="${ucvList.cdate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
							~
							<fmt:parseDate var="endDate" value="${ucvList.clastdate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h1>
					현재 진행 중인 이벤트가 없습니다.<br /> 
					다음에 다시 이용해 주세요. 감사합니다
				</h1>
				<br />
				<h3>☎문의전화 1544-1544☎</h3>
				<br />
			</c:otherwise>
		</c:choose>
	</div>
</body>
<%@ include file="./footer.jsp" %>
</html>
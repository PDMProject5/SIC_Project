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
	#storeCouponList{
			width: 70%;
			height: 70%;
			margin: 0 auto;
	}
	
	#couponList{
		margin: auto;
		margin-left: 60px;
		float: left;
	}
	
	table{
	 	padding: 30px; 
		text-align: center;
		height: 300px;
	}
	
	th,td{
		padding-bottom: 2px;
		padding-top: 2px;
	}
	
	img {
		height: 150px;
	
	}
</style>
</head>
<%@ include file="./header.jsp" %>
<body>
	<div id = "#container">
		<div>
			<c:choose>
				<c:when test="${not empty ucvList}">
					<c:forEach items="${ucvList}" var="ucvList">
						<div id = "couponList">
							<table>
								<tr>
									<td>
										<a href="./userViewOneCoupon.do?cseq=${ucvList.cseq}">
											<img src="${pageContext.request.contextPath}${ucvList.cthumbimg}">
										</a>
									</td>
								</tr>
								<tr>
									<td>${ucvList.cnotify}</td>
								</tr>
								<tr>
									<td>
										<fmt:parseDate var="startDate" value="${ucvList.cdate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
										~
										<fmt:parseDate var="endDate" value="${ucvList.clastdate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h1>현재 진행 중인 이벤트가 없습니다.<br/> 
					다음에 다시 이용해 주세요. 감사합니다 </h1><br/>
					<h3>☎문의전화 1544-1544☎</h3>
					<br />
				</c:otherwise>
			</c:choose>
	    </div>
    </div>
</body>
<%@ include file="./footer.jsp" %>
</html>
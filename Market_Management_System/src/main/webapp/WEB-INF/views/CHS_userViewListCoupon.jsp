<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#userViewCouponList{
		float: left;
		text-align: center;
	}
</style>
</head>
<body>
	<div id = "userViewCouponList">
		<div>
			<c:choose>
				<c:when test="${not empty ucvList}">
					<table>
						<thead>
							<tr>
								<th>쿠폰이미지</th>
								<th>쿠폰내용</th>
								<th>지급기간</th>
							</tr>
						</thead>
						<tbody>
					<c:forEach items="${ucvList}" var="ucvList">
					<tr>
						<td><a href="./userViewOneCoupon.do?cseq=${ucvList.cseq}"><img src="${pageContext.request.contextPath}${ucvList.cthumbimg}"></a></td>
						<td>${ucvList.cnotify}</td>
						<td>
								<fmt:parseDate var="startDate" value="${ucvList.cdate}" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />
								~
								<fmt:parseDate var="endDate" value="${ucvList.clastdate}" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
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
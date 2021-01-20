<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#myCouponList{
		float: left;
		text-align: center;
	}
</style>
<script type="text/javascript">

	function backBtn() {
		history.back();
	}
	
</script>
</head>
<%@ include file="header.jsp" %>
<body>
	<div id = "myCouponList">
		<div>
			<c:choose>
				<c:when test="${not empty cbList}">
					<table>
						<thead>
							<tr>
								<th>보유쿠폰</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cbList}" var="cbList">
								<tr>
									<td><img src="${pageContext.request.contextPath}${cbList.cthumbimg}"></td>
								</tr>
								<tr>
									<td>${cbList.cnotify}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<h1>현재 보유중인 쿠폰이 없습니다.</h1>
					<br />
					<h3>☎문의전화 1544-1544☎</h3>
					<br />
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<input type="button" value="뒤로가기" onclick="backBtn()">
</body>
<%@ include file="footer.jsp" %>
</html>
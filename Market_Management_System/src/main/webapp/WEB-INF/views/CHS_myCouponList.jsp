<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function backBtn() {
		history.back();
	}
	
</script>
</head>
<%@ include file="header.jsp" %>
<body>
<table>
	<thead>
		<tr>
			<th>보유쿠폰</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${cbList}" var="cbList">
	<tr>
		<td><img src = "${pageContext.request.contextPath}${cbList.cthumbimg}"></td>
	</tr>
	<tr>
		<td>${cbList.cnotify}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
<input type="button" value = "뒤로가기" onclick="backBtn()">
</body>
<%@ include file="footer.jsp" %>
</html>
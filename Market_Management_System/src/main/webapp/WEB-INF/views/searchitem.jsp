<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./searchitem.do" method="post">
<input type="text" id="iname" name="iname">
<input type="submit" value="검색">
</form>

<table border="1">
	<c:forEach var="itemlist" items="${searchlist}">
	<tr>
		<td onclick="location.href='./insertAutoOrderForm.do?iname=${itemlist.iname}'">
		${itemlist.iname}
		</td>
	</tr>
	</c:forEach>
</table>
<button onclick="location.href='./autoOrderform.do'">뒤로가기</button>
</body>
</html>
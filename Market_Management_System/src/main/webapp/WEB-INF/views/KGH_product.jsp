<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
</head>
<body>
	<table>
		<c:forEach var="vo" items="${list}" varStatus="vs">
			<tr>
				<td>
				제품명 : ${vo.iname}, 제품수량 : ${vo.stock}
				</td>	
			</tr>
		</c:forEach>
	</table>
</body>
</html>
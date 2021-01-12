<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세정보</title>
</head>
<body>
	<!-- form태그로 남겨둘테니 이따 가져갈 데이터 있으면 참고해서 가져가주세요! 화면 꾸미는건 나중에 -->
	<button onclick="location.href='javascript:history.back()'">뒤로가기</button>
	<form action="#" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="iname" value="${vo.iname}"/>제품명 : ${vo.iname}</td>
				<td><input type="hidden" name="oprice" value="${vo.oprice}"/>가격: ${vo.oprice}</td>
				<td>갯수: <input type="text" name="stock"/></td>
				<td><input type="submit" value="장바구니 담기"/></td>
			</tr>
		</table>
	</form>
</body>
</html>
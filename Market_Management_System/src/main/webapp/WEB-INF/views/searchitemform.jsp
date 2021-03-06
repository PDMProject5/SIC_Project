<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동 발주 제품 검색</title>
<%@ include file="./header.jsp" %>
<style type="text/css">
#container{
	width: 750px;
	text-align: center;
	margin: 30px auto;
}
table{
	width: 60%;
	margin: 25px auto;
	text-align: center;
}
input[type="text"]{
	width: 390px;
	height: 30px;
}
input[type="submit"]{
	height: 30px;
}
</style>
</head>
<script type="text/javascript">
function inamechk(){
	var iname = document.getElementById("iname");
	if(iname.value == ""){
		alert("조회할 제품을 입력해 주세요");
		return false;
	}else if(iname.value.length < 2){
		alert("검색 조건은 최소 두글자는 들어가야 합니다.");
		return false;
	}else{
		return true;
	}
}
</script>
<body>
<div id="container">
<form action="./searchitem.do" method="post" onsubmit="return inamechk()">
<input type="text" id="iname" name="iname">
<input class="btn" type="submit" value="검색">
</form>
<table border="1">
	<c:forEach var="itemlist" items="${lists}">
		<tr>
			<td height="30px;" onclick="location.href='./insertAutoOrderForm.do?iname=${itemlist}'">
				${itemlist}
			</td>
		</tr>
	</c:forEach>
</table>
<button class="btn" onclick="location.href='./autoOrderform.do'">뒤로가기</button>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>
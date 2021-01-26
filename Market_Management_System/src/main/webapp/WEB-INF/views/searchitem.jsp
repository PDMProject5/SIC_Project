<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<%@ include file="./header.jsp" %>
</head>
<script type="text/javascript">
window.onload = function(){
	var ptag = document.getElementById("ptag");
	var inamechk = document.getElementById("inamechk");
	if(inamechk.value == "[]"){
		ptag.innerHTML = "제품이 등록되있거나 매장에서 판매하지 않는 제품입니다.";
	}
}

function renamechk(){
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
<form action="./searchitem.do" method="post" onsubmit="return renamechk()">
<input type="hidden" id="inamechk" value="${searchlist}">
<input type="text" id="iname" name="iname">
<input class="btn" type="submit" value="검색">
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
<p id="ptag" style="color: red; margin-bottom: 0px; margin-top: 0px;"></p>
<button class="btn" onclick="location.href='./autoOrderform.do'">뒤로가기</button>
<%@ include file="./footer.jsp" %>
</body>
</html>
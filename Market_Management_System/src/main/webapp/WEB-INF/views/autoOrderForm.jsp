<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동 발주</title>
</head>
<%@ include file="./header.jsp" %>
<body>
<input type="hidden" id="listchk" value="${lists}">
<form>
	<table border="1">
		<thead>
		<tr>
			<th>제품명</th>
			<th>설정 개수</th>
			<th>입고 개수</th>
			<th><input type="checkbox" onclick="allchk(this.checked)" id="allcheck"></th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${lists eq '[]'}">
			<td colspan="4">등록된 제품이 없습니다.</td>
		</c:if>
		<c:forEach var="orderlist" items="${lists}">
		<tr>
			<td onclick="location.href='./autoOrderDetail.do?iname=${orderlist.iname}'">${orderlist.iname}</td>
			<td>${orderlist.autonum}</td>
			<td>${orderlist.ordernum}</td>
			<td>
				<input type="checkbox" name="chkbox" value="${orderlist.iname}" onclick="itemchk()">
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</form>
	<button onclick="location.href='./searchitemform.do'">자동 발주 등록</button>
	<button onclick="autoOrderDel()">자동 발주 삭제</button>
	<button onclick="location.href='./sellermain.do'">뒤로가기</button>
<script type="text/javascript">

	function allchk(chk){
		var chkbox = document.getElementsByName("chkbox");
		if(chk == true){
			for (var i = 0; i < chkbox.length; i++) {
				chkbox[i].checked = true;
			}
		}else if(chk == false){
			for (var i = 0; i < chkbox.length; i++) {
				chkbox[i].checked = false;
			}
		}
	}
	
	function itemchk(){
		var chkbox = document.getElementsByName("chkbox");
		var allcheck = document.getElementById("allcheck");
		var chklen = chkbox.length;
		var cnt = 0;
		for (var i = 0; i < chkbox.length; i++) {
			if(chkbox[i].checked == true){
				cnt++;
			}else{
				cnt--;
			}
		}
		if(cnt == chklen){
			allcheck.checked = true;
		}else{
			allcheck.checked = false;
		}
	}
		
	
	function autoOrderDel(){
		var itemlist = "";
		var cnt = 0;
		var chkbox = document.getElementsByName("chkbox");
		var choice = confirm("자동발주를 삭제하시겠습니까?");
		var listchk = document.getElementById("listchk");
		if(choice == true){
		for (var i = 0; i < chkbox.length; i++) {
			if(chkbox[i].checked == true){
				itemlist +=  chkbox[i].value+",";
				cnt ++;
			}
		}
		if(listchk.value == '[]'){
			alert("등록된 제품이 없습니다.");
		}else if(cnt == 0){
			alert("한개 이상의 체크박스를 선택해 주세요.");
		}else{
			location.href="./autoOrderDel.do?itemlist="+itemlist;
		}
	}
}
</script>
</body>
<%@ include file="./footer.jsp" %>
</html>
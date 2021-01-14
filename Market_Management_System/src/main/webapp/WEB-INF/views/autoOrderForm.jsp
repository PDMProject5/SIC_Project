<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동 발주</title>
</head>
<body>
<form action="">
	<table border="1">
		<thead>
		<tr>
			<th>제품명</th>
			<th>설정 개수</th>
			<th>입고 개수</th>
			<th><input type="checkbox" onclick="allchk(this.checked)" id="allcheck"></th>
		</tr>
		</thead>
		<c:forEach var="orderlist" items="${lists}">
		<tbody>
		<tr>
			<td onclick="location.href='./autoOrderDetail.do?iname=${orderlist.iname}'">${orderlist.iname}</td>
			<td>${orderlist.autonum}</td>
			<td>${orderlist.ordernum}</td>
			<td>
				<input type="checkbox" name="chkbox" value="${orderlist.iname}">
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
	
	function autoOrderDel(){
		var itemlist = "";
		var cnt = 0;
		var chkbox = document.getElementsByName("chkbox");
		var choice = confirm("자동발주를 삭제하시겠습니까?");
		if(choice == true){
		for (var i = 0; i < chkbox.length; i++) {
			if(chkbox[i].checked == true){
				itemlist +=  chkbox[i].value+",";
				cnt ++;
			}
		}
		if(cnt == 0){
			alert("한개 이상의 체크박스를 선택해 주세요.");
		}else{
			location.href="./autoOrderDel.do?itemlist="+itemlist;
		}
	}
}
</script>
</body>
</html>
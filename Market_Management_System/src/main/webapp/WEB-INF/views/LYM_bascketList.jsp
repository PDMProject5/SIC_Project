<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<h1>장바구니</h1>
<div id="container">
	<form action="#" method="post" id="frm" name="frm" onsubmit="return chkbox();">
		<div class="panel-group" id="accordion">
			<table id="del" class="table table-bordered">
				<thead>	
	
					<tr>
						<th><input type="checkbox" onclick="checkAll(this.checked)"></th>
						<th>제품정보</th>
						<th>수량</th>
						<th>제품금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${lists}" varStatus="vs">		
						<tr>
							<td><input type='checkbox' name='chkVal' value='${dto.odnum}'></td>
							<td>	
								<strong><a href="productDetail.do?iname=${dto.iname}">${dto.iname}</a></strong><br>
								${dto.oprice} 원
							</td>
							<td>${dto.odstock}</td>
							<td>
								<span id="price">
								<c:set var="odto" value="${dto.odstock}"/>
								<c:set var="rdto" value="${dto.oprice*odto}"/>
								<c:out value="${rdto}"/> 
								</span>
								<span>원</span>
							</td>
						</tr>
							<c:set var="sum" value="${sum+rdto}"/> 
					</c:forEach>						
								
				</tbody>		
			</table>
				<div>
					<input type="button" value="선택 삭제" onclick="del()">
				</div>
				
				<div>
					<h2>
					<span>총 주문 금액:</span>
					<span id=""><c:out value="${sum}"/> </span>원
					</h2>
				</div>
				
				<div>
					<input class="btn-success btn btn-primary" type="button" value="쇼핑 계속하기" onclick="shopping()">
					<input class="btn-success btn btn-primary" type="button" value="주문하기" onclick="">
				</div>
		</div>
	</form>
</div>

</body>
<script type="text/javascript">
function shopping(){
	location.href="product.do";
}

function checkAll(bool){

	var chkval = document.getElementsByName('chkVal'); 
	
	for (var i = 0; i < chkval.length; i++) {
		chkval[i].checked = bool;
		
	}
}

function chkbox(){
	var chkval = document.getElementsByName('chkVal');
	var n = 0;
	for (var i = 0; i < chkval.length; i++) {
		if(chkval[i].checked){
			n++;
		}
	}
	if(n>0){
		document.getElementById("frm").action = "./multiDel.do";
	}else{
		return false;
	}
		
}

</script>

</html>
<%@page import="com.sic.pdm.vo.bascket.BascketVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<head>
<%@ include file="./header.jsp" %>
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
					<c:if test="${not empty lists}" >
					<tr>
						<th><input type="checkbox" id="allchk" onclick="checkAll(this.checked)" checked></th>
						<th>제품정보</th>
						<th>수량</th>
						<th>제품금액</th>
					</tr>
					</c:if>
				</thead>
				<tbody>
					
					<c:forEach var="dto" items="${lists}" varStatus="vs">		
						<tr>
							<td>
								<input type='checkbox' id="chkVal" name='chkVal' value='${dto.odnum}' checked>
							</td>
							<td>	
								<strong><a  href="productDetail.do?iname=${dto.iname}">${dto.iname}</a></strong><br>
								${dto.oprice} 원
							</td>
							<td>
								<a >${dto.odstock}</a>&nbsp;개&nbsp;
								<input type="button" value="변경" onclick="modifyStock(${dto.odnum})">
							</td>
							<td>
								<c:set var="odto" value="${dto.odstock}"/>
								<c:set var="rdto" value="${dto.oprice*odto}"/>
								<span id="price" class="price">
								<c:out  value="${rdto}"/> 
								</span>
								<span>원</span>
							</td>
						</tr>
							<c:if test="${dto.odnum ne null}"> <!-- 체크박스 체크된것만 --> 
								<c:set var="sum" value="${sum+rdto}"/> 							
							</c:if>
					</c:forEach>						
							
				</tbody>
							
			</table>
				<c:if test="${empty lists}">
						<h3>장바구니에 담긴 제품이 없습니다..</h3>
				</c:if>	
				<c:if test="${not empty lists}" >
				<div>
					<input type="submit" value="선택 삭제">
				</div>
					
				<div>
					<h2>
					<span>총 주문 금액:</span>
					<span id="oprice"><c:out value="${sum}"/></span>원
					</h2>
				</div>
				</c:if>
				<div>
					<input class="btn-success btn btn-primary" type="button" value="쇼핑 계속하기" onclick="shopping()">
					<c:if test="${not empty lists}" >
					<input class="btn-success btn btn-primary" type="button" value="주문하기" onclick="order()">
					</c:if>
				</div>
		</div>
	</form>
</div>
	<div id="modifyStock" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수량 변경</h4>
				</div>
				<div class="modal-body">
					<form action="#" class="form-margin" method="post" id="StoUpdate"></form>
				</div>
				
			</div>

		</div>
	</div>


</body>
<%@ include file="./footer.jsp" %>
<script type="text/javascript">
	
function sum(){
	var chkval = document.getElementsByName('chkVal');
	var n = 0;
	var sum = 0;

	// 체크박스를 클릭했을때 일어나는 기능이어야해
		// chkva.length 체크박스 개수만큼 돌아감 ex)length가 2라면 두번돌아감
		for (var i = 0; i < chkval.length; i++) {
			
			// [0] true라면  n =4050 sum [1] true => 4050+1500 =6550   4050+6550 => 11100나옴 
			if (chkval[i].checked == true) {
				n+= Number($(".price").eq(i).text());
	
			}
				
		}
	
			sum= n;
			$("#oprice").html(sum);		

}

function modifyStock(val){
	ajaxModify(val);
	$('#modifyStock').modal();
}

var ajaxModify = function(val){
	$.ajax({
		url : './modifyStock.do',
		method : 'post',
		data:"odnum="+val,
		dataType : 'json',
		success : function(v){
			console.log(v.onum, v.iname, v.oprice);
		 html = "<div class='form-group'>";
         html += "<input type='hidden' id='odnum' name='odnum' value='"+v.odnum+"' />";
         html += "<input type='hidden' id='iname' name='iname' value='"+v.iname+"'/>";
         html += "<input type='hidden' id='oprice' name='oprice' value='"+v.oprice+"' />";
            
        html += "<table>";
		html += "<tr>";
		html += "</tr>";			
		html += "<tr>";
		html += "<td>제품명: <input type='text' id='iname' name='iname' value='"+v.iname+"' readonly='readonly'></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>가격: <input type='text' id='oprice' name='oprice' value='"+v.oprice+"' readonly='readonly'></td>";
		html += "</tr>";						
		html += "<tr>";
		html += "<td>";
		html += "갯수: <input type='button' value='-' onclick='minus()'>";
		html += "			<input type='text' id='odstock' name='odstock' value='1'>";
		html += "			<input type='button' value='+' onclick='plus()'>";
		html += "		</td>";
		html += "	</tr>";
		html += "</table>";
		html += "</div>";
		html += "<div class='modal-footer'>";
		html += "	<button type='button' class='btn btn-default' data-dismiss='modal' onclick='modStock()'>확인</button>";
		html += "	<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
		html += "</div>";						
       
		 $('#StoUpdate').html(html);
		    
		},
		error: function(){
			alert("잘못된 요청입니다.");
		}
	});
}

function modStock(){
	var odstock = document.getElementById("odstock").value;
	var odnum = document.getElementById("odnum").value;
	console.log(odstock,odnum);
	var frm = document.getElementById("StoUpdate");
	frm.action = "./StoUpdate.do";
	frm.submit();
}	

	function shopping() {
		location.href = "product.do";
	}

	function checkAll(bool) {
		var chkval = document.getElementsByName('chkVal');
		for (var i = 0; i < chkval.length; i++) {
			chkval[i].checked = bool;
			sum();
		}
	}

	var chs = document.getElementsByName("chkVal");
	var allCheck = document.getElementById("allchk");
	for (var i = 0; i < chs.length; i++) {
		chs[i].onclick = function() {
			if (chs.length == chsConfirm()) {
				allCheck.checked = true;
				sum();
			} else {
				allCheck.checked = false;
				sum();
			}
			
			
		}
	}

	function chsConfirm() {
		var chs = document.getElementsByName("chkVal");
		var cnt = 0;
		for (var i = 0; i < chs.length; i++) {
			if (chs[i].checked) {
				cnt++;
			}
		}
		return cnt;
	}


	
	function chkbox() {
		var chkval = document.getElementsByName('chkVal');
		var n = 0;
		
		for (var i = 0; i < chkval.length; i++) {
			if (chkval[i].checked) {
				n++;
				sum();
			}
		}
		
		
		if (n > 0) {
			var con = confirm("선택한 제품을 삭제하시겠습니까?");
			if(con){
				
			document.getElementById("frm").action = "./multiDel.do";
			}else{
				return false;
			}

		}else if(n == 0){
				alert("제품이 존재하지 않습니다.");
				return false;
		}else if(n == chkval.length){
			var con = confirm("선택한 제품을 삭제하시겠습니까?");
			if(con){
				
			document.getElementById("frm").action = "./multiDel2.do";
			}else{
				return false;
			}
		} 
		
		else {
			alert("삭제할 제품을 선택해 주세요.");
			return false;
		}

	}

	
	function order(){ // onum값만 넘겨서 쿼리문 select where onum and ostate='B' 인것만 전달
		var frm = document.getElementById("frm");
		var chkval = document.getElementsByName('chkVal');
		var n = 0;
		
		
		for (var i = 0; i < chkval.length; i++) {
			if (chkval[i].checked) {
				n++;
			}
		}

		if (n > 0) {
			frm.action = "./order.do";
			frm.submit();
		} else {
			alert("주문하실 상품을 선택해 주세요.");
			return false;
		}		
	}
	
	
	
	function minus(){
		var stock = document.getElementById("odstock").value;
		if(stock > 1){ // 2 3 4 5
			document.getElementById("odstock").value = parseInt(stock) -1 ;		
		}
		
		
	}

	function plus(){	
		var pstock = document.getElementById("odstock").value;
			
		document.getElementById("odstock").value = parseInt(pstock) + 1;
		console.log(pstock);
		
		
	}
	
	
	
</script>

</html>
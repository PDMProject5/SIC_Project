<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>제품 상세정보</title>
<style type="text/css">
	table{
		margin: auto; 
 	text-align: center; 
	margin-top:10px; 
/* 	border-top:5px solid beige;  */
	margin-bottom: 10px;
	}
	#th{
	background-color : beige;
	text-align:center; 
	color:#8A6F24; 
	height: 70px;
	width: 200px;
	
/* 	background-color: beige; */
/* 	text-align: center; */
/* 	height: 70px; */
/* 	width: 100px; */
}
	td{
		border-bottom:1px solid #dadada; 
	text-align:center; 
	color:#2f231c; 
	height: 50px;
	width: 300px;
	}
	#result {
		text-align: center;
		margin: auto;
	}
	.counter{
		text-align: center;
		margin-bottom: 10px;
	}
	.cart {
	text-align: center;
	color: beige;
	background-color: #8A6F24;
	border: 2px solid #8A6F24;
	padding: 15px 15px;
	border-radius: 8px;
	transition-duration: 0.4s;
 	 cursor: pointer;
	}
	.button1 {
 	 background-color: #8A6F24; 
 	 color: beige; 
 	 border: 2px solid #8A6F24;
	}
	.button1:hover {
  	background-color: beige;
  	color: #8A6F24;
	}
	.back{
	text-align: center;
	color: #8A6F24;
	background-color: beige;
	border: 2px solid #8A6F24;
	padding: 15px 30px;
	border-radius: 8px;
	transition-duration: 0.4s;
 	 cursor: pointer;
	}
	
	.button2 {
 	 background-color: beige; 
 	 color: #8A6F24; 
 	 border: 2px solid #8A6F24;
	}
	.button2:hover {
  	background-color: #8A6F24;
  	color: beige;
	}
	
	#odstock{
	text-align: center;
	}
	.btnminus{
		border: 2px solid #8A6F24;
		padding: 4px 9px;
		background-color:beige;
		color: #8A6F24;
		border-radius: 8px;
	}
	.btnplus{
		border: 2px solid #8A6F24;
		padding: 4px 8px;
		background-color:beige;
		color: #8A6F24;
		border-radius: 8px;
	}
	.button{
		margin: 10px 10px;
		text-align: center;
	}
</style>
</head>
<%@ include file="./header.jsp" %>
<body>
	<!-- form태그로 남겨둘테니 이따 가져갈 데이터 있으면 참고해서 가져가주세요! 화면 꾸미는건 나중에 -->
	
	<form action="./insertBascket.do" method="post" id="bascket">
			<input type="hidden" id="stock" name="stock" value="${vo.stock}">
			<input type="hidden" id="icode" name="icode" value="${vo.icode}">

		<table>
			<tr>
				<th id="th"><input type="hidden" name="iname" value="${vo.iname}"/>제품명 </th>
				<th id="th"><input type="hidden" id="oprice" name="oprice" value="${vo.oprice}"/>가격</th>
			</tr>
			<tr>
				<td>${vo.iname}</td>
				<td>${vo.oprice}</td>
			</tr>
		</table>
			<div class="counter">갯수: 
				<input type="button" value="-" onclick="minus()" class="btnminus">
				<input type="text" id="odstock" name="odstock" value="1">
				<input type="button" value="+" onclick="plus()" class="btnplus">
			</div>
			<div id="result">
				<span>제품명 : ${vo.iname}</span><br>
				<span>총 수량 개수 : </span>
				<span id="rstock" class="rstock"> 개</span><br>
				<span>총 제품금액 : </span> 
				<span id="rmoney"></span>
			</div>
			<div class="button">
				<input type="submit" value="장바구니 담기" class="cart button1"/>
				<input type="button" onclick="location.href='javascript:history.back()'" value="뒤로가기" class="back button2"/>
			</div>
	</form>
</body>
<%@ include file="./footer.jsp" %>
<script type="text/javascript">
var stock = document.getElementById("odstock").value;
var oprice = document.getElementById("oprice").value;
$('#rstock').html(document.getElementById("odstock").value+" 개");
$('#rmoney').html(oprice*document.getElementById("odstock").value+" 원");

function minus(){
	var stock = parseInt(document.getElementById("odstock").value);
	if(stock > 1){ // 2 3 4 5
		document.getElementById("odstock").value = stock -1 ;		
	}
	$('#rstock').html(document.getElementById("odstock").value);
	$('#rstock').append(" 개");
	
	var oprice = document.getElementById("oprice").value;
	$('#rmoney').html(oprice*document.getElementById("odstock").value);
	$('#rmoney').append(" 원");
}

function plus(){	
	var pstock = parseInt(document.getElementById("odstock").value);
	var stock = parseInt(document.getElementById("stock").value);
	if(pstock < stock){
		
		document.getElementById("odstock").value = pstock + 1;
	}else if(pstock>= stock){
		alert("해당 제품의 재고 수량이 부족합니다.");
	}
	$('#rstock').html(document.getElementById("odstock").value);
	$('#rstock').append(" 개");
	var oprice = document.getElementById("oprice").value;
	$('#rmoney').html(oprice*document.getElementById("odstock").value);
	$('#rmoney').append(" 원");

}

function insBascket(){
	var frm = document.getElementByid("bascket");
	var con = confirm("장바구니에 상품을 담았습니다.\n 장바구니로 이동하시겠습니까?");
	frm.action();
	if(con){
		
		location.href="./bascketList.do";
	}
}



</script>
</html>